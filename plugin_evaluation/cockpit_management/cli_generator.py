"""CLI used to start the workload generator."""
from hyrisecockpit.workload_generator.generator import WorkloadGenerator
from plugin_evaluation.cockpit_management.settings import (
    GENERATOR_HOST,
    GENERATOR_PORT,
    WORKLOAD_PUBSUB_PORT,
    WORKLOAD_SUB_HOST,
)


def main() -> None:
    """Create and start a workload generator."""
    try:
        with WorkloadGenerator(
            GENERATOR_HOST, GENERATOR_PORT, WORKLOAD_SUB_HOST, WORKLOAD_PUBSUB_PORT,
        ) as workload_generator:
            workload_generator.start()
    except KeyboardInterrupt:
        print("Workload Generator closed.")


main()
