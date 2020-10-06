"""Module for environmental variables."""
from os import getenv

BACKEND_HOST: str = getenv("BACKEND_HOST", "0.0.0.0")
BACKEND_PORT: str = getenv("BACKEND_PORT", "8000")

STORAGE_HOST: str = getenv("STORAGE_HOST", "influxdb")
STORAGE_PORT: str = getenv("STORAGE_PORT", "8086")
STORAGE_USER: str = getenv("STORAGE_USER", "root")
STORAGE_PASSWORD: str = getenv("STORAGE_PASSWORD", "root")

DATABASE_HOST: str = getenv("DATABASE_HOST", "localhost")
DATABASE_PORT: str = getenv("DATABASE_PORT", "5432")

SETUP_TIMEOUT: int = int(getenv("SETUP_TIMEOUT", 10))
DEFAULT_TIME_OUT: int = int(getenv("DEFAULT_TIME_OUT", 4))
REQUEST_TIMEOUT: int = int(getenv("REQUEST_TIMEOUT", 5))
