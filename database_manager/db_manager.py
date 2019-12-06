"""The data base manager is managing all databases."""
import json
from os import getenv

import zmq

from db_object import DbObject
from driver import Driver

DATABASE_HOST = getenv("HY_HOST")
DATABASE_PORT = getenv("HY_PORT")
DATABASE_NAME = getenv("HY_DBNAME")
DATABASE_USER = getenv("HY_USER")
DATABASE_PASSWORD = getenv("HY_PASSWORD")
NUMBER_THREADS = 3
SUB_SOCKET = ""
REP_SOCKET = ""


class DbManager(object):
    """Class that represates the database manager."""

    def __init__(self):
        """Initialize a DatabaseManager."""
        self._drivers = dict()
        self._throughput = dict()
        self._default_init()
        self._run()

    def _default_init(self):
        """Initialize default database."""
        driver = Driver(
            user=DATABASE_USER,
            password=DATABASE_PASSWORD,
            host=DATABASE_HOST,
            port=DATABASE_PORT,
            dbname=DATABASE_NAME,
            number_threads=NUMBER_THREADS,
        )
        db_instanze = DbObject(3, driver, SUB_SOCKET)
        self._drivers[DATABASE_NAME] = db_instanze
        self._throughput[DATABASE_NAME] = 0
        print("default init done")

    def get_throughput(self):
        """Return a dictionary with the throughput of all databases."""
        for database, database_object in self._drivers.items():
            self._throughput[database] = database_object.get_throughput_counter()
        return self._throughput

    def _clean_up(self):
        """Shutdown all database objects."""
        for database_object in self._drivers.values():
            database_object.clean_exit()

    def _run(self):
        """Start own server."""
        context = zmq.Context()
        socket = context.socket(zmq.REP)
        socket.bind(REP_SOCKET)

        print("Database manager running. Press CTRL+C to quit.")

        while True:
            try:
                message = socket.recv_string()
                response = "error"
                if message == "Throughput":
                    response = json.dumps(self.get_throughput())
                socket.send_string(response)
            except KeyboardInterrupt:
                print("interrupt recived")
                self._clean_up()


def main():
    """Run a database manager."""
    DbManager()


if __name__ == "__main__":
    main()
