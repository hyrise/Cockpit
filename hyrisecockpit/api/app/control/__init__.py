"""Control entity.

Should be split into multiple entities.
"""

from flask import Flask
from flask_restx import Api

BASE_ROUTE: str = "control"


def register_routes(api: Api, app: Flask, root: str) -> None:
    """Register all control routes."""
    from .controller import api as control_api

    api.add_namespace(control_api, path=f"{root}/{BASE_ROUTE}")
