import time

import pandas as pd
from rq.worker import Worker

import psycopg2

DATABASE_HOST = ""
DATABASE_PORT = 0
DATABASE_NAME = "postgres"
DATABASE_USER = "serviceuser"
DATABASE_PASSWORD = "serviceuser"

connection_pool = []


class HyriseWorker(Worker):
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
        # print(f"Connection poll filled: {id(connection_pool)}")
        return super().work(*args, **kwargs)


def get_connection():
    # print(f"Connection poll accessed: {id(connection_pool[0])}")
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


def execute_raw_query_task(query):
    conn = get_connection()
    cur = conn.cursor()
    start = time.time()
    cur.execute(query)
    return time.time() - start


def execute_raw_workload_task(workload):
    for query in workload:
        pass
        # cur.execute(query)

    # TODO measure throughput
    return 1
