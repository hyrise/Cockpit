"""CLI used to start the backend API."""
from hyrisecockpit.backend.app import app
from settings import BACKEND_HOST, BACKEND_PORT


def main() -> None:
    """Create and start a backend API."""
    app.run(host=BACKEND_HOST, port=BACKEND_PORT, threaded=False)


main()
