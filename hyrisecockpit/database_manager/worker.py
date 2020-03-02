"""Functions defining workers.

Workers run in pools and are started by other components.
"""
from multiprocessing import Queue, Value
from time import time_ns

from psycopg2 import Error, pool
from psycopg2.extensions import AsIs
from zmq import SUB, SUBSCRIBE, Context

from hyrisecockpit.settings import (
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)

from .cursor import PoolCursor, StorageCursor


def fill_queue(
    workload_publisher_url: str, task_queue: Queue, processing_tables_flag: Value
) -> None:
    """Fill the queue."""
    context = Context()
    subscriber = context.socket(SUB)
    subscriber.connect(workload_publisher_url)
    subscriber.setsockopt_string(SUBSCRIBE, "")
    while True:
        content = subscriber.recv_json()
        tasks = content["body"]["querylist"]
        if not processing_tables_flag.value:
            for task in tasks:
                task_queue.put(task)


def execute_queries(
    worker_id: str,
    task_queue: Queue,
    connection_pool: pool,
    failed_task_queue: Queue,
    worker_stay_alive_flag: Value,
    database_id: str,
) -> None:
    """Define workers work loop."""
    # Allow exit without flush
    task_queue.cancel_join_thread()
    failed_task_queue.cancel_join_thread()

    with PoolCursor(connection_pool) as cur:
        with StorageCursor(
            STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD, database_id
        ) as log:
            succesful_queries = []
            last_batched = time_ns()
            while True:
                # If Queue is emty go to wait status
                try:
                    task = task_queue.get(block=True)
                    if not worker_stay_alive_flag.value:
                        if task == "wake_up_signal_for_worker":
                            task_queue.put("wake_up_signal_for_worker")
                        break
                    else:
                        query_tuple, workload_type, query_type = task
                        query, not_formatted_parameters = query_tuple
                        formatted_parameters = (
                            tuple(
                                AsIs(parameter) if protocol == "as_is" else parameter
                                for parameter, protocol in not_formatted_parameters
                            )
                            if not_formatted_parameters is not None
                            else None
                        )
                        startts = time_ns()
                        cur.execute(query, formatted_parameters)
                        endts = time_ns()
                        succesful_queries.append(
                            (endts, endts - startts, workload_type, query_type)
                        )
                        if last_batched < time_ns() - 1_000_000_000:
                            last_batched = time_ns()
                            log.log_queries(succesful_queries)
                            succesful_queries = []
                except (ValueError, Error) as e:
                    failed_task_queue.put(
                        {"worker_id": worker_id, "task": query_tuple, "Error": str(e)}
                    )
