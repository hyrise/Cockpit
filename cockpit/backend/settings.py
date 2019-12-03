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

DB_MANAGER_HOST = getenv("DB_MANAGER_HOST")
DB_MANAGER_PORT = int(getenv("DB_MANAGER_PORT"))

GENERATOR_HOST = getenv("GENERATOR_HOST")
GENERATOR_PORT = int(getenv("GENERATOR_PORT"))

BACKEND_HOST = getenv("BACKEND_HOST")
BACKEND_PORT = int(getenv("BACKEND_PORT"))
