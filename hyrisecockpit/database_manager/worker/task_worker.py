"""Functions defining task worker."""
from multiprocessing import Queue, Value
from multiprocessing.synchronize import Event as EventType
from queue import Empty
from time import time_ns
from typing import List, Tuple

from psycopg2 import DatabaseError, InterfaceError, ProgrammingError

from hyrisecockpit.database_manager.cursor import PoolCursor, StorageCursor
from hyrisecockpit.settings import (
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)

from .query_handler import QueryHandler
from .transaction_handler import TransactionHandler


def log_results(
    log: StorageCursor,
    succesful_queries: List[Tuple[int, int, str, str, str]],
    failed_queries: List[Tuple[int, str, str, str]],
) -> None:
    """Log results to database."""
    log.log_queries(succesful_queries)
    succesful_queries.clear()
    log.log_failed_queries(failed_queries)
    failed_queries.clear()


def execute_queries(  # noqa
    worker_id: str,
    task_queue: Queue,
    cur: PoolCursor,
    continue_execution_flag: Value,
    database_id: str,
    i_am_done_event: EventType,
    worker_wait_for_exit_event: EventType,
) -> None:
    """Define workers work loop."""
    with cur:
        with StorageCursor(
            STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD, database_id
        ) as log:
            query_handler = QueryHandler(cur, worker_id)
            transaction_handler = TransactionHandler(cur, worker_id)
            succesful_queries: List[Tuple[int, int, str, str, str]] = []
            failed_queries: List[Tuple[int, str, str, str]] = []
            last_batched = time_ns()

            while True:
                if not continue_execution_flag.value:
                    i_am_done_event.set()
                    worker_wait_for_exit_event.wait()

                try:
                    task = task_queue.get(block=False)
                    if task["type"] == "query":
                        endts, latency = query_handler.execute_task(task)
                    elif task["type"] == "transaction":
                        endts, latency = transaction_handler.execute_task(task)
                    else:
                        continue  # Error: unsupported task type
                    benchmark = task["benchmark"]
                    query_type = task["query_type"]

                    succesful_queries.append(
                        (endts, latency, benchmark, query_type, worker_id)
                    )
                except Empty:
                    continue
                except (DatabaseError, InterfaceError):
                    task_queue.put(task)
                except (ValueError, ProgrammingError) as e:
                    failed_queries.append((time_ns(), worker_id, str(task), str(e)))

                if last_batched < time_ns() - 1_000_000_000:
                    log_results(log, succesful_queries, failed_queries)
                    last_batched = time_ns()
