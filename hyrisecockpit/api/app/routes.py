"""Method to register all routes of this app."""

from flask import Flask
from flask_restx import Api


def register_routes(api: Api, app: Flask, root: str = "/api") -> None:
    """Register all sub-routes."""
    from .workload import register_routes as attach_workload
    from .database import register_routes as attach_database
    from .monitor import register_routes as attach_monitor
    from .control import register_routes as attach_control
    from .plugin import register_routes as attach_plugin

    attach_workload(api, app, root)
    attach_database(api, app, root)
    attach_monitor(api, app, root)
    attach_control(api, app, root)
    attach_plugin(api, app, root)
