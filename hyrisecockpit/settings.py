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
BACKEND_PORT: str = getenv("BACKEND_PORT", "6000")

DB_MANAGER_HOST: str = getenv("DB_MANAGER_HOST", "127.0.0.1")
DB_MANAGER_PORT: str = getenv("DB_MANAGER_PORT", "6555")

GENERATOR_HOST: str = getenv("GENERATOR_HOST", "127.0.0.1")
GENERATOR_PORT: str = getenv("GENERATOR_PORT", "6001")

WORKLOAD_SUB_HOST: str = getenv("WORKLOAD_SUB_HOST", "127.0.0.1")
WORKLOAD_PUBSUB_PORT: str = getenv("WORKLOAD_PUBSUB_PORT", "6556")

WORKLOAD_LOCATION: str = getenv("WORKLOAD_LOCATION", "workloads/workload_queries/")
