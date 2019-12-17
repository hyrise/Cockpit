"""CLI used to start the database manager."""
from .manager import DatabaseManager


def main():
    """Create and start a database manager."""
    DatabaseManager().start()
