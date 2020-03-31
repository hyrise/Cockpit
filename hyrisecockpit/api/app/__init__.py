"""Factory method to create an app."""

from flask import Flask
from flask_cors import CORS
from flask_restx import Api


def create_app(env=None) -> Flask:
    """Create an app."""
    from .routes import register_routes

    app: Flask = Flask(__name__)
    CORS(app)
    api: Api = Api(
        app,
        title="Hyrise Cockpit",
        description="Monitor and control multiple databases at once.",
        version="2.0",
    )

    register_routes(api, app, root="")
    return app
