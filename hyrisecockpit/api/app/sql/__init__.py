"""SQL entity.

Namespace for sql.
"""

from flask import Flask
from flask_restx import Api

BASE_ROUTE: str = "control/sql"


def register_routes(api: Api, app: Flask, root: str) -> None:
    """Register all sql routes."""
    from .controller import api as sql_api

    api.add_namespace(sql_api, path=f"{root}/{BASE_ROUTE}")
