"""The data base manager is managing all databases."""
import sys

import psycopg2
import zmq

from db_object import DbObject
from driver import Driver

NUMBER_THREADS = 8
SUB_URL = ""  # please add subscriber Socket url
REP_URL = ""  # please add reply socket url

responses = {
    200: {"header": {"status": 200, "message": "OK"}},
    400: {"header": {"status": 400, "message": "BAD REQUEST"}},
}


class DbManager(object):
    """DbManager."""

    def __init__(self):
        """Initialize a DatabaseManager."""
        self._drivers = dict()
        self._throughput = dict()
        self._run()

    def _add_database(self, user, password, host, port, dbname):
        """Add database and initialize driver for it."""
        driver = Driver(
            user=user,
            password=password,
            host=host,
            port=port,
            dbname=dbname,
            number_threads=NUMBER_THREADS,
        )
        db_instance = DbObject(NUMBER_THREADS, driver, SUB_URL)
        self._drivers[host] = db_instance
        self._throughput[host] = 0

    def _get_throughput(self):
        """Get the throughput of all databases."""
        for database, database_object in self._drivers.items():
            self._throughput[database] = database_object.get_throughput_counter()
        return self._throughput

    def _clean_up(self):
        """Perform clean exit on all databases."""
        for database_object in self._drivers.values():
            database_object.clean_exit()

    def _validate_connection(self, body):
        """Validate if the connection data are correct."""
        try:
            connection = psycopg2.connect(
                user=body["user"],
                password=body["password"],
                host=body["host"],
                port=int(body["port"]),
                dbname=body["dbname"],
            )
            connection.close()
            return True
        except psycopg2.Error:
            # return e
            return False

    def _handle_request(self, request):
        """Handle requests."""
        call = request["header"]["message"]
        body = request["body"]
        result = False

        if call == "add database":
            validate = self._validate_connection(body)
            if not validate:
                return False
            self._add_database(
                user=body["user"],
                password=body["password"],
                host=body["host"],
                port=int(body["port"]),
                dbname=body["dbname"],
            )
            result = True

        if call == "throughput":
            result = self._get_throughput()

        return result

    def _run(self):
        """Initialize server."""
        context = zmq.Context()
        socket = context.socket(zmq.REP)
        socket.bind(REP_URL)

        print("Database manager running. Press CTRL+C to quit.")

        while True:
            try:
                request = socket.recv_json()
                result = self._handle_request(request)
                response = responses[200]
                if not result:
                    response = responses[400]
                elif result is True:
                    response = responses[200]
                else:
                    response["body"] = result

                socket.send_json(response)

            except KeyboardInterrupt:
                print("interrupt recived")
                if len(self._drivers) > 0:
                    self._clean_up()
                    sys.exit()
                sys.exit()


def main():
    """Run a database manager."""
    DbManager()


if __name__ == "__main__":
    main()
