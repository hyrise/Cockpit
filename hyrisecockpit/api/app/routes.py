"""Method to register all routes of this app."""

from flask import Flask
from flask_restx import Api


def register_routes(api: Api, app: Flask, root: str = "api") -> None:
    """Register all sub-routes."""
    from .workload import register_routes as attach_workload

    attach_workload(api, app, root)
