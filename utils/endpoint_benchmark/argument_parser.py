"""Module for parsing arguments from command line."""

import argparse

from hyrisecockpit.settings import BACKEND_HOST, BACKEND_PORT


class ArgumentValidation:
    """Argument validation."""

    def __init__(self):
        """Initialize a ArgumentValidation."""
        self._endpoints_monitor = [
            "throughput",
            "latency",
            "queue_length",
            "failed_tasks",
            "system",
            "chunks",
            "storage",
            "krueger_data",
        ]
        self._endpoints_control = ["database", "data"]
        self._workloads = ["tpch_0.1", "tpch_1", "tpcds_1", "job"]
        self._databases = ["db1", "db2"]
        self._plugins = ["wrk"]
        self._validate_calls = {
            "end_points": self._validate_enpoints,
            "workloads": self._validate_workloads,
            "databases": self._validate_databases,
            "time": self._validate_time,
            "runs": self._validate_runs,
            "backend_url": self._validate_url,
            "number_workers": self._validate_number_workers,
            "workload_frequence": self._validate_workload_frequence,
            "plugins": self._validate_plugin,
        }

    def get_endpoints(self):
        """Return available endpoints."""
        return {
            "endpoints_monitor": self._endpoints_monitor,
            "endpoints_control": self._endpoints_control,
        }

    def get_workloads(self):
        """Return available workloads."""
        return self._workloads

    def get_databases(self):
        """Return available databases."""
        return self._databases

    def get_plugins(self):
        """Return available plug-ins."""
        return self._plugins

    def validate(self, type, arguments):
        """Validate arguments in context of type."""
        validator_func = self._validate_calls.get(type)
        valideted_argumets = validator_func(arguments)
        return valideted_argumets

    def _validate_enpoints(self, endpoint_arguments):
        """Validate endpoint arguments."""
        if "all" in endpoint_arguments:
            return {
                "endpoints_monitor": self._endpoints_monitor,
                "endpoints_control": self._endpoints_control,
            }
        endpoints_monitor = []
        endpoints_control = []
        for endpoint in endpoint_arguments:
            if endpoint in self._endpoints_monitor:
                endpoints_monitor.append(endpoint)
            elif endpoint in self._endpoints_control:
                endpoints_control.append(endpoint)
            else:
                print(f"{endpoint} endpoint not found")
        return {
            "endpoints_monitor": endpoints_monitor,
            "endpoints_control": endpoints_control,
        }

    def _validate_workloads(self, workload_argument):
        """Validate workload arguments."""
        if "all" in workload_argument:
            return self._workloads

        workloads = []
        for workload in workload_argument:
            if workload in self._workloads:
                workloads.append(workload)
            else:
                print(f"{workload} workload not found")
        return workloads

    def _validate_databases(self, database_arguments):
        """Validate database arguments."""
        if "all" in database_arguments:
            return self._databases
        databases = []
        for database in database_arguments:
            if database in self._databases:
                databases.append(database)
            else:
                print(f"{database} database not found")
        return databases

    def _validate_time(self, time_argument):
        """Validate time arguments."""
        time = time_argument
        if time < 0:
            print(f"{time} must be positive")
            time = 1
        return time

    def _validate_runs(self, run_argument):
        """Validate run arguments."""
        run = run_argument
        if run < 0:
            print(f"{run} must be positive")
            run = 1
        return run

    def _validate_url(self, url_argument):
        # todo validate via regex
        return url_argument[0]

    def _validate_number_workers(self, number_worker_argument):
        """Validate number worker arguments."""
        number_worker = number_worker_argument
        if number_worker < 0:
            print(f"{number_worker} must be positive")
            number_worker = 10
        return number_worker

    def _validate_workload_frequence(self, workload_frequence_argument):
        """Validate workload frequency arguments."""
        workload_frequence = workload_frequence_argument
        if workload_frequence < 0:
            print(f"{workload_frequence} must be positive")
            workload_frequence = 100
        return workload_frequence

    def _validate_plugin(self, plugin_argument):
        if "all" in plugin_argument:
            return self._plugins

        plugins = []
        for plugin in plugin_argument:
            if plugin in self._plugins:
                plugins.append(plugin)
            else:
                print(f"{plugin} plugin not found")
        return plugins


