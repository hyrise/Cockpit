"""CLI used to start the backend API."""
from hyrisecockpit.settings import (
    BACKEND_LISTENING,
    BACKEND_PORT,
    FLASK_DEBUG,
    FLASK_ENV,
)

from .app import create_app


def main() -> None:
    """Create and start a backend API."""
    app = create_app(FLASK_ENV)
    app.run(host=BACKEND_LISTENING, port=BACKEND_PORT, debug=FLASK_DEBUG)


if __name__ == "__main__":
    main()
