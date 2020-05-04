"""Module for user interface."""
from sys import stdout
from time import sleep

prefix_length = 36


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
        n_prefix_spaces = prefix_length - len(prefix)
        stdout.write(
            "\r{0}{1}[{2}{3}{4}] {5} % {6} s / {7} s".format(
                prefix,
                " " * n_prefix_spaces,
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


class DoneStatus:
    """Print done status."""

    def __init__(self, message: str):
        """Initialize message."""
        self.message = message

    def __enter__(self):
        """Write message."""
        stdout.write(self.message)
        stdout.flush()

    def __exit__(self, *args):
        """Write done status."""
        n_prefix_spaces = prefix_length - len(self.message)
        stdout.write("\r{0}{1}DONE\n".format(self.message, " " * n_prefix_spaces))
