"""CLI used to start the backend API."""
from hyrisecockpit import settings as s

from .app import app


def main():
    """Create and start a backend API."""
    app.run(host=s.BACKEND_HOST, port=s.BACKEND_PORT)
