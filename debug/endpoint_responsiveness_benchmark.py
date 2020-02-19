"""Module for measureing endpoint responsiveness."""

import argparse


class ArgumentValidator:
    """Argument validator."""

    def __init__(self):
        """Initialize a ArgumentValidator."""
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
        self._validate_calls = {
            "end_points": self._validate_enpoints,
            "workload": self._validate_workloads,
            "databases": self._validate_databases,
            "time": self._validate_time,
            "runs": self._validate_runs,
        }

    def get_endpoints(self):
        """Return available enpoints."""
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
                print(f"{endpoint} enpoint not found")
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
        time = time_argument[0]
        if time < 0:
            print(f"{time} must be positiv")
            time = 1
        return time

    def _validate_runs(self, run_argument):
        run = run_argument[0]
        if run < 0:
            print(f"{run} must be positiv")
            run = 1
        return run


class ArgumentParser:
    """Parse arguments from command line."""

    def __init__(self):
        """Initialize a ArgumentParser."""
        self.parser = argparse.ArgumentParser(
            description="Process endpoint benchmark arguments."
        )
        self._FUNCTION_MAP = {
            "endpoints": self._show_enpoints,
            "databases": self._show_databases,
            "workloads": self._show_workloads,
            "all": self._show_all,
        }
        self._add_arguments()
        self._arguments = self.parser.parse_args()
        self._validator = ArgumentValidator()

    def _show_enpoints(self):
        endpoints = self._validator.get_endpoints()
        print("Endpoints: ")
        for key, value in endpoints.items():
            print(f"-> {key}: {value}")

    def _show_databases(self):
        databases = self._validator.get_databases()
        print(f"Databases: {databases}")

    def _show_workloads(self):
        workloads = self._validator.get_workloads()
        print(f"Workloads: {workloads}")

    def _show_all(self):
        self._show_enpoints()
        self._show_databases()
        self._show_workloads()

    def _add_arguments(self):
        self.parser.add_argument(
            "--end_points",
            "-ep",
            dest="end_points",
            type=str,
            nargs="+",
            default=["all"],
            help="Endpoints to run benchmark on. Default value is all.",
        )
        self.parser.add_argument(
            "--show",
            choices=self._FUNCTION_MAP.keys(),
            dest="show",
            nargs="+",
            help="Endpoints to run benchmark on. Default value is all.",
        )
        self.parser.add_argument(
            "--databases",
            "-db",
            dest="databases",
            type=str,
            nargs="+",
            default=["all"],
            help="Databases to run benchmark on. Default value is all.",
        )
        self.parser.add_argument(
            "--workload",
            "-b",
            dest="workload",
            type=str,
            nargs="+",
            default=["tpch_0.1"],
            help="Workload to run on databases. Default value is tpch_0.1.",
        )
        self.parser.add_argument(
            "--time",
            "-t",
            dest="time",
            type=int,
            nargs=1,
            default=[1],
            help="Time to benchmark endpoints in seconds. Default value is 1.",
        )
        self.parser.add_argument(
            "--runs",
            "-r",
            dest="runs",
            type=int,
            nargs=1,
            default=[1],
            help="Number of runs.",
        )

    def _show_info(self):
        if self._arguments.show:
            for to_show in self._arguments.show:
                func = self._FUNCTION_MAP[to_show]
                func()
            exit()

    def get_arguments(self):
        """Retun validated arguments from command line."""
        self._show_info()
        arguments = {}
        types = ["end_points", "databases", "workload", "time", "runs"]
        for argument_type in types:
            arguments[argument_type] = self._validator.validate(
                argument_type, getattr(self._arguments, argument_type)
            )


if __name__ == "__main__":
    arg_parser = ArgumentParser()
    arg_parser.get_arguments()
