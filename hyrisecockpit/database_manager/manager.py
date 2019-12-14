"""Module for managing databases."""

import sys

from zmq import REP, Context

import settings as s
from db_object import DbObject
from driver import Driver


def create_response(code):
    """Create new response dictionary."""
    if code == 200:
        return {"header": {"status": 200, "message": "OK"}, "body": {}}
    if code == 400:
        return {"header": {"status": 400, "message": "BAD REQUEST"}, "body": {}}
    else:
        return {
            "header": {"status": 500, "message": "INTERNAL SERVER ERROR"},
            "body": {},
        }


class DatabaseManager(object):
    """A manager for database drivers."""

    def __init__(self):
        """Initialize a DatabaseManager."""
        self._drivers = dict()
        self._server_calls = {
            "add database": self._call_add_database,
            "throughput": self._call_throughput,
            "storage": self._call_storage,
        }
        self._init_server()
        self._run()

    def _init_server(self):
        self._context = Context(io_threads=1)
        self._socket = self._context.socket(REP)
        self._socket.bind(
            "tcp://{:s}:{:s}".format(s.DB_MANAGER_HOST, s.DB_MANAGER_PORT)
        )
        self._run()

    def _call_add_database(self, body):
        """Add database and initialize driver for it."""
        n_additional_connection = 1
        valid, error = Driver.validate_connection(body)
        if not valid:
            response = create_response(400)
            response["body"] = error
            return response
        driver = Driver(
            user=body["user"],
            password=body["password"],
            host=body["host"],
            port=body["port"],
            dbname=body["dbname"],
            n_connections=int(body["n_threads"]) + n_additional_connection,
        )
        db_instance = DbObject(
            int(body["n_threads"]),
            driver,
            "tcp://{:s}:{:s}".format(s.WORKLOAD_SUB_HOST, s.WORKLOAD_PUBSUB_PORT),
        )
        self._drivers[body["id"]] = db_instance
        return create_response(200)

    def _call_throughput(self, body):
        """Get the throughput of all databases."""
        throughput = {}
        for database, database_object in self._drivers.items():
            throughput[database] = database_object.get_throughput_counter()
        response = create_response(200)
        response["body"]["throughput"] = throughput
        return response

    def _call_storage(self, body):
        storage = {}
        for database, database_object in self._drivers.items():
            storage[database] = database_object.get_storage_data()
        response = create_response(200)
        response["body"]["storage"] = storage
        return response

    def _call_not_found(self, body):
        return create_response(400)

    def _clean_exit(self):
        """Perform clean exit on all databases."""
        for database_object in self._drivers.values():
            database_object.clean_exit()

    def _run(self):
        """Run the manager by enabling IPC."""
        print(
            "Database manager running on {:s}:{:s}. Press CTRL+C to quit.".format(
                s.DB_MANAGER_HOST, s.DB_MANAGER_PORT
            )
        )
        while True:
            try:
                # Get the message
                request = self._socket.recv_json()

                # Handle the call
                response = self._server_calls.get(
                    request["header"]["message"], self._call_not_found
                )(request["body"])

                # Send the reply
                self._socket.send_json(response)

            except KeyboardInterrupt:
                print("interrupt recived")
                if len(self._drivers) > 0:
                    self._clean_exit()
                    sys.exit()
                sys.exit()


def main():
    """Run a database manager."""
    DatabaseManager()


if __name__ == "__main__":
    main()
