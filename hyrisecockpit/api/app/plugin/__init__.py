"""Plugin entity.

Plugins can be get, set, updated, and deleted.
"""

from flask import Flask
from flask_restx import Api

BASE_ROUTE: str = "control/plugin"


def register_routes(api: Api, app: Flask, root: str) -> None:
    """Register all workload routes."""
    from .controller import api as plugin_api

    api.add_namespace(plugin_api, path=f"{root}/{BASE_ROUTE}")
