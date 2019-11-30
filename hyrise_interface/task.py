"""Module for tasks to be submitted and executed.

Mimics cursor functionality from psycopg2.
"""
from rq.job import get_current_job


def execute(query, vars=None):
    """Execute a database operation (query or command)."""
    with get_current_job().db_connection.cursor() as cursor:
        cursor.execute(query, vars)


def executemany(query, vars_list):
    """Execute a database operation (query or command) with many vars."""
    with get_current_job().db_connection.cursor() as cursor:
        cursor.executemany(query, vars_list)
