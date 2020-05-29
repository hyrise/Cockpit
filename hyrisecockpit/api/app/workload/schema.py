"""Schema of a Workload."""
from marshmallow import Schema
from marshmallow.fields import Dict, Float, Integer, String


class WorkloadSchema(Schema):
    """Schema of a Workload."""

    folder_name = String(
        description="Name of the folder containing the pregenerated tables.",
        required=True,
    )
    frequency = Integer(
        description="Number of queries generated per second.", required=True
    )


class DetailedWorkloadSchema(WorkloadSchema):
    """Detailed schema of a Workload."""

    weights = Dict(
        keys=String(description="Name of the query."),
        values=Float(description="Weight of the query."),
        description="Weights of queries used for generation.",
    )
