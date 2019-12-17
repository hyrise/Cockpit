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
from typing import Optional

from dotenv import find_dotenv, load_dotenv

load_dotenv(find_dotenv())

BACKEND_HOST: Optional[str] = getenv("BACKEND_HOST")
BACKEND_PORT: Optional[str] = getenv("BACKEND_PORT")

DB_MANAGER_HOST: Optional[str] = getenv("DB_MANAGER_HOST")
DB_MANAGER_PORT: Optional[str] = getenv("DB_MANAGER_PORT")

GENERATOR_HOST: Optional[str] = getenv("GENERATOR_HOST")
GENERATOR_PORT: Optional[str] = getenv("GENERATOR_PORT")

WORKLOAD_SUB_HOST: Optional[str] = getenv("WORKLOAD_SUB_HOST")
WORKLOAD_PUBSUB_PORT: Optional[str] = getenv("WORKLOAD_PUBSUB_PORT")
