"""Module for managing databases."""

from typing import Any, Callable, Dict, Optional

from zmq import REP, Context

from hyrisecockpit.response import get_error_response, get_response

from .database import Database
from .driver import Driver


class DatabaseManager(object):
    """A manager for database drivers."""

    def __init__(
        self,
        db_manager_listening: str,
        db_manager_port: str,
        workload_sub_host: str,
        workload_pubsub_port: str,
        default_tables: str,
    ) -> None:
        """Initialize a DatabaseManager."""
        self._db_manager_port = db_manager_port
        self._db_manager_listening = db_manager_listening
        self._workload_sub_host = workload_sub_host
        self._workload_pubsub_port = workload_pubsub_port
        self._default_tables = default_tables

        self._databases: Dict[str, Database] = {}

        self._server_calls: Dict[str, Callable[[Dict[str, Any]], Dict[str, Any]]] = {
            "add database": self._call_add_database,
            "storage": self._call_storage,
            "system data": self._call_system_data,
            "delete database": self._call_delete_database,
            "queue length": self._call_queue_length,
            "chunks data": self._call_chunks_data,
            "failed tasks": self._call_failed_tasks,
            "get databases": self._call_get_databases,
            "load data": self._call_load_data,
            "delete data": self._call_delete_data,
        }
        self._context = Context(io_threads=1)
        self._socket = self._context.socket(REP)
        self._socket.bind(
            "tcp://{:s}:{:s}".format(self._db_manager_listening, self._db_manager_port)
        )

    def __enter__(self):
        """Return self for a context manager."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Call close with a context manager."""
        self.close()

    def _call_add_database(self, body: Dict) -> Dict:
        """Add database and initialize driver for it."""
        # validating connection data
        user = body.get("user")
        password = body.get("password")
        host = body.get("host")
        port = body.get("port")
        dbname = body.get("dbname")
        number_workers = body.get("number_workers")
        if not (user and password and host and port and dbname and number_workers):
            return get_response(400)
        if not Driver.validate_connection(user, password, host, port, dbname):
            return get_response(400)
        if body["id"] in self._databases:
            return get_response(400)

        db_instance = Database(
            body["id"],
            user,
            password,
            host,
            port,
            dbname,
            number_workers,
            "tcp://{:s}:{:s}".format(
                self._workload_sub_host, self._workload_pubsub_port,
            ),
            self._default_tables,
        )
        self._databases[body["id"]] = db_instance
        return get_response(200)

    def _call_get_databases(self, body: Dict) -> Dict:
        """Get list of all databases."""
        databases = list(self._databases.keys())
        response = get_response(200)
        response["body"]["databases"] = databases
        return response

    def _call_storage(self, body: Dict) -> Dict:
        storage = {}
        for id, database in self._databases.items():
            storage[id] = database.get_storage_data()
        response = get_response(200)
        response["body"]["storage"] = storage
        return response

    def _call_system_data(self, body: Dict) -> Dict:
        system_data = {}
        for id, database in self._databases.items():
            system_data[id] = database.get_system_data()
        response = get_response(200)
        response["body"]["system_data"] = system_data
        return response

    def _call_queue_length(self, body: Dict) -> Dict:
        queue_length = {}
        for id, database in self._databases.items():
            queue_length[id] = database.get_queue_length()
        response = get_response(200)
        response["body"]["queue_length"] = queue_length
        return response

    def _call_chunks_data(self, body: Dict) -> Dict:
        """Get chunks data of all databases."""
        chunks_data = {}
        for id, database in self._databases.items():
            chunks_data[id] = database.get_chunks_data()
        response = get_response(200)
        response["body"]["chunks_data"] = chunks_data
        return response

    def _call_delete_database(self, body: Dict) -> Dict:
        id: Optional[str] = body.get("id")
        if not id:
            return get_response(400)
        database: Optional[Database] = self._databases.pop(id, None)
        if database:
            database.close()
            del database
            return get_response(200)
        else:
            return get_response(400)

    def _call_failed_tasks(self, body: Dict) -> Dict:
        failed_tasks = {}
        for id, database in self._databases.items():
            failed_tasks[id] = database.get_failed_tasks()
        response = get_response(200)
        response["body"]["failed_tasks"] = failed_tasks
        return response

    def _call_not_found(self, body: Dict) -> Dict:
        return get_error_response(400, "Call not found")

    def _call_load_data(self, body: Dict) -> Dict:
        if self._check_if_processing_table():
            return get_error_response(400, "Already loading data")
        datatype = str(body.get("datatype")).lower()
        sf = body.get("sf", "1")
        if not datatype:
            return get_response(400)
        for database in list(self._databases.values()):
            if not database.load_data(datatype, sf):
                return get_response(400)  # TODO return which DB couldn't import
        return get_response(200)

    def _call_delete_data(self, body: Dict) -> Dict:
        if self._check_if_processing_table():
            return get_error_response(400, "Already loading data")
        datatype = body.get("datatype")
        if not datatype:
            return get_response(400)
        for database in list(self._databases.values()):
            if not database.delete_data(datatype):
                return get_response(400)
        return get_response(200)

    def _check_if_processing_table(self) -> bool:
        processing_table_data = False
        for database in list(self._databases.values()):
            processing_table_data = (
                processing_table_data or database.get_processing_tables_flag()
            )
        return processing_table_data

    def start(self) -> None:
        """Start the manager by enabling IPC."""
        while True:
            # Get the message
            request = self._socket.recv_json()
            # Handle the call
            response = self._server_calls.get(
                request["header"]["message"], self._call_not_found
            )(request["body"])

            # Send the reply
            self._socket.send_json(response)

    def close(self) -> None:
        """Close the socket and context, exit all databases."""
        for database in self._databases.values():
            database.close()
        self._socket.close()
        self._context.term()
