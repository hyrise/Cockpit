"""CLI used to start the backend API."""
from hyrisecockpit.settings import BACKEND_HOST, BACKEND_PORT

from .app import app


def main() -> None:
    """Create and start a backend API."""
    app.run(host=BACKEND_HOST, port=BACKEND_PORT, threaded=False)
