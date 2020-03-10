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

# TODO set correct type
DB1_HOST = getenv("DB1_HOST")
DB1_PORT = getenv("DB1_PORT")
DB1_PASSWORD = getenv("DB1_PASSWORD")
DB1_TYPE = getenv("DB1_TYPE")

DB2_HOST = getenv("DB2_HOST")
DB2_PORT = getenv("DB2_PORT")
DB2_PASSWORD = getenv("DB2_PASSWORD")
DB2_TYPE = getenv("DB2_TYPE")
