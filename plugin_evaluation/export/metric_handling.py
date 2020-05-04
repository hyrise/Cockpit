"""Functions for metric handling."""


def idle_function(value):
    """Doesn't change the input value."""
    return value


def ns_to_ms(value):
    """Convert ns to ms."""
    return value / 1_000_000
