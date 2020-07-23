"""Module for managing databases."""

from types import TracebackType
from typing import Callable, Dict, Optional, Tuple, Type, TypedDict

from hyrisecockpit.api.app.plugin.interface import UpdatePluginSettingInterface
from hyrisecockpit.message import (
    add_database_request_schema,
    delete_data_request_schema,
    delete_database_request_schema,
    load_data_request_schema,
)
from hyrisecockpit.request import Body
from hyrisecockpit.response import Response, get_error_response, get_response
from hyrisecockpit.server import Server

from .cursor import HyriseCursor
from .database import Database, Plugins

DatabaseActivatedPlugins = TypedDict(
    "DatabaseActivatedPlugins", {"id": str, "plugins": Plugins},
)


class DatabaseManager(object):
    """A manager for database drivers."""

    def __init__(
        self,
        db_manager_listening: str,
        db_manager_port: str,
        workload_sub_host: str,
        workload_pubsub_port: str,
        default_tables: str,
        storage_host: str,
        storage_password: str,
        storage_port: str,
        storage_user: str,
    ) -> None:
        """Initialize a DatabaseManager."""
        self._workload_sub_host = workload_sub_host
        self._workload_pubsub_port = workload_pubsub_port
        self._default_tables = default_tables
        self._storage_host = storage_host
        self._storage_password = storage_password
        self._storage_port = storage_port
        self._storage_user = storage_user

        self._databases: Dict[str, Database] = {}
        server_calls: Dict[
            str, Tuple[Callable[[Body], Response], Optional[Dict]]
        ] = self._get_server_calls()
        self._server = Server(db_manager_listening, db_manager_port, server_calls)

    def __enter__(self) -> "DatabaseManager":
        """Return self for a context manager."""
        return self

    def __exit__(
        self,
        exc_type: Optional[Type[BaseException]],
        exc_value: Optional[BaseException],
        traceback: Optional[TracebackType],
    ) -> Optional[bool]:
        """Call close with a context manager."""
        self.close()
        return None

    def _get_server_calls(
        self,
    ) -> Dict[str, Tuple[Callable[[Body], Response], Optional[Dict]]]:
        return {
            "add database": (self._call_add_database, add_database_request_schema),
            "delete database": (
                self._call_delete_database,
                delete_database_request_schema,
            ),
            "start worker": (self._call_start_worker, None),
            "close worker": (self._call_close_worker, None),
            "queue length": (self._call_queue_length, None),
            "get databases": (self._call_get_databases, None),
            "load data": (self._call_load_data, load_data_request_schema),
            "delete data": (self._call_delete_data, delete_data_request_schema),
            "get plugins": (self._call_get_plugins, None),
            "activate plugin": (self._call_activate_plugin, None),
            "deactivate plugin": (self._call_deactivate_plugin, None),
            "set plugin setting": (self._call_plugin_setting, None),
            "execute sql query": (self._call_execute_sql_query, None),
            "database status": (self._call_database_status, None),
            "workload tables status": (self._call_workoad_tables_status, None),
        }

    def _call_add_database(self, body: Body) -> Response:
        """Add database and initialize driver for it."""
        user = body["user"]
        password = body["password"]
        host = body["host"]
        port = body["port"]
        dbname = body["dbname"]
        number_workers = body["number_workers"]
        if not HyriseCursor.validate_connection(
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
            self._storage_host,
            self._storage_password,
            self._storage_port,
            self._storage_user,
        )
        self._databases[body["id"]] = db_instance
        return get_response(200)

    def _call_get_databases(self, body: Body) -> Response:
        """Get list of all databases."""
        databases = [
            {
                "id": id,
                "host": database.connection_information["host"],
                "port": database.connection_information["port"],
                "number_workers": database.number_workers,
                "dbname": database.connection_information["dbname"],
                "user": database.connection_information["user"],
                "password": database.connection_information["password"],
            }
            for id, database in self._databases.items()
        ]
        response = get_response(200)
        response["body"]["databases"] = databases
        return response

    def _call_queue_length(self, body: Body) -> Response:
        queue_length = {}
        for id, database in self._databases.items():
            queue_length[id] = database.get_queue_length()
        response = get_response(200)
        response["body"]["queue_length"] = queue_length
        return response

    def _call_delete_database(self, body: Body) -> Response:
        id: str = body["id"]
        database: Optional[Database] = self._databases.pop(id, None)
        if database:
            database.close()
            del database
            return get_response(200)
        else:
            return get_response(404)

    def _call_load_data(self, body: Body) -> Response:
        if self._check_if_database_blocked():
            return get_error_response(400, "Already loading data")
        for database in list(self._databases.values()):
            if not database.load_data(body):
                return get_response(400)  # TODO return which DB couldn't import
        return get_response(200)

    def _call_delete_data(self, body: Body) -> Response:
        if self._check_if_database_blocked():
            return get_error_response(400, "Already loading data")
        for database in list(self._databases.values()):
            if not database.delete_data(body):
                return get_response(400)
        return get_response(200)

    def _call_get_plugins(self, body: Body) -> Response:
        response = get_response(200)
        response["body"]["plugins"] = [
            DatabaseActivatedPlugins(id=id, plugins=database.get_detailed_plugins())
            for id, database in self._databases.items()
        ]
        return response

    def _call_activate_plugin(self, body: Body) -> Response:
        id: str = body["id"]
        plugin: str = body["plugin"]
        if id not in self._databases.keys():
            response = get_response(400)
        elif self._databases[id].activate_plugin(plugin):
            response = get_response(200)
        else:
            response = get_response(423)
        return response

    def _call_deactivate_plugin(self, body: Body) -> Response:
        id: str = body["id"]
        plugin: str = body["plugin"]
        if id not in self._databases.keys():
            response = get_response(400)
        elif self._databases[id].deactivate_plugin(plugin):
            response = get_response(200)
        else:
            response = get_response(423)
        return response

    def _call_plugin_setting(self, body: Body) -> Response:
        id: str = body["id"]
        update: UpdatePluginSettingInterface = body["update"]
        plugin_name = update["name"]
        setting_name = update["setting"]["name"]
        setting_value = update["setting"]["value"]
        if id not in self._databases.keys():
            return get_response(404)
        elif self._databases[id].set_plugin_setting(
            plugin_name, setting_name, setting_value
        ):
            return get_response(200)
        else:
            return get_response(423)

    def _check_if_database_blocked(self) -> bool:
        database_blocked_status = False
        for database in list(self._databases.values()):
            database_blocked_status = (
                database_blocked_status or database.get_database_blocked()
            )
        return database_blocked_status

    def _call_start_worker(self, body: Body) -> Response:
        for database in self._databases.values():
            if not database.start_worker():
                return get_response(400)
        return get_response(200)

    def _call_close_worker(self, body: Body) -> Response:
        for database in self._databases.values():
            if not database.close_worker():
                return get_response(400)
        return get_response(200)

    def _call_execute_sql_query(self, body: Body) -> Response:
        database_id: str = body["id"]
        query: str = body["query"]
        if database_id not in self._databases.keys():
            return get_response(404)
        results = self._databases[database_id].execute_sql_query(query)
        response = get_response(200)
        response["body"]["results"] = results
        return response

    def _call_database_status(self, body: Body) -> Response:
        status = [
            {
                "id": database_id,
                "database_blocked_status": database.get_database_blocked(),
                "worker_pool_status": database.get_worker_pool_status(),
                "hyrise_active": database.get_hyrise_active(),
            }
            for database_id, database in self._databases.items()
        ]
        response = get_response(200)
        response["body"]["database_status"] = status
        return response

    def _call_workoad_tables_status(self, body: Body) -> Response:
        status = []
        for database_id, database in self._databases.items():
            workoad_tables_status = database.get_workoad_tables_status()
            status.append(
                {"id": database_id, "workoad_tables_status": workoad_tables_status}
            )
        response = get_response(200)
        response["body"]["workoad_tables"] = status
        return response

    def start(self) -> None:
        """Start the manager by starting the server."""
        self._server.start()

    def close(self) -> None:
        """Close the socket and context, exit all databases."""
        for database in self._databases.values():
            database.close()
        self._server.close()
