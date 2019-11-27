"""Module for executing tasks of a Queue.

Includes a HyriseWorker with a connection to a Hyrise DB.
Includes different tasks ready to be executed.
"""

import json

import pandas as pd

connection_pool = []
redis_connection_pool = []


def get_connection():
    """Return the first connection of the pool."""
    # print(f"Connection poll accessed: {id(connection_pool[0])}")
    return connection_pool[0]


def get_redis_connection():
    """Return the first connection of the redis pool."""
    return redis_connection_pool[0]


def get_storage_data_task():
    """Return the storage metadata of a Hyrise DB."""
    r = get_redis_connection()
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
    encoding["encoding"] = encoding["encoding"].apply(list)

    datatype = meta_segments.reset_index().set_index(["table", "column_name"])[
        ["column_data_type"]
    ]
    result = size.join(encoding).join(datatype)
    r.set("storage_data", create_storage_data_json(result))


def create_storage_data_json(table):
    """Create JSON string from storage data table."""
    output = {}
    grouped = table.reset_index().groupby("table")
    for column in grouped.groups:
        output[column] = {"size": 0, "number_columns": 0, "data": {}}
        for _index, row in grouped.get_group(column).iterrows():
            output[column]["number_columns"] = output[column]["number_columns"] + 1
            output[column]["size"] = (
                output[column]["size"] + row["estimated_size_in_bytes"]
            )
            output[column]["data"][row["column_name"]] = {
                "size": row["estimated_size_in_bytes"],
                "data_type": row["column_data_type"],
                "encoding": row["encoding"],
            }

    return json.dumps(output)


def execute_raw_query_task(query):
    """Execute a SQL query, save increment throughput counter in redis."""
    r = get_redis_connection()
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(query)
    r.set("throughput_counter", int(r.get("throughput_counter").decode("utf-8")) + 1)


def execute_raw_workload_task(workload):
    """Execute a list of SQL queries, return the avg. time it took."""
    r = get_redis_connection()
    conn = get_connection()
    cur = conn.cursor()
    for query in workload:
        cur.execute(query)
        r.set(
            "throughput_counter", int(r.get("throughput_counter").decode("utf-8")) + 1
        )
    # for query in workload:
    #     cur.execute(query)
    # TODO measure throughput
