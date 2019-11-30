"""Module for tasks to be submitted and executed.

Mimics cursor functionality from psycopg2.
"""
from rq.job import get_current_job


def execute(query, vars=None):
    """Execute a database operation (query or command)."""
    get_current_job().db_connection_cursor.execute(query, vars)


def executemany(query, vars_list):
    """Execute a database operation (query or command) with many vars."""
    get_current_job().db_connection_cursor.executemany(query, vars_list)
