"""Prototype of the scenario script."""

from time import sleep, time_ns

from plugin_evaluation.cockpit_management.cockpit import Cockpit
from plugin_evaluation.export.exporter import Exporter
from plugin_evaluation.settings import DATABASE_HOST, DATABASE_PORT
from plugin_evaluation.utils.figlet import intro
from plugin_evaluation.utils.user_interface import DoneStatus, show_bar

database_id = "momentum"
workload_execution_time = 10
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
    cockpit.backend.start_workload("tpch_0_1", 300)
    cockpit.backend.wait_for_unblocked_status()

startts = time_ns()

with DoneStatus(f"Activate {plugin} plugin..."):
    response = cockpit.backend.activate_plugin(database_id, plugin)

show_bar("Executing a workload...", workload_execution_time)

endts = time_ns()
sleep(1.0)

with DoneStatus("Stopping a workload..."):
    cockpit.backend.stop_workload("tpch_0_1")

with DoneStatus("Removing the database..."):
    cockpit.backend.remove_database(database_id)
    cockpit.backend.wait_for_unblocked_status()

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
