"""Workload entity.

Workloads can be get, set, updated, and deleted.
"""

from flask import Flask
from flask_restx import Api

from .model import Workload  # noqa: F401
from .schema import WorkloadSchema  # noqa: F401

BASE_ROUTE: str = "workload"


def register_routes(api: Api, app: Flask, root: str) -> None:
    """Register all workload routes."""
    from .controller import api as workload_api

    api.add_namespace(workload_api, path=f"{root}/{BASE_ROUTE}")
