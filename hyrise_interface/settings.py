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

HYRISE_INTERFACE_HOST = getenv("HYRISE_INTERFACE_HOST")
HYRISE_INTERFACE_PORT = getenv("HYRISE_INTERFACE_PORT")

HYRISE1_HOST = getenv("HYRISE1_HOST")
HYRISE1_PORT = getenv("HYRISE1_PORT")
HYRISE1_USER = getenv("HYRISE1_USER")
HYRISE1_PASSWORD = getenv("HYRISE1_PASSWORD")

HYRISE2_HOST = getenv("HYRISE2_HOST")
HYRISE2_PORT = getenv("HYRISE2_PORT")
HYRISE2_USER = getenv("HYRISE2_USER")
HYRISE2_PASSWORD = getenv("HYRISE2_PASSWORD")
