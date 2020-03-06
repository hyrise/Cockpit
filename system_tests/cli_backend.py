"""CLI used to start the backend API."""
import logging

from hyrisecockpit.backend.app import app
from settings import BACKEND_HOST, BACKEND_PORT


def main() -> None:
    """Create and start a backend API."""
    log = logging.getLogger("werkzeug")
    log.disabled = True
    app.logger.disabled = True
    app.run(host=BACKEND_HOST, port=BACKEND_PORT, threaded=False)


main()
