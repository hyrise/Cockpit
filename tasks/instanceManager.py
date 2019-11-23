import pandas as pd
import psycopg2
from rq.worker import Worker

from settings import (
    DATABASE_HOST,
    DATABASE_NAME,
    DATABASE_PASSWORD,
    DATABASE_PORT,
    DATABASE_USER,
)

connection_pool = []


class MyWorker(Worker):
    def work(self, *args, **kwargs):
        connection = psycopg2.connect(
            dbname=DATABASE_NAME,
            user=DATABASE_USER,
            password=DATABASE_PASSWORD,
            host=DATABASE_HOST,
            port=DATABASE_PORT,
        )
        connection.set_session(autocommit=True)
        connection_pool.append(connection)
        return super().work(*args, **kwargs)


def get_connection():
    return connection_pool[0]


def get_storage_data_task():
    conn = get_connection()
    meta_segments = pd.io.sql.read_sql_query("SELECT * FROM meta_segments;", conn)
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
    datatype = meta_segments.reset_index().set_index(["table", "column_name"])[
        ["column_data_type"]
    ]

    result = size.join(encoding).join(datatype)

    return result.to_dict()
