"""Monitor entity.

Should be split into multiple entities.
"""

from flask import Flask
from flask_restx import Api

BASE_ROUTE: str = "metric"


def register_routes(api: Api, app: Flask, root: str) -> None:
    """Register all monitor routes."""
    from .controller import api as metric_api

    api.add_namespace(metric_api, path=f"{root}/{BASE_ROUTE}")
