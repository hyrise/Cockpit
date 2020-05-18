"""Schema of a Plugin."""
from marshmallow import Schema
from marshmallow.fields import Nested, String


class PluginSchema(Schema):
    """Schema of a Plugin."""

    name = String(
        description="Identifier of the Plugin.",
        required=True,
        default="CompressionPlugin",
    )


class PluginSettingBaseSchema(Schema):
    """Base schema of a Plugin Setting."""

    name = String(
        description="Name of the setting that shall be set.",
        required=True,
        default="MemoryBudget",
    )
    value = String(
        description="Value the setting should have.", required=True, default="5000"
    )


class UpdatePluginSettingSchema(PluginSchema):
    """Schema to update a plugin setting."""

    setting = Nested(
        PluginSettingBaseSchema, description="Settings of the Plugin", required=True
    )


class PluginSettingSchema(PluginSettingBaseSchema):
    """Schema of a Plugin Setting."""

    description = String(
        description="Description of the plugin setting.",
        required=True,
        default="This text describes a setting.",
    )


class DetailedPluginSchema(PluginSchema):
    """Schema of a detailed Plugin."""

    settings = Nested(
        PluginSettingSchema,
        description="Settings of the Plugin",
        many=True,
        required=True,
    )


class DetailedPluginIDSchema(Schema):
    """Schema of detailed Plugins per database."""

    id = String(
        description="Identifier of the database.", required=True, default="citdalle"
    )
    plugins = Nested(
        DetailedPluginSchema,
        description="Detailed Plugins per database, none if the database is blocked.",
        many=True,
        required=True,
        allow_none=True,
    )
