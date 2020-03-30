"""Module for parsing arguments from command line."""

import argparse

from utils.settings import BACKEND_HOST, BACKEND_PORT


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
            "detailed_latency",
            "detailed_throughput",
            "status",
        ]
        self._endpoints_control = [
            "database",
            "data",
            "plugin_log",
            "plugin",
            "available_plugins",
        ]
        self._workloads = ["tpch_0.1", "tpch_1", "tpcds_1", "job", "no-ops", "none"]
        self._table_names = ["tpch_0.1", "tpch_1", "tpcds_1", "none", "workload"]
        self._databases = ["db1", "db2", "none"]
        self._plugins = ["wrk", "displayReply"]
        self._close_argumernts = ["workload", "database", "none"]
        self._validate_calls = {
            "end_points": self._validate_enpoints,
            "workload": self._validate_workload,
            "databases": self._validate_databases,
            "time": self._validate_time,
            "runs": self._validate_runs,
            "backend_url": self._validate_url,
            "number_workers": self._validate_number_workers,
            "workload_frequence": self._validate_workload_frequence,
            "plugins": self._validate_plugin,
            "start_components": self._basic_validate,
            "close": self._validate_close,
            "load_table": self._validate_load_tables,
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

    def _validate_workload(self, workload_argument):
        """Validate workload arguments."""
        if workload_argument in self._workloads:
            return workload_argument
        else:
            print(f"{workload_argument} workload not found.")
        return "none"

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

    def _basic_validate(self, _basic_validate_arguments):
        if _basic_validate_arguments.upper() in ["Y", "N"]:
            return _basic_validate_arguments.upper()
        else:
            print(f"{_basic_validate_arguments} not Y/N. Default Y is used.")
            return "Y"

    def _validate_close(self, close_arguments):
        for argument in close_arguments:
            if argument not in self._close_argumernts:
                print(f"{argument} not valid. Default workload and database is used.")
                return self._close_argumernts
        return close_arguments

    def _validate_load_tables(self, load_tables_arguments):
        if load_tables_arguments in self._table_names:
            return load_tables_arguments
        else:
            print(f"{load_tables_arguments} workload not found.")
        return "workload"


class ArgumentParser:
    """Parse arguments from command line."""

    def __init__(self):
        """Initialize a ArgumentParser."""
        self.parser = argparse.ArgumentParser(
            formatter_class=argparse.ArgumentDefaultsHelpFormatter
        )
        self._argument_validation = ArgumentValidation()
        self._add_arguments()
        self._arguments = self.parser.parse_args()

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
            help="endpoints to run the benchmark on. Allowed values are "
            + ", ".join(self._argument_validation._endpoints_monitor)
            + ", all",
        )
        self.parser.add_argument(
            "--database",
            "-db",
            dest="databases",
            type=str,
            nargs="+",
            metavar="",
            default=["all"],
            help="databases to use in benchmark. For no database to add use none. Allowed values are "
            + ", ".join(self._argument_validation._databases)
            + ", all",
        )
        self.parser.add_argument(
            "--workload",
            "-w",
            dest="workload",
            type=str,
            nargs="?",
            metavar="",
            default="tpch_0.1",
            help="workload to run on databases. For no workload use none. Allowed values are "
            + ", ".join(self._argument_validation._workloads),
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
            nargs="?",
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
            help="benchmark plug-ins to use. Allowed values are "
            + ", ".join(self._argument_validation._plugins),
        )
        self.parser.add_argument(
            "--start_components",
            "-sc",
            dest="start_components",
            type=str,
            nargs="?",
            metavar="",
            default="N",
            help="start components as subprocesses [Y/N]",
        )
        self.parser.add_argument(
            "--close",
            "-c",
            dest="close",
            type=str,
            nargs="+",
            metavar="",
            default=["workload", "database"],
            help="close database or workload. To keep workload and database running after benchmark use none. Allowed values are"
            + ", ".join(self._argument_validation._close_argumernts),
        )
        self.parser.add_argument(
            "--load_table",
            "-lt",
            dest="load_table",
            type=str,
            nargs="?",
            metavar="",
            default="workload",
            help="load table. For no table loading use none. For loading workload tables use workload. Allowed values are"
            + ", ".join(self._argument_validation._table_names),
        )

    def get_configuration(self):
        """Return validated arguments from command line."""
        configuration = {}
        types = [
            "end_points",
            "databases",
            "workload",
            "time",
            "runs",
            "backend_url",
            "number_workers",
            "workload_frequence",
            "plugins",
            "start_components",
            "close",
            "load_table",
        ]
        for argument_type in types:
            configuration[argument_type] = self._argument_validation.validate(
                argument_type, getattr(self._arguments, argument_type)
            )
        return configuration
