"""Prototype of the scenario script."""

from sys import stdout
from time import sleep, time_ns

from plugin_evaluation.cockpit_management.cockpit import Cockpit
from plugin_evaluation.exporter import Exporter
from plugin_evaluation.settings import DATABASE_HOST, DATABASE_PORT
from plugin_evaluation.utils.figlet import intro
from plugin_evaluation.utils.user_interface import show_bar

workload_execution_time = 10


print(intro)

cockpit = Cockpit()
cockpit.start()

show_bar("Starting cockpit...                 ", 3)

stdout.write("Adding database...")
stdout.flush()
cockpit.backend.add_database("momentum", DATABASE_HOST, DATABASE_PORT)
stdout.write("\rAdding database...                  DONE\n")

show_bar("Waiting default tables to load...   ", 5)

stdout.write("Starting a workload...")
stdout.flush()
cockpit.backend.start_workload("tpch_0_1", 300)
stdout.write("\rStarting a workload...              DONE\n")

startts = time_ns()

show_bar("Executing a workload...             ", workload_execution_time)

endts = time_ns()
sleep(1.0)

stdout.write("Stopping a workload...")
stdout.flush()
cockpit.backend.stop_workload("tpch_0_1")
stdout.write("\rStopping a workload...              DONE\n")

stdout.write("Removing database...")
stdout.flush()
cockpit.backend.remove_database("momentum")
stdout.write("\rRemoving database...                DONE\n")

stdout.write("Cockpit shutdown...")
cockpit.shutdown()
show_bar("Cockpit shutdown...                 ", 3)

stdout.write("Export...")
stdout.flush()

exporter = Exporter()
exporter.plot_metric("throughput", "momentum", startts, endts)
exporter.plot_metric("latency", "momentum", startts, endts)
exporter.plot_metric("queue_length", "momentum", startts, endts)
exporter.plot_metric("cpu_process_usage", "momentum", startts, endts)

stdout.write("\rExport...                           DONE\n")
