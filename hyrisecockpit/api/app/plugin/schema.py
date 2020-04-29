"""Schema of a Plugin."""
from marshmallow import Schema
from marshmallow.fields import Nested, String


class PluginSchema(Schema):
    """Schema of a Plugin."""

    name = String(description="Identifier of the Plugin.", required=True)


class PluginIDSchema(Schema):
    """Schema of Plugins per database."""

    id = String(description="Identifier of the database.", required=True)
    plugins = Nested(
        PluginSchema, description="Plugins per database.", many=True, required=True
    )
