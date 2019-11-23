import time

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


class LoadWorker(Worker):
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


def execute_raw_query_task(query):
    conn = get_connection()
    cur = conn.cursor()
    start = time.time()
    cur.execute(query)
    return time.time() - start


def execute_raw_workload_task(workload):
    pass
    # for query in workload:
    #     cur.execute(query)
    # TODO measure throughput
