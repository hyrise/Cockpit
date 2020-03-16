"""Functions defining workers.

Workers run in pools and are started by other components.
"""
from multiprocessing import Queue, Value
from time import time_ns
from typing import Dict, List, Optional, Tuple, Union

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
    sub_socket = context.socket(SUB)
    sub_socket.connect(workload_publisher_url)
    sub_socket.setsockopt_string(SUBSCRIBE, "")

    while True:
        published_data: Dict = sub_socket.recv_json()
        if not processing_tables_flag.value:
            handle_published_data(published_data, task_queue)


def handle_published_data(published_data: Dict, task_queue: Queue) -> None:
    """Fill task queue."""
    tasks = published_data["body"]["querylist"]
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
    failed_task_queue.cancel_join_thread()

    with PoolCursor(connection_pool) as cur:
        with StorageCursor(
            STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD, database_id
        ) as log:
            succesful_queries: List[Tuple[int, int, str, str, str]] = []
            last_batched = time_ns()
            while True:
                # If Queue is emty go to wait status
                try:
                    task = task_queue.get(block=True)
                    if not worker_stay_alive_flag.value:
                        if task == "wake_up_signal_for_worker":
                            task_queue.put("wake_up_signal_for_worker")
                        else:
                            task_queue.cancel_join_thread()
                        break
                    else:
                        (
                            query,
                            not_formatted_parameters,
                            workload_type,
                            query_type,
                        ) = task
                        formatted_parameters = (
                            get_formatted_parameters(not_formatted_parameters)
                            if not_formatted_parameters is not None
                            else None
                        )

                        endts, latency = execute_task(cur, query, formatted_parameters)
                        succesful_queries.append(
                            (endts, latency, workload_type, query_type, worker_id)
                        )

                        if last_batched < time_ns() - 1_000_000_000:
                            last_batched = time_ns()
                            log.log_queries(succesful_queries)
                            succesful_queries = []
                except (ValueError, Error) as e:
                    failed_task_queue.put(
                        {"worker_id": worker_id, "task": task, "Error": str(e)}
                    )


def execute_task(
    cursor: PoolCursor, query: str, formatted_parameters: Optional[Tuple[str, ...]]
) -> Tuple[int, int]:
    """Execute given task."""
    startts = time_ns()
    cursor.execute(query, formatted_parameters)
    endts = time_ns()

    return endts, endts - startts


def get_formatted_parameters(
    not_formatted_parameters: Tuple[Tuple[Union[str, int], Optional[str]], ...],
) -> Tuple[Union[AsIs, str], ...]:
    """Create formatted parameters."""
    return tuple(
        AsIs(parameter) if protocol == "as_is" else parameter
        for parameter, protocol in not_formatted_parameters
    )
