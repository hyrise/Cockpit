"""Functions defining queue worker."""

from multiprocessing import Queue, Value
from multiprocessing.synchronize import Event as EventType
from typing import Dict

from zmq import SUB, SUBSCRIBE, Context


def handle_published_data(published_data: Dict, task_queue: Queue) -> None:
    """Fill task queue."""
    tasks = published_data["body"]["querylist"]
    for task in tasks:
        task_queue.put(task)


def fill_queue(
    workload_publisher_url: str,
    task_queue: Queue,
    continue_execution_flag: Value,
    worker_wait_for_exit_event: EventType,
) -> None:
    """Fill the queue."""
    context = Context()
    sub_socket = context.socket(SUB)
    sub_socket.connect(workload_publisher_url)
    sub_socket.setsockopt_string(SUBSCRIBE, "")

    while True:
        published_data: Dict = sub_socket.recv_json()
        if not continue_execution_flag.value:
            worker_wait_for_exit_event.wait()
        else:
            handle_published_data(published_data, task_queue)
