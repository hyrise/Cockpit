"""Meta information entity.

Namespace for hyrise meta information.
"""

from flask import Flask
from flask_restx import Api

BASE_ROUTE: str = "status"


def register_routes(api: Api, app: Flask, root: str) -> None:
    """Register all sql routes."""
    from .controller import api as status_api

    api.add_namespace(status_api, path=f"{root}/{BASE_ROUTE}")
