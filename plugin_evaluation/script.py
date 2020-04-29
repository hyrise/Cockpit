"""Prototype of the scenario script."""

from time import sleep

from plugin_evaluation.cockpit_management.cockpit import Cockpit
from plugin_evaluation.settings import DATABASE_HOST, DATABASE_PORT

cockpit = Cockpit()
cockpit.start()

sleep(3.0)

cockpit.backend.add_database("momentum", DATABASE_HOST, DATABASE_PORT)
print("Database added")

sleep(5.0)

cockpit.backend.start_workload("tpch_0_1", 300)
print("Workload started")

sleep(10.0)

cockpit.backend.stop_workload("tpch_0_1")
print("Workload stoped")

cockpit.backend.remove_database("momentum")
print("Workload removed")

print(cockpit.get_stderr())

cockpit.shutdown()
print("Cokcpit shutdown")
