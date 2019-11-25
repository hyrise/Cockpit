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

from dotenv import load_dotenv

load_dotenv()

DATABASE_HOST = getenv("DATABASE_HOST")
DATABASE_PORT = getenv("DATABASE_PORT")
DATABASE_NAME = getenv("DATABASE_NAME")
DATABASE_USER = getenv("DATABASE_USER")
DATABASE_PASSWORD = getenv("DATABASE_PASSWORD")

HI_HOST = getenv("HI_HOST")
HI_PORT = getenv("HI_PORT")
