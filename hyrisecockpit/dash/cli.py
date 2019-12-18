"""CLI used to start the dash demo frontend."""
from .index import app


def main() -> None:
    """Create and start a dash frontend."""
    app.run_server(debug=True)
