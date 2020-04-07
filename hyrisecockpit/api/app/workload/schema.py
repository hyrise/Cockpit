"""Schema of a Workload."""
from marshmallow import Schema
from marshmallow.fields import Integer, String


class WorkloadSchema(Schema):
    """Schema of a Workload."""

    workload_id = String(description="Identifier of the Workload.", required=True)
    folder_name = String(
        description="Name of the folder containing the pregenerated tables.",
        required=True,
    )
    frequency = Integer(
        description="Number of queries generated per second.", required=True
    )
