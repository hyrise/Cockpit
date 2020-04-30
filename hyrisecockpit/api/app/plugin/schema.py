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
        PluginSchema,
        description="Plugins per database, none if the database is blocked.",
        many=True,
        required=True,
        allow_none=True,
    )


class PluginSettingBaseSchema(Schema):
    """Base schema of a Plugin Setting."""

    name = String(description="Name of the setting that shall be set.", required=True)
    value = String(description="Value the setting should have.", required=True)


class PluginSettingSchema(PluginSettingBaseSchema):
    """Schema of a Plugin Setting."""

    description = String(
        description="Description of the plugin setting.", required=True
    )


class DetailedPluginSchema(PluginSchema):
    """Schema of a detailed Plugin."""

    settings = Nested(
        PluginSettingSchema,
        description="Settings of the Plugin",
        many=True,
        required=True,
    )
