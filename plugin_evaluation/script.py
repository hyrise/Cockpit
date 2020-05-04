"""Prototype of the scenario script."""

from time import sleep, time_ns

from plugin_evaluation.cockpit_management.cockpit import Cockpit
from plugin_evaluation.export.exporter import Exporter
from plugin_evaluation.settings import DATABASE_HOST, DATABASE_PORT
from plugin_evaluation.utils.figlet import intro
from plugin_evaluation.utils.user_interface import DoneStatus, show_bar

workload_execution_time = 10


print(intro)

cockpit = Cockpit()  # type: ignore
cockpit.start()

show_bar("Starting cockpit...                 ", 3)

with DoneStatus("Adding database..."):
    cockpit.backend.add_database("momentum", DATABASE_HOST, DATABASE_PORT)

show_bar("Waiting default tables to load...   ", 5)

with DoneStatus("Starting a workload..."):
    cockpit.backend.start_workload("tpch_0_1", 300)

startts = time_ns()

show_bar("Executing a workload...             ", workload_execution_time)

endts = time_ns()
sleep(1.0)

with DoneStatus("Stopping a workload..."):
    cockpit.backend.stop_workload("tpch_0_1")

with DoneStatus("Removing the database..."):
    cockpit.backend.remove_database("momentum")

cockpit.shutdown()

show_bar("Cockpit shutdown...                 ", 3)

with DoneStatus("Export..."):
    exporter = Exporter()  # type: ignore
    exporter.plot_metric("throughput", "momentum", startts, endts)
    exporter.plot_metric("latency", "momentum", startts, endts)
    exporter.plot_metric("queue_length", "momentum", startts, endts)
    exporter.plot_metric("cpu_process_usage", "momentum", startts, endts)
