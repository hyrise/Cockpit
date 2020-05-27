"""Schema of a Plugin."""
from marshmallow import Schema
from marshmallow.fields import Integer, List, Nested, String

field_id = String(
    description="Identifier of the database.", required=True, default="citdalle"
)


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

    settings = List(
        Nested(PluginSettingSchema), description="Settings of the Plugin", required=True
    )


class DetailedPluginIDSchema(Schema):
    """Schema of detailed Plugins per database."""

    id = field_id
    plugins = List(
        Nested(DetailedPluginSchema),
        allow_none=True,
        description="Detailed Plugins per database, none if the database is blocked.",
        required=True,
    )


class LogEntrySchema(Schema):
    """Schema of a Plugin Log Entry."""

    timestamp = Integer(
        description="Timestamp in nanoseconds.", required=True, default=1583847966784,
    )
    reporter = String(
        description="Plugin reporting to the log.",
        required=True,
        default="CompressionPlugin",
    )
    message = String(
        description="Message logged.",
        required=True,
        default="No optimization possible with given parameters!",
    )
    level = String(
        description="Level of the log message.", required=True, default="Warning"
    )


class LogIDSchema(Schema):
    """Schema of a Plugin Log per database."""

    id = field_id
    log = List(
        Nested(LogEntrySchema),
        description="Plugin Log of the database.",
        required=True,
    )
