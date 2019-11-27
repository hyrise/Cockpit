"""Module for the HyriseWorker.

HyriseWorker is a custom rq worker.
"""
import psycopg2
import redis
from rq.worker import Worker

import settings as s

connection_pool = []
redis_connection_pool = []


class HyriseWorker(Worker):
    """A worker establishing a connection before accepting tasks."""

    def work(self, *args, **kwargs):
        """Establish a connection before accepting tasks."""
        connection = psycopg2.connect(
            dbname=s.DATABASE_NAME,
            user=s.DATABASE_USER,
            password=s.DATABASE_PASSWORD,
            host=s.DATABASE_HOST,
            port=s.DATABASE_PORT,
        )
        connection.set_session(autocommit=True)
        connection_pool.append(connection)
        r = redis.Redis()
        redis_connection_pool.append(r)
        # print(f"Connection poll filled: {id(connection_pool)}")
        return super().work(*args, **kwargs)
