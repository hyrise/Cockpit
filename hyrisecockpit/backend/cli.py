"""CLI used to start the backend API."""
from hyrisecockpit.settings import BACKEND_LISTENING, BACKEND_PORT

from .app import app


def main() -> None:
    """Create and start a backend API."""
    app.run(host=BACKEND_LISTENING, port=BACKEND_PORT, threaded=False)
