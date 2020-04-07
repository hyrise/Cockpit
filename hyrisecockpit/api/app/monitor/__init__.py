"""Monitor entity.

Should be split into multiple entities.
"""

from flask import Flask
from flask_restx import Api

BASE_ROUTE: str = "monitor"


def register_routes(api: Api, app: Flask, root: str) -> None:
    """Register all monitor routes."""
    from .app import api as monitor_api

    api.add_namespace(monitor_api, path=f"{root}/{BASE_ROUTE}")
