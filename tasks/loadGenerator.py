import time

from rq.worker import Worker

import psycopg2

DATABASE_HOST = ""
DATABASE_PORT = 0
DATABASE_NAME = "postgres"
DATABASE_USER = "serviceuser"
DATABASE_PASSWORD = "serviceuser"

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
    for query in workload:
        pass
        # cur.execute(query)

    # TODO measure throughput
    return 1
