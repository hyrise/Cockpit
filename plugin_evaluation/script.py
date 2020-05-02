"""Prototype of the scenario script."""

from time import sleep, time_ns

from figlet import intro
from plugin_evaluation.cockpit_management.cockpit import Cockpit
from plugin_evaluation.exporter import Exporter
from plugin_evaluation.settings import DATABASE_HOST, DATABASE_PORT

print(intro)

cockpit = Cockpit()
cockpit.start()

sleep(3.0)

cockpit.backend.add_database("momentum", DATABASE_HOST, DATABASE_PORT)
print("Database added")

sleep(5.0)

startts = time_ns()

cockpit.backend.start_workload("tpch_0_1", 300)
print("Workload started")

sleep(30.0)

endts = time_ns()
sleep(1.0)
cockpit.backend.stop_workload("tpch_0_1")
print("Workload stoped")

cockpit.backend.remove_database("momentum")
print("Workload removed")


print(cockpit.get_stderr())

cockpit.shutdown()
print("Cockpit shutdown")

sleep(3.0)

print(f"startts: {startts}")
print(f"endts: {endts}")

exporter = Exporter()
exporter.plot_metric("throughput", "momentum", startts, endts)
exporter.plot_metric("latency", "momentum", startts, endts)
exporter.plot_metric("queue_length", "momentum", startts, endts)
exporter.plot_metric("cpu_process_usage", "momentum", startts, endts)
