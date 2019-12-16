"""Module for managing databases."""

import sys

from zmq import REP, Context

from custom_exceptions import IdNotValidException
from database import Database
from driver import Driver
from hyrisecockpit import settings as s

responses = {
    200: {"header": {"status": 200, "message": "OK"}, "body": {}},
    400: {"header": {"status": 400, "message": "BAD REQUEST"}, "body": {}},
    500: {"header": {"status": 500, "message": "INTERNAL SERVER ERROR"}, "body": {}},
}


def get_response(code):
    """Return a blueprint of a response."""
    return responses.get(
        code,
        {"header": {"status": 500, "message": "INTERNAL SERVER ERROR"}, "body": {}},
    )


class DatabaseManager(object):
    """A manager for database drivers."""

    def __init__(self):
        """Initialize a DatabaseManager."""
        self._databases = dict()
        self._server_calls = {
            "add database": self._call_add_database,
            "throughput": self._call_throughput,
            "storage": self._call_storage,
            "system data": self._call_system_data,
            "delete database": self._call_delete_database,
            "queue length": self._call_queue_length,
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
        # validating connection data
        try:
            # Will throw an exeption if not valid
            Driver.validate_connection(body)
            new_id = body["id"] in self._databases
            if new_id:
                raise IdNotValidException("Id not valid")
        except Exception as e:
            response = get_response(400)
            response["body"] = str(e)
            return response

        db_instance = Database(
            body, "tcp://{:s}:{:s}".format(s.WORKLOAD_SUB_HOST, s.WORKLOAD_PUBSUB_PORT),
        )
        self._databases[body["id"]] = db_instance
        return get_response(200)

    def _call_throughput(self, body):
        """Get the throughput of all databases."""
        throughput = {}
        for database, database_object in self._databases.items():
            throughput[database] = database_object.get_throughput_counter()
        response = get_response(200)
        response["body"]["throughput"] = throughput
        return response

    def _call_storage(self, body):
        storage = {}
        for database, database_object in self._databases.items():
            storage[database] = database_object.get_storage_data()
        response = get_response(200)
        response["body"]["storage"] = storage
        return response

    def _call_system_data(self, body):
        system_data = {}
        for database, database_object in self._databases.items():
            system_data[database] = database_object.get_system_data()
        response = get_response(200)
        response["body"]["system_data"] = system_data
        return response

    def _call_queue_length(self, body):
        queue_length = {}
        for database, database_object in self._databases.items():
            queue_length[database] = database_object.get_queue_length()
        response = get_response(200)
        response["body"]["queue_length"] = queue_length
        return response

    def _call_delete_database(self, body):
        database = self._databases.pop(body["id"], None)
        if not database:
            return get_response(400)
        database.exit()
        del database
        return get_response(200)

    def _call_not_found(self, body):
        return get_response(200)

    def _exit(self):
        """Perform clean exit on all databases."""
        for database_object in self._databases.values():
            database_object.exit()

    def start(self):
        """Start the manager by enabling IPC."""
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
                if len(self._databases) > 0:
                    self._exit()
                sys.exit()


def main():
    """Run a database manager."""
    DatabaseManager().start()


if __name__ == "__main__":
    main()
