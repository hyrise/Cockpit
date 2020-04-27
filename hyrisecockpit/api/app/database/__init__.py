"""Database entity.

Should be split into multiple entities.
"""

from flask import Flask
from flask_restx import Api

BASE_ROUTE: str = "control/database"


def register_routes(api: Api, app: Flask, root: str) -> None:
    """Register all control routes."""
    from .controller import api as database_api

    api.add_namespace(database_api, path=f"{root}/{BASE_ROUTE}")
