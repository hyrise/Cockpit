"""Module for tasks to be submitted and executed.

Mimics cursor functionality from psycopg2.
"""
from pandas import DataFrame
from pandas.io.sql import read_sql_query
from rq.job import get_current_job


def execute(query, vars=None):
    """Execute a database operation (query or command)."""
    n_queries = 1
    job = get_current_job()
    job.meta["n_queries"] = n_queries

    job.db_connection_cursor.execute(query, vars)


def executemany(query, vars_list):
    """Execute a database operation (query or command) with many vars."""
    n_queries = len(vars_list)
    job = get_current_job()
    job.meta["n_queries"] = n_queries

    job.db_connection_cursor.executemany(query, vars_list)


def executelist(query_list):
    """Execute a list of database operations (queries or commands)."""
    n_queries = len(query_list)
    job = get_current_job()
    job.meta["n_queries"] = n_queries

    for query in query_list:
        job.db_connection_cursor.execute(query)


def get_hyrise_storage():
    """Get storage metadata from a Hyrise database."""
    n_queries = 1
    job = get_current_job()
    job.meta["n_queries"] = n_queries

    meta_segments = read_sql_query("SELECT * FROM meta_segments;", job.db_connection)
    meta_segments.set_index(
        ["table", "column_name", "chunk_id"], inplace=True, verify_integrity=True
    )
    size = DataFrame(
        meta_segments["estimated_size_in_bytes"]
        .groupby(level=["table", "column_name"])
        .sum()
    )
    encoding = DataFrame(
        meta_segments["encoding"].groupby(level=["table", "column_name"]).apply(set)
    )
    datatype = meta_segments.reset_index().set_index(["table", "column_name"])[
        ["column_data_type"]
    ]
    result = size.join(encoding).join(datatype)
    return result.to_dict()
