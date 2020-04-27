"""Module for environmental variables."""
from os import getenv

from dotenv import find_dotenv, load_dotenv

load_dotenv(find_dotenv())

BACKEND_HOST: str = getenv("BACKEND_HOST", "127.0.0.1")
BACKEND_PORT: str = getenv("BACKEND_PORT", "20000")

FLASK_ENV: str = getenv("FLASK_ENV", "development")
FLASK_DEBUG: bool = bool(getenv("FLASK_DEBUG", True))

DB_MANAGER_HOST: str = getenv("DB_MANAGER_HOST", "127.0.0.1")
DB_MANAGER_PORT: str = getenv("DB_MANAGER_PORT", "20001")

GENERATOR_HOST: str = getenv("GENERATOR_HOST", "127.0.0.1")
GENERATOR_PORT: str = getenv("GENERATOR_PORT", "20002")

WORKLOAD_SUB_HOST: str = getenv("WORKLOAD_SUB_HOST", "127.0.0.1")
WORKLOAD_PUBSUB_PORT: str = getenv("WORKLOAD_PUBSUB_PORT", "20003")

DEFAULT_TABLES: str = getenv("DEFAULT_TABLES", "tpch_0.1")

STORAGE_HOST: str = getenv("STORAGE_HOST", "influxdb")
STORAGE_PORT: str = getenv("STORAGE_PORT", "8086")
STORAGE_USER: str = getenv("STORAGE_USER", "root")
STORAGE_PASSWORD: str = getenv("STORAGE_PASSWORD", "root")

DATABASE_HOST: str = getenv("DATABASE_HOST", "vm-momentum.eaalab.hpi.uni-potsdam.de")
DATABASE_PORT: str = getenv("DATABASE_PORT", "5432")
