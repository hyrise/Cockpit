"""Prototype of the scenario script."""

from time import sleep, time_ns

from plugin_evaluation.cockpit_management.cockpit import Cockpit
from plugin_evaluation.export.exporter import Exporter
from plugin_evaluation.settings import DATABASE_HOST, DATABASE_PORT
from plugin_evaluation.utils.figlet import intro
from plugin_evaluation.utils.user_interface import DoneStatus, show_bar

database_id = "momentum"
workload_execution_time = 100
plugin = "Clustering"


print(intro)

cockpit = Cockpit()  # type: ignore
cockpit.start()

show_bar("Starting cockpit...", 3)

with DoneStatus("Adding database..."):
    cockpit.backend.add_database(database_id, DATABASE_HOST, DATABASE_PORT)

with DoneStatus("Waiting default tables to load..."):
    cockpit.backend.wait_for_unblocked_status()

with DoneStatus("Starting a workload..."):
    cockpit.backend.start_workers()
    cockpit.backend.start_workload("tpch_0_1", 300)
    cockpit.backend.wait_for_unblocked_status()

startts = time_ns()

# with DoneStatus(f"Activate {plugin} plugin..."):  # noqa
#     response = cockpit.backend.activate_plugin(database_id, plugin)   # noqa

show_bar("Executing a workload...", workload_execution_time)

endts = time_ns()
sleep(1.0)

# with DoneStatus(f"Deactivate {plugin} plugin..."):    # noqa
#     response = cockpit.backend.deactivate_plugin(database_id, plugin) # noqa

with DoneStatus("Stopping a workload..."):
    cockpit.backend.stop_workload("tpch_0_1")
    cockpit.backend.stop_workers()
    cockpit.backend.wait_for_unblocked_status()

with DoneStatus("Removing the database..."):
    cockpit.backend.remove_database(database_id)

cockpit.shutdown()

show_bar("Cockpit shutdown...", 3)

with DoneStatus("Export..."):
    exporter = Exporter()
    exporter.plot_metric("throughput", "momentum", startts, endts)
    exporter.plot_metric("latency", "momentum", startts, endts)
    exporter.plot_metric("queue_length", "momentum", startts, endts)
    exporter.plot_metric("cpu_process_usage", "momentum", startts, endts)
    exporter.plot_metric("footprint", "momentum", startts, endts)
    exporter.plot_metric("detailed latency", "momentum", startts, endts)
    exporter.plot_metric(
        "table footprint", "momentum", startts, endts, "customer_tpch_0_1"
    )
    exporter.plot_metric(
        "table access frequency", "momentum", startts, endts, "customer_tpch_0_1"
    )
    exporter.plot_metric(
        "table access frequency", "momentum", startts, endts, "lineitem_tpch_0_1"
    )
