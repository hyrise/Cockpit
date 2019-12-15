"""Module for managing databases."""
from os import getenv

from zmq import REP, Context

from hyrisecockpit import settings as s

from .db_object import DbObject
from .driver import Driver

NUMBER_THREADS = 8
SUB_URL = getenv("WORKER_SUB_URL")
REP_URL = getenv("MANAGER_REP_URL")

responses = {
    200: {"header": {"status": 200, "message": "OK"}, "body": {}},
    400: {"header": {"status": 400, "message": "BAD REQUEST"}, "body": {}},
}


class DatabaseManager(object):
    """A manager for database drivers."""

    def __init__(self):
        """Initialize a DatabaseManager."""
        self._databases = dict()
        self._server_calls = {
            "add database": self._call_add_database,
            "throughput": self._call_throughput,
        }
        self._init_server()

    def _init_server(self):
        self._context = Context(io_threads=1)
        self._socket = self._context.socket(REP)
        self._socket.bind(
            "tcp://{:s}:{:s}".format(s.DB_MANAGER_HOST, s.DB_MANAGER_PORT)
        )

    def _call_add_database(self, body):
        """Add database and initialize driver for it."""
        driver = Driver(
            user=body["user"],
            password=body["password"],
            host=body["host"],
            port=body["port"],
            dbname=body["dbname"],
            n_threads=body["n_threads"],
        )
        db_instance = DbObject(NUMBER_THREADS, driver, SUB_URL)
        self._databases[body["id"]] = db_instance
        self._throughput[body["id"]] = 0
        return responses[200]

    def _call_throughput(self, body):
        """Get the throughput of all databases."""
        for database, database_object in self._databases.items():
            self._throughput[database] = database_object.get_throughput_counter()
        response = responses[200]
        response["body"]["throughput"] = self._throughput
        return response

    def _call_not_found(self, body):
        return responses[400]

    def start(self):
        """Start and run the manager by enabling IPC."""
        print(
            "Database manager running on {:s}:{:s}. Press CTRL+C to quit.".format(
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


def main():
    """Run a database manager."""
    DatabaseManager().start()


if __name__ == "__main__":
    main()
