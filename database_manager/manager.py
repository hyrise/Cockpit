"""Module for managing databases."""

from redis import Redis
from zmq import REP, Context

import settings as s
from driver import DatabaseDriver

responses = {
    200: {"header": {"status": 200, "message": "OK"}, "body": {}},
    400: {"header": {"status": 400, "message": "BAD REQUEST"}, "body": {}},
}


class DatabaseManager(object):
    """A manager for database drivers."""

    def __init__(self):
        """Initialize a DatabaseManager."""
        self._drivers = dict()
        self._shutdown_requested = False
        self._server_calls = {
            "add driver": self._call_add_driver,
            "pop driver": self._call_pop_driver,
            "get drivers": self._call_get_drivers,
            "execute": self._call_execute,
            "executemany": self._call_executemany,
            "executelist": self._call_executelist,
            "throughput": self._call_throughput,
            "queue length": self._call_queue_length,
            "storage": self._call_storage,
            "shutdown": self._call_shutdown,
        }
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
        return DatabaseDriver  # TODO remove this method

    def _check_id_free(self, id):
        if id in self._drivers.keys():
            return False
        return True

    def _call_add_driver(self, body):
        """Add a database driver to the manager."""
        id = body["id"]
        db_type = self._get_db_type(body["db_type"])
        if not db_type:
            return responses[400]
        if not self._check_id_free(id):
            return responses[400]
        self._drivers[id] = db_type(
            id,
            body["user"],
            body["password"],
            body["host"],
            body["port"],
            body["dbname"],
            self._redis_connection,
        )
        return responses[200]

    def _call_pop_driver(self, body):
        """Remove a database driver from the manager."""
        id = body["id"]
        if not self._check_id_free(id):
            del self._drivers[id]
            return responses[200]
        return responses[400]

    def _call_get_drivers(self, body):
        response = responses[200]
        response["body"] = {"ids": list(self._drivers.keys())}
        return response

    def _call_execute(self, body):
        for id in self._drivers.keys():
            self._drivers[id].task_execute(body["query"], body["vars"])
        return responses[200]

    def _call_executemany(self, body):
        for id in self._drivers.keys():
            self._drivers[id].task_executemany(body["query"], body["vars_list"])
        return responses[200]

    def _call_executelist(self, body):
        for id in self._drivers.keys():
            self._drivers[id].task_executelist(body["querylist"])
        return responses[200]

    def _call_throughput(self, body):
        result = dict()
        for id in self._drivers.keys():
            result[id] = self._drivers[id].throughput
        response = responses[200]
        response["body"] = result
        return response

    def _call_queue_length(self, body):
        result = dict()
        for id in self._drivers.keys():
            result[id] = self._drivers[id].queue_length
        response = responses[200]
        response["body"] = result
        return response

    def _call_storage(self, body):
        result = dict()
        for id in self._drivers.keys():
            result[id] = self._drivers[id].storage
        response = responses[200]
        response["body"] = result
        return response

    def _call_shutdown(self, body):
        self._shutdown_requested = True
        return True

    def _call_not_found(self, body):
        return responses[400]

    def _run(self):
        """Run the manager by enabling IPC."""
        print(
            "Database manager running on {:s}:{:4d}. Press CTRL+C to quit.".format(
                s.DB_MANAGER_HOST, s.DB_MANAGER_PORT
            )
        )
        while True:
            # Get the message
            request = self._socket.recv_json()

            # Handle the call
            response = self._server_calls.get(
                request["header"]["message"], self._call_not_found
            )(request["body"])

            # Send the reply
            self._socket.send_json(response)

            # Shutdown
            if self._shutdown_requested:
                break


def main():
    """Run a database manager."""
    DatabaseManager()


if __name__ == "__main__":
    main()
