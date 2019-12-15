"""The database object represents the instanz of a database."""

import secrets
from multiprocessing import Manager, Process, Queue

import pandas as pd
import pandas.io.sql as sqlio
import zmq
from apscheduler.schedulers.background import BackgroundScheduler

from driver import Driver


def fill_queue(workload_publisher_url, task_queue):
    """Fill the queue."""
    context = zmq.Context()
    subscriber = context.socket(zmq.SUB)
    subscriber.connect(workload_publisher_url)
    subscriber.setsockopt_string(zmq.SUBSCRIBE, "")

    while True:
        content = subscriber.recv_json()
        tasks = content["body"]["querylist"]
        for task in tasks:
            task_queue.put(task)


def execute_querys(worker_id, task_queue, throughput_data_container, connection_pool):
    """Define workers work loop."""
    connection = connection_pool.getconn()
    connection.set_session(autocommit=True)
    cur = connection.cursor()
    while True:
        # If Queue is emty go to wait status
        query, parameters = task_queue.get(block=True)
        cur.execute(query, parameters)
        throughput_data_container[str(worker_id)] = (
            throughput_data_container[str(worker_id)] + 1
        )


class DbObject(object):
    """Represents database."""

    def __init__(self, access_data, workload_publisher_url):
        """Initialize database object."""
        self._number_workers = int(access_data["n_threads"])
        self._number_additional_connections = 1
        self._driver = Driver(
            access_data, self._number_workers + self._number_additional_connections
        )
        self._connection_pool = self._driver.get_connection_pool()

        self._task_queue = Queue(0)
        self._manager = Manager()

        self.workload_publisher_url = workload_publisher_url
        self._throughput_counter = 0
        self._system_data = {}
        self._throughput_data_container = self._init_throughput_data_container()
        self._worker_pool = self._init_worler_pool()

        self._start_workers()

        self.scheduler = BackgroundScheduler()
        self.update_throughput_job = self.scheduler.add_job(
            func=self.update_throughput_data, trigger="interval", seconds=1,
        )
        self.update_system_data_job = self.scheduler.add_job(
            func=self.update_system_data, trigger="interval", seconds=1,
        )
        self.scheduler.start()

    def _init_throughput_data_container(self):
        """Initialize meta data container."""
        throughput_data_container = self._manager.dict()
        for i in range(self._number_workers):
            throughput_data_container[str(i)] = 0
        return throughput_data_container

    def _init_worler_pool(self):
        """Initialize a pool of workers."""
        worker_pool = []
        for i in range(self._number_workers):
            p = Process(
                target=execute_querys,
                args=[
                    i,
                    self._task_queue,
                    self._throughput_data_container,
                    self._connection_pool,
                ],
            )
            worker_pool.append(p)
        subscriber_process = Process(
            target=fill_queue, args=[self.workload_publisher_url, self._task_queue],
        )
        worker_pool.append(subscriber_process)
        return worker_pool

    def _start_workers(self):
        """Start all workers in pool."""
        for i in range(len(self._worker_pool)):
            self._worker_pool[i].start()

    def get_throughput_counter(self):
        """Return throughput."""
        return self._throughput_counter

    def get_system_data(self):
        """Return system data."""
        return self._system_data

    def get_queue_length(self):
        """Return queue length."""
        return self._task_queue.qsize()

    def update_throughput_data(self):
        """Put meta data from all workers together."""
        throughput_data = 0
        for i in range(self._number_workers):
            throughput_data = throughput_data + self._throughput_data_container[str(i)]
            self._throughput_data_container[str(i)] = 0
        self._throughput_counter = throughput_data

    def update_system_data(self):
        """Update system data for database instance."""
        # mocking system data
        cpu_data = []
        for _ in range(16):
            cpu_data.append(secrets.randbelow(1001) / 10)
        memory_data = {
            "available": 8467795968,
            "used": 2525601792,
            "cached": 4237438976,
            "percent": 32.1,
            "free": 5536755712,
            "inactive": 2687451136,
            "active": 3657117696,
            "shared": 1149366272,
            "total": 12469334016,
            "buffers": 169537536,
        }

        self._system_data = {"cpu": cpu_data, "memory": memory_data}

    def get_storage_data(self):
        """Get storage data from the database."""
        connection = self._connection_pool.getconn()
        connection.set_session(autocommit=True)
        sql = "SELECT * FROM meta_segments;"

        meta_segments = sqlio.read_sql_query(sql, connection)

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
        self._connection_pool.putconn(connection)
        return self.create_storage_data_dictionary(result)

    def create_storage_data_dictionary(self, result):
        """Sort storage data to dictionary."""
        output = {}
        grouped = result.reset_index().groupby("table")
        for column in grouped.groups:
            output[column] = {"size": 0, "number_columns": 0, "data": {}}
            for _, row in grouped.get_group(column).iterrows():
                output[column]["number_columns"] = output[column]["number_columns"] + 1
                output[column]["size"] = (
                    output[column]["size"] + row["estimated_size_in_bytes"]
                )
                output[column]["data"][row["column_name"]] = {
                    "size": row["estimated_size_in_bytes"],
                    "data_type": row["column_data_type"],
                    "encoding": row["encoding"],
                }
        return output

    def _close_pool(self):
        """Close worker pool."""
        for i in range(len(self._worker_pool)):
            self._worker_pool[i].terminate()

    def _close_connections(self):
        """Close connections."""
        self._connection_pool.closeall()

    def _close_queue(self):
        """Close queue."""
        self._task_queue.close()

    def exit(self):
        """Clean exit."""
        self._close_pool()
        self._close_connections()
        self._close_queue()
        self.update_throughput_job.remove()
        self.update_system_data_job.remove()
        self.scheduler.shutdown()
        # super().__exit__()
