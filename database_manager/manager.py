"""Module for managing databases."""

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
        self._drivers = dict()
        self._shutdown_requested = False
        self._init_redis_connection()
        self._init_server()
        self._run()

    def _init_redis_connection(self):
        self._redis_connection = Redis(
            s.QUEUE_HOST, s.QUEUE_PORT, s.QUEUE_DB, s.QUEUE_PASSWORD
        )

    def _init_server(self):
        self._context = Context(io_threads=1)
        self._socket = self._context.socket(REP)
        self._socket.bind(
            "tcp://{:s}:{:4d}".format(s.DB_MANAGER_HOST, s.DB_MANAGER_PORT)
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

    def _execute(self, query, vars=None):
        for id in self._drivers.keys():
            self._drivers[id].execute(query, vars)
        return True

    def _executemany(self, query, vars_list):
        for id in self._drivers.keys():
            self._drivers[id].executemany(query, vars_list)
        return True

    def _executelist(self, querylist):
        for id in self._drivers.keys():
            self._drivers[id].executelist(querylist)
        return True

    def _throughput(self):
        result = dict()
        for id in self._drivers.keys():
            result[id] = self._drivers[id].throughput
        return result

    def _queue_length(self):
        result = dict()
        for id in self._drivers.keys():
            result[id] = self._drivers[id].queue_length
        return result

    def _handle_request(self, request):
        call = request["header"]["message"]
        body = request["body"]

        if call == "add driver":
            result = self._add_driver(
                body["db_type"],
                body["id"],
                body["user"],
                body["password"],
                body["host"],
                body["port"],
                body["dbname"],
            )
            if call == "pop driver":
                result = self._pop_driver(body["id"])

            if call == "execute":
                result = self._execute(body["query"], body["vars"])

            if call == "executemany":
                result = self._execute(body["query"], body["vars_list"])

            if call == "executelist":
                result = self._execute(body["query_list"])

            if call == "throughput":
                result = self._throughput()

            if call == "queue length":
                result = self._queue_length()

            if call == "shutdown":
                self._shutdown_requested = True

        return result

    def _run(self):
        """Run the manager by enabling IPC."""
        print("Database manager running. Press CTRL+C to quit.")
        while True:
            # Get the message
            request = self._socket.recv_json()

            result = self._handle_request(request)
            if result is False:
                response = responses[400]
            elif result is True:
                response = responses[200]
            else:
                response["body"] = result

            # Send the reply
            self._socket.send_json(response)

            # Shutdown
            if self._shutdown_requested:
                break
