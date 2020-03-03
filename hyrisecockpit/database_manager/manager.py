"""Module for managing databases."""

from typing import Any, Callable, Dict, Optional, Tuple

from hyrisecockpit.message import (
    add_database_request_schema,
    delete_data_request_schema,
    delete_database_request_schema,
    load_data_request_schema,
)
from hyrisecockpit.response import get_error_response, get_response
from hyrisecockpit.server import Server

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
        self._workload_sub_host = workload_sub_host
        self._workload_pubsub_port = workload_pubsub_port
        self._default_tables = default_tables

        self._databases: Dict[str, Database] = {}
        server_calls: Dict[
            str, Tuple[Callable[[Dict[str, Any]], Dict[str, Any]], Optional[Dict]]
        ] = {
            "add database": (self._call_add_database, add_database_request_schema),
            "storage": (self._call_storage, None),
            "system data": (self._call_system_data, None),
            "delete database": (
                self._call_delete_database,
                delete_database_request_schema,
            ),
            "queue length": (self._call_queue_length, None),
            "chunks data": (self._call_chunks_data, None),
            "failed tasks": (self._call_failed_tasks, None),
            "get databases": (self._call_get_databases, None),
            "load data": (self._call_load_data, load_data_request_schema),
            "delete data": (self._call_delete_data, delete_data_request_schema),
            "process table status": (self._call_process_table_status, None),
            "purge queue": (self._call_purge_queue, None),
            "activate plugin": (self._call_activate_plugin, None),
            "deactivate plugin": (self._call_deactivate_plugin, None),
        }
        self._server = Server(db_manager_listening, db_manager_port, server_calls)

    def __enter__(self):
        """Return self for a context manager."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Call close with a context manager."""
        self.close()

    def _call_add_database(self, body: Dict) -> Dict:
        """Add database and initialize driver for it."""
        user = body["user"]
        password = body["password"]
        host = body["host"]
        port = body["port"]
        dbname = body["dbname"]
        number_workers = body["number_workers"]
        if not Driver.validate_connection(
            user, password, host, port, dbname
        ):  # TODO move to Database
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
        databases = [
            {
                "id": id,
                "host": database.driver.host,
                "port": database.driver.port,
                "number_workers": database.number_workers,
                "dbname": database.driver.dbname,
            }
            for id, database in self._databases.items()
        ]
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
        id: str = body["id"]
        database: Optional[Database] = self._databases.pop(id, None)
        if database:
            database.close()
            del database
            return get_response(200)
        else:
            return get_response(404)

    def _call_failed_tasks(self, body: Dict) -> Dict:
        failed_tasks = {}
        for id, database in self._databases.items():
            failed_tasks[id] = database.get_failed_tasks()
        response = get_response(200)
        response["body"]["failed_tasks"] = failed_tasks
        return response

    def _call_load_data(self, body: Dict) -> Dict:
        folder_name: str = body["folder_name"].lower()  # TODO why .lower?
        if self._check_if_processing_table():
            return get_error_response(400, "Already loading data")
        for database in list(self._databases.values()):
            if not database.load_data(folder_name):
                return get_response(400)  # TODO return which DB couldn't import
        return get_response(200)

    def _call_delete_data(self, body: Dict) -> Dict:
        folder_name: str = body["folder_name"]
        if self._check_if_processing_table():
            return get_error_response(400, "Already loading data")
        for database in list(self._databases.values()):
            if not database.delete_data(folder_name):
                return get_response(400)
        return get_response(200)

    def _call_process_table_status(self, body: Dict) -> Dict:
        process_table_status = [
            {
                "id": database_id,
                "process_table_status": database.get_processing_tables_flag(),
            }
            for database_id, database in self._databases.items()
        ]
        response = get_response(200)
        response["body"]["process_table_status"] = process_table_status
        return response

    def _call_activate_plugin(self, body: Dict) -> Dict:
        database_id = body["id"]
        plugin = body["plugin"]
        for id, database in self._databases.items():
            if id == database_id:
                database.activate_plugin(plugin)
                if database.deactivate_plugin(plugin):
                    response = get_response(200)
            else:
                response = get_response(400)
        return response

    def _call_deactivate_plugin(self, body: Dict) -> Dict:
        database_id = body["id"]
        plugin = body["plugin"]
        for id, database in self._databases.items():
            if id == database_id:
                if database.deactivate_plugin(plugin):
                    response = get_response(200)
            else:
                response = get_response(400)
        return response

    def _check_if_processing_table(self) -> bool:
        processing_table_data = False
        for database in list(self._databases.values()):
            processing_table_data = (
                processing_table_data or database.get_processing_tables_flag()
            )
        return processing_table_data

    def _call_purge_queue(self, body: Dict) -> Dict:
        for database in self._databases.values():
            if not database.disable_workload_execution():
                return get_response(400)
        return get_response(200)

    def start(self):
        """Start the manager by starting the server."""
        self._server.start()

    def close(self) -> None:
        """Close the socket and context, exit all databases."""
        for database in self._databases.values():
            database.close()
        self._server.close()
