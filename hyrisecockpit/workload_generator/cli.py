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
    with WorkloadGenerator(
        GENERATOR_HOST, GENERATOR_PORT, WORKLOAD_SUB_HOST, WORKLOAD_PUBSUB_PORT
    ) as workload_generator:
        workload_generator.start()
