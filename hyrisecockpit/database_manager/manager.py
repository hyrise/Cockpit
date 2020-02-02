"""Module for managing databases."""

from typing import Any, Callable, Dict, Optional

from apscheduler.schedulers.background import BackgroundScheduler
from jsonschema import ValidationError, validate
from zmq import REP, REQ, Context

from hyrisecockpit.message import (
    add_database_request_schema,
    delete_data_request_schema,
    delete_database_request_schema,
    load_data_request_schema,
    request_schema,
)
from hyrisecockpit.response import get_error_response, get_response

from .database import Database
from .driver import Driver


class DatabaseManager(object):
    """A manager for database drivers."""

    def __init__(
        self,
        db_manager_listening: str,
        db_manager_port: str,
        generator_host: str,
        generator_port: str,
        workload_sub_host: str,
        workload_pubsub_port: str,
        default_tables: str,
    ) -> None:
        """Initialize a DatabaseManager."""
        self._db_manager_port = db_manager_port
        self._db_manager_listening = db_manager_listening
        self._generator_host = generator_host
        self._generator_port = generator_port
        self._workload_sub_host = workload_sub_host
        self._workload_pubsub_port = workload_pubsub_port
        self._default_tables = default_tables

        self._workload_proceed_flag: bool = False
        self._auto_reload_flag: bool = False

        self._databases: Dict[str, Database] = {}
        self._scheduler = BackgroundScheduler()
        self._reload_workload_job = self._scheduler.add_job(
            func=self._reload_workload, trigger="interval", seconds=1, max_instances=1
        )
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
            "register workload": self._call_register_workload,
            "start workload": self._call_start_workload,
            "stop workload": self._call_stop_workload,
        }
        self._context = Context(io_threads=1)
        self._socket = self._context.socket(REP)
        self._socket.bind(
            "tcp://{:s}:{:s}".format(self._db_manager_listening, self._db_manager_port)
        )
        self._generator_socket = self._context.socket(REQ)
        self._generator_socket.connect(
            "tcp://{:s}:{:s}".format(self._generator_host, self._generator_port)
        )
        self._scheduler.start()

    def _reload_workload(self):
        limit = 10000
        auto_reload_factor = 10000
        if self._workload_proceed_flag:
            queue_length = [
                database.get_queue_length() for _, database in self._databases.items()
            ]
            if len(queue_length) == 0:
                return

            if min(queue_length) < limit:
                if self._auto_reload_flag:
                    request = {
                        "header": {"message": "generate registered workload"},
                        "body": {"factor": auto_reload_factor},
                    }
                else:
                    self._workload_proceed_flag = False
                    request = {
                        "header": {"message": "generate registered workload"},
                        "body": {},
                    }
                self._generator_socket.send_json(request)
                self._generator_socket.recv_json()

    def __enter__(self):
        """Return self for a context manager."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Call close with a context manager."""
        self.close()

    def _call_add_database(self, body: Dict) -> Dict:
        """Add database and initialize driver for it."""
        validate(instance=body, schema=add_database_request_schema)
        # validating connection data
        user = body["user"], password = body["password"], host = body["host"], port = (
            body["port"],
            dbname,
        ) = (body["dbname"], number_workers) = body["number_workers"]
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
        validate(instance=body, schema=delete_database_request_schema)
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
        validate(instance=body, schema=load_data_request_schema)
        datatype: str = body["datatype"].lower()
        sf: str = body["sf"]
        if self._check_if_processing_table():
            return get_error_response(400, "Already loading data")
        for database in list(self._databases.values()):
            if not database.load_data(datatype, sf):
                return get_response(400)  # TODO return which DB couldn't import
        return get_response(200)

    def _call_register_workload(self, body: Dict) -> Dict:
        if self._check_if_processing_table():
            return get_error_response(400, "Already loading data")
        workload: Any = body.get("workload")
        request = {
            "header": {"message": "register workload"},
            "body": workload,
        }
        self._generator_socket.send_json(request)
        response = self._generator_socket.recv_json()

        if response["header"]["status"] != 200:
            return get_error_response(
                400, response["body"].get("error", "Invalid workload")
            )
        required_tables = response["body"]["required_tables"]
        sf = workload.get("sf", "0.1")  # TODO: Choose appropriate scale factor
        for table in required_tables:
            for database in list(self._databases.values()):
                # TODO Check load flag
                if not database.load_data(table, sf):
                    return get_error_response(
                        400, f"Database {database._id} could not load {table}"
                    )
        self._auto_reload_flag = workload.get("auto-reload", True)

        return get_response(200)

    def _call_start_workload(self, body: Dict) -> Dict:
        if self._check_if_processing_table():
            return get_error_response(400, "Already loading data")
        self._workload_proceed_flag = True
        return get_response(200)

    def _call_stop_workload(self, body: Dict) -> Dict:
        if self._check_if_processing_table():
            return get_error_response(400, "Already loading data")
        self._workload_proceed_flag = False
        for database in list(self._databases.values()):
            database.disable_workload_execution()
        return get_response(200)

    def _call_delete_data(self, body: Dict) -> Dict:
        validate(instance=body, schema=delete_data_request_schema)
        datatype: str = body["datatype"]
        if self._check_if_processing_table():
            return get_error_response(400, "Already loading data")
        self._workload_proceed_flag = False
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

            # Validate the message
            try:
                validate(instance=request, schema=request_schema)
            except ValidationError:
                self._socket.send_json(get_response(400))
                continue

            # Look for the call
            call = self._server_calls.get(request["header"]["message"])
            if not call:
                self._socket.send_json(get_response(404))
            else:
                # Handle the call
                try:
                    response = call(request["body"])
                except ValidationError:
                    response = get_response(400)
                finally:  # Send the reply
                    self._socket.send_json(response)

    def close(self) -> None:
        """Close the socket and context, exit all databases."""
        for database in self._databases.values():
            database.close()
        self._reload_workload_job.remove()
        self._scheduler.shutdown()
        self._socket.close()
        self._generator_socket.close()
        self._context.term()
