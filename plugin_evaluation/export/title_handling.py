"""Functions for title handling."""
from plugin_evaluation.export.points_handling import _format_query_name


def format_idle(title: str, parameter):
    """Return title."""
    return title


def format_single_parameter(title: str, parameter):
    """Return title with single parameter."""
    return title.format(parameter)


def format_workload_parameter(title: str, parameter):
    """Return title with workload parameter."""
    benchmark = parameter[0]
    query_number = parameter[1]
    formated_query_name: str = _format_query_name(benchmark, query_number)

    return title.format(formated_query_name)
