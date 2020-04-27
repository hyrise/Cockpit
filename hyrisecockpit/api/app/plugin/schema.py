"""Schema of a Plugin."""
from marshmallow import Schema
from marshmallow.fields import String


class PluginSchema(Schema):
    """Schema of a Plugin."""

    name = String(description="Identifier of the Plugin.", required=True)
