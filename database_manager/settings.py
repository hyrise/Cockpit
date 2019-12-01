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
DB_MANAGER_PORT = getenv("DB_MANAGER_PORT")

QUEUE_HOST = getenv("QUEUE_HOST")
QUEUE_PORT = getenv("QUEUE_PORT")
QUEUE_DB = getenv("QUEUE_DB")
QUEUE_PASSWORD = getenv("QUEUE_PASSWORD")

DB1_USER = getenv("DB1_USER")
DB1_PASSWORD = getenv("DB1_PASSWORD")
DB1_HOST = getenv("DB1_HOST")
DB1_PORT = getenv("DB1_PORT")
DB1_NAME = getenv("DB1_NAME")

DB2_USER = getenv("DB2_USER")
DB2_PASSWORD = getenv("DB2_PASSWORD")
DB2_HOST = getenv("DB2_HOST")
DB2_PORT = getenv("DB2_PORT")
DB2_NAME = getenv("DB2_NAME")
