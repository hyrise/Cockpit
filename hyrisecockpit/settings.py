"""Module for loading environment variables.

Variables that should not be commited can be stored in a .env file:

```
FOO=BAR
EX=AMPLE
```

Set those variables in the .env file, load them here,
and import the variables from this module.
"""
from os import getenv

from dotenv import find_dotenv, load_dotenv

load_dotenv(find_dotenv())

BACKEND_HOST: str = getenv("BACKEND_HOST", "127.0.0.1")
BACKEND_PORT: str = getenv("BACKEND_PORT", "8000")
BACKEND_LISTENING: str = getenv("BACKEND_LISTENING", "0.0.0.0")

DB_MANAGER_HOST: str = getenv("DB_MANAGER_HOST", "manager")
DB_MANAGER_PORT: str = getenv("DB_MANAGER_PORT", "8001")
DB_MANAGER_LISTENING: str = getenv("DB_MANAGER_LISTENING", "*")

GENERATOR_HOST: str = getenv("GENERATOR_HOST", "generator")
GENERATOR_PORT: str = getenv("GENERATOR_PORT", "8002")
GENERATOR_LISTENING: str = getenv("GENERATOR_LISTENING", "*")

WORKLOAD_SUB_HOST: str = getenv("WORKLOAD_SUB_HOST", "generator")
WORKLOAD_PUBSUB_PORT: str = getenv("WORKLOAD_PUBSUB_PORT", "8003")
WORKLOAD_LISTENING: str = getenv("WORKLOAD_LISTENING", "*")

DEFAULT_TABLES: str = getenv("DEFAULT_TABLES", "tpch_0_1")

STORAGE_HOST: str = getenv("STORAGE_HOST", "influxdb")
STORAGE_PORT: str = getenv("STORAGE_PORT", "8086")
STORAGE_USER: str = getenv("STORAGE_USER", "root")
STORAGE_PASSWORD: str = getenv("STORAGE_PASSWORD", "root")

FLASK_ENV: str = getenv("FLASK_ENV", "development")
FLASK_DEBUG: bool = bool(getenv("FLASK_DEBUG", True))
