"""Module for printing colored text."""


def print_green(value):
    """Print green colored text."""
    print("\033[92m{}\033[00m".format(value))


def print_yellow(value):
    """Print yellow colored text."""
    print("\033[93m{}\033[00m".format(value))


def print_red(value):
    """Print red colored text."""
    print("\033[91m{}\033[00m".format(value))


def print_cyan(value):
    """Print cyan colored text."""
    print("\033[96m{}\033[00m".format(value))
