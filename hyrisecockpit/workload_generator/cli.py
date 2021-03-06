"""CLI used to start the workload generator."""
from hyrisecockpit.settings import (
    GENERATOR_LISTENING,
    GENERATOR_PORT,
    WORKLOAD_LISTENING,
    WORKLOAD_PUBSUB_PORT,
)

from .generator import WorkloadGenerator


def main() -> None:
    """Create and start a workload generator."""
    try:
        with WorkloadGenerator(
            GENERATOR_LISTENING,
            GENERATOR_PORT,
            WORKLOAD_LISTENING,
            WORKLOAD_PUBSUB_PORT,
        ) as workload_generator:
            workload_generator.start()
    except KeyboardInterrupt:
        print("Workload Generator closed.")
