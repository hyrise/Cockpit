"""Prototype of the scenario script."""
from time import sleep, time_ns

from plugin_evaluation.cockpit_management.cockpit import Cockpit
from plugin_evaluation.export.exporter import Exporter
from plugin_evaluation.settings import DATABASE_HOST, DATABASE_PORT
from plugin_evaluation.utils.figlet import intro
from plugin_evaluation.utils.user_interface import DoneStatus, show_bar

database_id = "momentum"
workload_execution_time = 10
plugin = "Compression"
benchmark = "tpch_0_1"
aggregation_interval = 1
tag = "Compression"

plugin_settings = {
    "database_id": database_id,
    "plugin_name": "Compression",
    "setting_name": "MemoryBudget",
    "value": "50000000",
}

metrics = [
    "throughput",
    "latency",
    "queue_length",
    "cpu_process_usage",
    "footprint",
    "detailed latency",
    "ram usage",
    "access frequency",
]

#############################################################

print(intro)

try:
    exporter = Exporter(tag)
    cockpit = Cockpit()  # type: ignore
    cockpit.start()

    show_bar("Starting cockpit...", 3)

    with DoneStatus("Check startup errors..."):
        assert (  # nosec
            not cockpit.has_errors()
        ), f"Error during startup of the cockpit\n {cockpit.get_stderr()}"

    with DoneStatus("Adding database..."):
        response = cockpit.backend.add_database(
            database_id, DATABASE_HOST, DATABASE_PORT
        )
        assert (  # nosec
            response.status_code == 200
        ), f"Couldn't add a database ({response.status_code})"

    with DoneStatus("Waiting default tables to load..."):
        cockpit.backend.wait_for_unblocked_status()

    with DoneStatus("Starting a workload..."):
        response = cockpit.backend.start_workers()
        assert (  # nosec
            response.status_code == 200
        ), f"Couldn't start workers ({response.status_code})"
        response = cockpit.backend.start_workload(benchmark, 300)
        assert (  # nosec
            response.status_code == 200
        ), f"Couldn't start workload ({response.status_code})"
        cockpit.backend.wait_for_unblocked_status()

    startts = time_ns()
    sleep(1.0)

    with DoneStatus(f"Activate {plugin} plugin..."):  # noqa
        response = cockpit.backend.activate_plugin(database_id, plugin)  # noqa
        assert (  # nosec
            response.status_code == 200
        ), f"Couldn't activate plugin ({response.status_code})"

    sleep(1.0)

    with DoneStatus(f"Setting {plugin} plugin..."):  # noqa
        response = cockpit.backend.set_plugin_settings(**plugin_settings)  # noqa
        assert (  # nosec
            response.status_code == 200
        ), f"Couldn't set plugin ({response.status_code})"

    show_bar("Executing a workload...", workload_execution_time)

    endts = time_ns()
    sleep(1.0)

    with DoneStatus(f"Deactivate {plugin} plugin..."):  # noqa
        response = cockpit.backend.deactivate_plugin(database_id, plugin)  # noqa
        assert (  # nosec
            response.status_code == 200
        ), f"Couldn't deactivate plugin ({response.status_code})"

    with DoneStatus("Stopping a workload..."):
        response = cockpit.backend.stop_workload(benchmark)
        assert (  # nosec
            response.status_code == 200
        ), f"Couldn't stop workload ({response.status_code})"
        response = cockpit.backend.stop_workers()
        assert (  # nosec
            response.status_code == 200
        ), f"Couldn't stop workers ({response.status_code})"
        cockpit.backend.wait_for_unblocked_status()

    with DoneStatus("Removing the database..."):
        response = cockpit.backend.remove_database(database_id)
        assert (  # nosec
            response.status_code == 200
        ), f"Couldn't remove database ({response.status_code})"

    with DoneStatus("Cockpit shutdown..."):
        cockpit.shutdown()

    show_bar("Prepairing for export...", 3)

    startts = int(startts / 1_000_000_000) * 1_000_000_000
    endts = int(endts / 1_000_000_000) * 1_000_000_000

    with DoneStatus("Export..."):
        exporter.initialize_plugin_log(database_id, startts, endts)
        for metric in metrics:
            exporter.plot_metric(
                metric, database_id, startts, endts, None, aggregation_interval
            )
        exporter.plot_metric_for_benchmark(  # noqa
            "table access frequency",
            benchmark,
            database_id,
            startts,
            endts,
            aggregation_interval,  # noqa
        )  # noqa
        exporter.plot_metric_for_benchmark(  # noqa
            "table footprint",
            benchmark,
            database_id,
            startts,
            endts,
            aggregation_interval,  # noqa
        )  # noqa
        exporter.plot_query_metric_for_benchmark(  # noqa
            "query latency",
            benchmark,
            database_id,
            startts,
            endts,
            aggregation_interval,  # noqa
        )  # noqa

except KeyboardInterrupt:
    print("\n\U00002757[KEYBOARD INTERRUPT]\U00002757")
    with DoneStatus("Cockpit shutdown..."):
        cockpit.shutdown()

except AssertionError as error:
    print(f"\U0000274C[ERROR]\U0000274C\n{error}")
    with DoneStatus("Cockpit shutdown..."):
        cockpit.shutdown()
