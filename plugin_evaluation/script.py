"""Prototype of the scenario script."""

from sys import stdout
from time import sleep, time_ns

from figlet import intro
from plugin_evaluation.cockpit_management.cockpit import Cockpit
from plugin_evaluation.exporter import Exporter
from plugin_evaluation.settings import DATABASE_HOST, DATABASE_PORT

workload_execution_time = 10


def show_bar(prefix: str, sec: int) -> None:
    """Show bar for specific amount of time."""
    frequency = 10
    length = 20
    for i in range(sec * frequency):
        progress = i / (sec * frequency)
        n_routes = int(progress * length)
        n_spaces = length - n_routes - 1
        n_hats = 1 if n_routes != length else 0
        progress_percent = "%3.1f" % (progress * 100.0)
        time_left = "%3.1f" % (sec - progress * sec)
        stdout.write(
            "\r{0}[{1}{2}{3}] {4} % {5} s".format(
                prefix,
                "=" * n_routes,
                ">" * n_hats,
                " " * n_spaces,
                progress_percent,
                time_left,
            )
        )
        stdout.flush()
        sleep(1.0 / frequency)
    stdout.write(
        "\r{0}[{1}{2}] {3} % {4} s\n".format(prefix, "=" * length, "", 100.0, 0.0)
    )


print(intro)

stdout.write("Starting cockpit...")
cockpit = Cockpit()
cockpit.start()
stdout.write("\rStarting cockpit...                 DONE\n")

sleep(3.0)

stdout.write("Adding database...")
cockpit.backend.add_database("momentum", DATABASE_HOST, DATABASE_PORT)
stdout.write("\rAdding database...                  DONE\n")

show_bar("Waiting default tables to load...   ", 5)

stdout.write("Starting a workload...")
cockpit.backend.start_workload("tpch_0_1", 300)
stdout.write("\rStarting a workload...              DONE\n")


startts = time_ns()

show_bar("Executing a workload...             ", workload_execution_time)

endts = time_ns()
sleep(1.0)

stdout.write("Stopping a workload...")
cockpit.backend.stop_workload("tpch_0_1")
stdout.write("\rStopping a workload...              DONE\n")

stdout.write("Removing database...")
cockpit.backend.remove_database("momentum")
stdout.write("\rRemoving database...                DONE\n")


stdout.write("Cockpit shutdown...")
cockpit.shutdown()
stdout.write("\rCockpit shutdown...                 DONE\n")

sleep(3.0)

stdout.write("Export...")
exporter = Exporter()
exporter.plot_metric("throughput", "momentum", startts, endts)
exporter.plot_metric("latency", "momentum", startts, endts)
exporter.plot_metric("queue_length", "momentum", startts, endts)
exporter.plot_metric("cpu_process_usage", "momentum", startts, endts)
stdout.write("\rExport...                           DONE\n")
