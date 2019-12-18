"""CLI used to start the workload generator."""
from hyrisecockpit.settings import (
    GENERATOR_HOST,
    GENERATOR_PORT,
    WORKLOAD_PUBSUB_PORT,
    WORKLOAD_SUB_HOST,
)

from .generator import WorkloadGenerator


def main() -> None:
    """Create and start a workload generator."""
    WorkloadGenerator(
        GENERATOR_HOST, GENERATOR_PORT, WORKLOAD_SUB_HOST, WORKLOAD_PUBSUB_PORT
    ).start()
