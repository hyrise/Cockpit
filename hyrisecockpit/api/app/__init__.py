"""Factory method to create an app."""

from flask import Flask
from flask_restx import Api


def create_app(env=None) -> Flask:
    """Create an app."""
    from .routes import register_routes

    app: Flask = Flask(__name__)
    api: Api = Api(app, title="Flaskerific API", version="0.1.0")

    register_routes(api, app)
    return app
