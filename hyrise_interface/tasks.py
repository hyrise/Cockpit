"""Module for executing tasks of a Queue.

Includes a HyriseWorker with a connection to a Hyrise DB.
Includes different tasks ready to be executed.
"""

import pandas as pd
from psycopg2 import connection

import settings as s

connection_pool = []
redis_connection_pool = []


class Cursor:
    """Custom cursor class. Gets a connection and closes it with 'with'."""

    def __enter__(self):
        """Establish connection and cursor."""
        self.connection = connection(
            dbname=s.HYRISE1_NAME,
            user=s.HYRISE1_USER,
            password=s.HYRISE1_PASSWORD,
            host=s.HYRISE1_HOST,
            port=s.HYRISE1_PORT,
        )
        self.cursor = self.connection.cursor()
        return self

    def __exit__(self, type, value, traceback):
        """Close connection and cursor."""
        self.cursor.close()
        self.connection.close()

    def execute(self, *args, **kwargs):
        """Hand execution to the underlying cursor."""
        self.cursor.execute(*args, **kwargs)


def get_storage_data_task():
    """Return the storage metadata of a Hyrise DB."""
    with Cursor() as cur:
        meta_segments = pd.io.sql.read_sql_query(
            "SELECT * FROM meta_segments;", cur.connection
        )
        meta_segments.set_index(
            ["table", "column_name", "chunk_id"], inplace=True, verify_integrity=True
        )

        size = pd.DataFrame(
            meta_segments["estimated_size_in_bytes"]
            .groupby(level=["table", "column_name"])
            .sum()
        )
        encoding = pd.DataFrame(
            meta_segments["encoding"].groupby(level=["table", "column_name"]).apply(set)
        )
        encoding["encoding"] = encoding["encoding"].apply(list)

        datatype = meta_segments.reset_index().set_index(["table", "column_name"])[
            ["column_data_type"]
        ]
        result = size.join(encoding).join(datatype)
        return (
            result  # TODO return the result as json, current result might not be stable
        )


def execute(*args, **kwargs):
    """Execute a SQL query."""
    with Cursor() as c:
        c.execute(*args, **kwargs)


def executemany(*args, **kwargs):
    """Execute many SQL queries."""
    with Cursor() as c:
        c.executemany(*args, **kwargs)
