"""Functions defining task worker."""
from multiprocessing import Queue, Value
from multiprocessing.synchronize import Event as EventType
from queue import Empty
from time import time_ns
from typing import Dict, List, Tuple, Union

from psycopg2 import DatabaseError, InterfaceError, ProgrammingError

from hyrisecockpit.database_manager.cursor import PoolCursor, StorageCursor
from hyrisecockpit.settings import (
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)

from .handler.default_handler import DefaultHandler
from .handler.tpcc_transaction_handler import TPCCTransactionHandler


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
            succesful_queries: List[Tuple[int, int, str, str, str]] = []
            failed_queries: List[Tuple[int, str, str, str]] = []
            last_batched = time_ns()

            handlers: Dict[str, Union[DefaultHandler, TPCCTransactionHandler]] = {
                "query": DefaultHandler(cur, worker_id),
                "tpcc_transaction": TPCCTransactionHandler(cur, worker_id),
            }

            while True:
                if not continue_execution_flag.value:
                    i_am_done_event.set()
                    worker_wait_for_exit_event.wait()

                try:
                    task = task_queue.get(block=False)
                    handler = handlers[task["type"]]
                    endts, latency, benchmark, query_type = handler.execute_task(task)

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
