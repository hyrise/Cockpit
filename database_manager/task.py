"""Module for tasks to be submitted and executed.

Mimics cursor functionality from psycopg2.
"""
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
    get_current_job().db_connection_cursor.executemany(query_list, range(n_queries))
