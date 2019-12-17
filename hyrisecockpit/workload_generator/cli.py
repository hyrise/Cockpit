"""CLI used to start the workload generator."""
from .generator import WorkloadGenerator


def main() -> None:
    """Create and start a workload generator."""
    WorkloadGenerator().start()
