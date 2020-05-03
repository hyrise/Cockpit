"""Module for user interface."""
from sys import stdout
from time import sleep


def show_bar(prefix: str, sec: int) -> None:
    """Show bar for specific amount of time."""
    frequency = 10
    length = 20
    for i in range(sec * frequency):
        progress = i / (sec * frequency)
        n_routes = int(progress * length)
        n_spaces = length - n_routes - 1
        n_hats = 1 if n_routes != length else 0
        progress_percent = "%.1f" % (progress * 100.0)
        time_left = "%.1f" % (sec - progress * sec)
        stdout.write(
            "\r{0}[{1}{2}{3}] {4} % {5} s / {6} s".format(
                prefix,
                "=" * n_routes,
                ">" * n_hats,
                " " * n_spaces,
                progress_percent,
                time_left,
                "%.1f" % sec,
            )
        )
        stdout.flush()
        sleep(1.0 / frequency)
    stdout.write(
        "\r{0}[{1}{2}] 100.0 % 0.0 s / {3} s\n".format(
            prefix, "=" * length, "", "%.1f" % sec
        )
    )
