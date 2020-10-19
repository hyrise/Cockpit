"""Monitor entity.

IMPORTANTE: To support the front-end the old monitor route defines in
app.py still exists. In the futer the front-end should use the monitoring route,
so that the monitor rout in app.py can be deleted.
"""

from flask import Flask
from flask_restx import Api

BASE_ROUTE_OLD: str = "monitor"
BASE_ROUTE_NEW: str = "monitoring"


def register_routes(api: Api, app: Flask, root: str) -> None:
    """Register all monitor routes."""
    from .controller import api as new_monitor_api
    from .app import api as old_monitor_api

    api.add_namespace(old_monitor_api, path=f"{root}/{BASE_ROUTE_OLD}")
    api.add_namespace(new_monitor_api, path=f"{root}/{BASE_ROUTE_NEW}")