class ArgumentParser:
    """Parse arguments from command line."""

    def __init__(self):
        """Initialize a ArgumentParser."""
        self.parser = argparse.ArgumentParser(
            formatter_class=argparse.ArgumentDefaultsHelpFormatter
        )
        self._FUNCTION_MAP = {
            "endpoints": self._show_enpoints,
            "databases": self._show_databases,
            "workloads": self._show_workloads,
            "plugins": self._show_plugins,
            "all": self._show_all,
        }
        self._add_arguments()
        self._arguments = self.parser.parse_args()
        self._argument_validation = ArgumentValidation()

    def _show_enpoints(self):
        """Show which endpoints are available."""
        endpoints = self._argument_validation.get_endpoints()
        print("Endpoints: ")
        for key, value in endpoints.items():
            print(f"-> {key}: {value}")

    def _show_databases(self):
        """Show which databases are available."""
        databases = self._argument_validation.get_databases()
        print(f"Databases: {databases}")

    def _show_workloads(self):
        """Show which workloads are available."""
        workloads = self._argument_validation.get_workloads()
        print(f"Workloads: {workloads}")

    def _show_plugins(self):
        """Show which plug-ins are available."""
        plugins = self._argument_validation.get_plugins()
        print(f"Plug-ins: {plugins}")

    def _show_all(self):
        self._show_enpoints()
        self._show_databases()
        self._show_workloads()
        self._show_plugins()

    def _add_arguments(self):
        """Add arguments to the parser."""
        self.parser.add_argument(
            "--endpoint",
            "-ep",
            dest="end_points",
            type=str,
            nargs="+",
            default=["all"],
            metavar="",
            help="endpoints to run the benchmark on",
        )
        self.parser.add_argument(
            "--show",
            choices=self._FUNCTION_MAP.keys(),
            dest="show",
            type=str,
            nargs="+",
            metavar="",
            help="show available endpoints, workloads, databases, plug-ins and exit",
        )
        self.parser.add_argument(
            "--database",
            "-db",
            dest="databases",
            type=str,
            nargs="+",
            metavar="",
            default=["all"],
            help="databases to use in benchmark",
        )
        self.parser.add_argument(
            "--workload",
            "-w",
            dest="workloads",
            type=str,
            nargs="+",
            metavar="",
            default=["tpch_0.1"],
            help="workloads to run on databases",
        )
        self.parser.add_argument(
            "--time",
            "-t",
            dest="time",
            type=int,
            nargs="?",
            metavar="",
            default=1,
            help="duration of the benchmark per endpoint in seconds",
        )
        self.parser.add_argument(
            "--run",
            "-r",
            dest="runs",
            type=int,
            nargs="?",
            metavar="",
            default=1,
            help="number of runs",
        )
        self.parser.add_argument(
            "--url",
            "-u",
            dest="backend_url",
            type=str,
            nargs="?",
            metavar="",
            default=[f"http://{BACKEND_HOST}:{BACKEND_PORT}"],
            help="back-end URL",
        )
        self.parser.add_argument(
            "--worker_number",
            "-wn",
            dest="number_workers",
            type=int,
            nargs="?",
            metavar="",
            default=10,
            help="number of workers per database",
        )
        self.parser.add_argument(
            "--workload_frequence",
            "-wf",
            dest="workload_frequence",
            type=int,
            nargs=1,
            metavar="",
            default=200,
            help="frequency of workload",
        )
        self.parser.add_argument(
            "--plugin",
            "-p",
            dest="plugins",
            type=str,
            nargs="+",
            metavar="",
            default=["wrk"],
            help="benchmark plug-ins to use",
        )

    def _show_info(self):
        if self._arguments.show:
            for to_show in self._arguments.show:
                func = self._FUNCTION_MAP[to_show]
                func()
            exit()

    def get_configuration(self):
        """Return validated arguments from command line."""
        self._show_info()
        configuration = {}
        types = [
            "end_points",
            "databases",
            "workloads",
            "time",
            "runs",
            "backend_url",
            "number_workers",
            "workload_frequence",
            "plugins",
        ]
        for argument_type in types:
            configuration[argument_type] = self._argument_validation.validate(
                argument_type, getattr(self._arguments, argument_type)
            )
        return configuration
