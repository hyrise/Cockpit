"""CLI used to start the backend API."""
import logging

from hyrisecockpit.api.app import create_app
from utils.plugin_evaluation.cockpit_management.settings import (
    BACKEND_HOST,
    BACKEND_PORT,
    FLASK_DEBUG,
    FLASK_ENV,
)


def main() -> None:
    """Create and start a backend API."""
    app = create_app(FLASK_ENV)
    log = logging.getLogger("werkzeug")
    log.disabled = True
    app.logger.disabled = True
    print(f"port: {BACKEND_PORT}")
    app.run(host=BACKEND_HOST, port=BACKEND_PORT, debug=FLASK_DEBUG, threaded=True)


main()
