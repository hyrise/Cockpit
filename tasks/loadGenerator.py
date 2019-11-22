import time

import psycopg2
from rq.worker import Worker

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


def getConnection():
    return connection_pool[0]


def executeRawQueryTask(query):
    conn = getConnection()
    cur = conn.cursor()
    start = time.time()
    cur.execute(query)
    return time.time() - start


def executeRawWorkloadTask(workload):
    for query in workload:
        pass
        # cur.execute(query)

    # TODO measure throughput
    return 1
