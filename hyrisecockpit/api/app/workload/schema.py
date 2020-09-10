"""Schema of a Workload."""
from marshmallow import Schema
from marshmallow.fields import Boolean, Dict, Float, Integer, List, String


class BaseWorkloadSchema(Schema):
    """Schema of a base Workload."""

    workload_type = String(description="Name of the workload.", required=True,)
    frequency = Integer(
        description="Number of queries generated per second.", required=True
    )
    scale_factor = Float(description="Scale factor of workload.", required=True)
    weights = Dict(
        keys=String(description="Name of the query."),
        values=Float(description="Weight of the query."),
        description="Weights of queries used for generation.",
    )


class WorkloadSchema(BaseWorkloadSchema):
    """Detailed schema of a Workload."""

    running = Boolean(description="Running status of workload.",)


class DetailedWorkloadSchema(BaseWorkloadSchema):
    """Detailed schema of a detailed Workload."""

    running = Boolean(description="Running status of workload.",)
    supported_scale_factors = List(
        Float(description="Available scale factor for workload type.", required=True)
    )
    default_weights = Dict(
        keys=String(description="Name of the query."),
        values=Float(description="Weight of the query."),
        description="Default weights of queries used for generation.",
    )
