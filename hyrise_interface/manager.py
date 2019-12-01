"""Module for managing databases."""

from json import dumps, loads

from redis import Redis
from zmq import REP, Context

import settings as s
from driver import HyriseDriver

responses = {
    200: {"header": {"status": 200, "message": "OK"}},
    400: {"header": {"status": 400, "message": "BAD REQUEST"}},
}


class DatabaseManager(object):
    """A manager for database drivers."""

    def __init__(self):
        """Initialize a DatabaseManager."""
        self._shutdown_requested = False
        self._init_redis_connection()
        self._init_server()
        self._run()

    def _init_redis_connection(self):
        self._redis_connection = Redis(
            s.QUEUE_HOST, s.QUEUE_PORT, s.QUEUE_DB, s.QUEUE_PASSWORD
        )

    def _init_server(self):
        self._drivers = dict()
        self._context = Context(io_threads=1)
        self._socket = self._context.socket(REP)
        self._socket.bind(
            "tcp://{:s}:{:s}".format(s.DB_MANAGER_HOST, s.DB_MANAGER_PORT)
        )
        self._run()

    def _get_db_type(self, db_type):
        if db_type == "Hyrise":
            return HyriseDriver
        return False

    def _check_id_free(self, id):
        if id in self._drivers.keys():
            return False
        return True

    def _add_driver(self, db_type, id, user, password, host, port, dbname):
        """Add a database driver to the manager."""
        db_type = db_type = self._get_db_type(db_type)
        if not db_type:
            return False
        if not self._check_id_free(id):
            return False
        self._drivers[id] = db_type(
            id, user, password, host, port, dbname, self._redis_connection
        )
        return id

    def _pop_driver(self, id):
        """Remove a database driver from the manager."""
        if not self._check_id_free(id):
            del self._drivers[id]
            return id
        return False

    def _handle_request(self, request):
        if request["header"]["message"] == "add driver":
            result = self._add_driver(
                request["body"]["db_type"],
                request["body"]["id"],
                request["body"]["user"],
                request["body"]["password"],
                request["body"]["host"],
                request["body"]["port"],
                request["body"]["dbname"],
            )
            if request["header"]["message"] == "pop driver":
                result = self._pop_driver(request["body"]["id"])

            if request["header"]["message"] == "shutdown":
                self._shutdown_requested = False
        return result

    def _run(self):
        """Run the manager by enabling IPC."""
        while True:
            # Get the message
            message = self._socket.recv()
            request = loads(message)

            response = responses[200]
            if not self._handle_request(request):
                response = responses[400]

            # Send the reply
            reply = dumps(response)
            self._socket.send_string(reply)

            # Shutdown
            if self._shutdown_requested:
                break
