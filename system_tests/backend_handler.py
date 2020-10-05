"""This module interacts directly with the back-end API.

This model provides the system tests a API to interact with the
back-end.
"""

from requests import delete, get, post, put

from system_tests.settings import REQUEST_TIMEOUT


class BackendHandler:
    """Interacts directly with back-end API.

    All requests to the back_end have a time out set. If the timeout is
    exceeded, the test that called the method with the request fails.
    """

    def __init__(self, backend_host, backend_port):
        """Initialize back-end handler."""
        self._backend_host = backend_host
        self._backend_port = backend_port

    def get_property(self, property: str):
        """Get property.

        Sends a get request to a back-end endpoint. For example to
        status/workload_tables.
        """
        url = f"http://{self._backend_host}:{self._backend_port}/{property}"
        return get(url, timeout=REQUEST_TIMEOUT)

    def get_historical_property(
        self, property: str, startts: int, endts: int, precision: int
    ):
        """Get historical property.

        Sends a get request to a endpoint that returns historical data.
        The URL needs to be adjusted with the start time stamp, end time stamp,
        and the precision.
        """
        url = f"http://{self._backend_host}:{self._backend_port}/{property}?startts={startts}&endts={endts}&precision={precision}"
        return get(url, timeout=REQUEST_TIMEOUT)

    def add_database(self, id: str, host: str, port: str):
        """Add database.

        This method sends a post request to register a database.
        """
        body = {
            "id": id,
            "host": host,
            "port": port,
            "number_workers": 2,
            "dbname": "postgres",
            "user": "serviceuser",
            "password": "serviceuser",
        }
        url = f"http://{self._backend_host}:{self._backend_port}/control/database/"
        return post(url, json=body, timeout=REQUEST_TIMEOUT)

    def remove_database(self, id: str):
        """Add database.

        This method sends a delete request to remove the database.
        """
        body = {"id": id}
        url = f"http://{self._backend_host}:{self._backend_port}/control/database/"
        return delete(url, json=body, timeout=REQUEST_TIMEOUT)

    def load_tables(self, workload_type: str, scalefactor: float):
        """Load tables for the benchmark.

        This method sends a post request to load the tables for a workload
        and its scale factor.
        """
        body = {"scale_factor": scalefactor, "workload_type": workload_type}
        url = f"http://{self._backend_host}:{self._backend_port}/control/database/workload_tables"
        return post(url, json=body, timeout=REQUEST_TIMEOUT)

    def delete_tables(self, workload_type: str, scalefactor: float):
        """Delete tables for the benchmark.

        This method sends a delete request to delete the tables for a workload
        and its scale factor.
        """
        body = {"scale_factor": scalefactor, "workload_type": workload_type}
        url = f"http://{self._backend_host}:{self._backend_port}/control/database/workload_tables"
        return delete(url, json=body, timeout=REQUEST_TIMEOUT)

    def start_workload(
        self, workload_type: str, scalefactor: float, frequency: int, weights=None
    ):
        """Start workload execution.

        This method sends a post request to start the generation of the workload.
        """
        if not weights:
            weights = {}
        body = {
            "scale_factor": scalefactor,
            "workload_type": workload_type,
            "weights": weights,
            "frequency": frequency,
        }
        url = f"http://{self._backend_host}:{self._backend_port}/workload/"
        return post(url, json=body, timeout=REQUEST_TIMEOUT)

    def stop_workload(self, workload_type: str):
        """Stop workload execution.

        This method sends a delete request to stop the generation of the workload.
        """
        url = (
            f"http://{self._backend_host}:{self._backend_port}/workload/{workload_type}"
        )
        return delete(url, timeout=REQUEST_TIMEOUT)

    def start_workers(self):
        """Start worker pool.

        This method sends a post request to start the workers.
        """
        url = (
            f"http://{self._backend_host}:{self._backend_port}/control/database/worker"
        )
        return post(url, timeout=REQUEST_TIMEOUT)

    def stop_workers(self):
        """Stop worker pool.

        This method sends a delete request to stop the workers.
        """
        url = (
            f"http://{self._backend_host}:{self._backend_port}/control/database/worker"
        )
        return delete(url, timeout=REQUEST_TIMEOUT)

    def activate_plugin(self, database_id: str, plugin: int):
        """Activate plug-in.

        This method sends a post request to activate the plug-in for the database.
        """
        body = {"name": plugin}
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin/{database_id}"
        return post(url, json=body, timeout=REQUEST_TIMEOUT)

    def deactivate_plugin(self, database_id: str, plugin: int):
        """Deactivate plug-in.

        This method sends a delete request to deactivate the plug-in for the database.
        """
        body = {"name": plugin}
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin/{database_id}"
        return delete(url, json=body, timeout=REQUEST_TIMEOUT)

    def get_activated_plugins(self):
        """Get activated plug-ins.

        This method sends a get request to get all activated plug-ins.
        """
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin/"
        return get(url, timeout=REQUEST_TIMEOUT)

    def set_plugin_settings(
        self, database_id: str, plugin_name: str, setting_name: str, value: str
    ):
        """Set plug-in settings.

        This method sends a put request to set the settings for a plug-in that
        is activated for a specific database.
        """
        body = {"name": plugin_name, "setting": {"name": setting_name, "value": value}}
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin/{database_id}"
        return put(url, json=body, timeout=REQUEST_TIMEOUT)

    def get_plugin_log(self):
        """Get plugin log.

        This method sends a get request to get the plug-in logs.
        """
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin/log"
        return get(url, timeout=REQUEST_TIMEOUT)
