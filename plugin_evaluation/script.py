"""Prototype of the scenario script."""

from time import sleep, time_ns

from figlet import intro
from plugin_evaluation.cockpit_management.cockpit import Cockpit
from plugin_evaluation.exporter import Exporter
from plugin_evaluation.settings import DATABASE_HOST, DATABASE_PORT

workload_execution_time = 10.0

print(intro)

print("Starting cockpit...")
cockpit = Cockpit()
cockpit.start()
print("   OK")

sleep(3.0)

print("Adding database...")
cockpit.backend.add_database("momentum", DATABASE_HOST, DATABASE_PORT)
print("   OK")

print("Waiting default tables to load...")
sleep(5.0)
print("   OK")

print("Starting a workload...")
cockpit.backend.start_workload("tpch_0_1", 300)
print("   OK")

startts = time_ns()

print("Executing a workload...")
sleep(workload_execution_time)
print("   OK")

endts = time_ns()
sleep(1.0)

print("Stopping a workload...")
cockpit.backend.stop_workload("tpch_0_1")
print("   OK")

print("Removing database...")
cockpit.backend.remove_database("momentum")
print("   OK")

print("Cockpit shutdown...")
cockpit.shutdown()
print("   OK")

sleep(3.0)

print("Export...")
exporter = Exporter()
exporter.plot_metric("throughput", "momentum", startts, endts)
exporter.plot_metric("latency", "momentum", startts, endts)
exporter.plot_metric("queue_length", "momentum", startts, endts)
exporter.plot_metric("cpu_process_usage", "momentum", startts, endts)
print("   OK")
