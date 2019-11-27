"""Module for managing Hyrise databases.

Includes the HyriseInterface, which uses an InstanceManager and a LoadGenerator.
These are responsible for submitting the requested jobs to a Queue.
"""

import time
from json import loads

import redis
import zmq
from redis import Redis
from rq import Queue

import settings as s
from apscheduler.schedulers.background import BackgroundScheduler
from tasks import (
    execute_raw_query_task,
    execute_raw_workload_task,
    get_storage_data_task,
)


class HyriseInterface(object):
    """An interface for concrete Hyrise databases."""

    def __init__(self):
        """Initialize a HyriseInterface with an InstanceManager and a LoadGenerator."""
        self.instanceManager = InstanceManager()
        self.loadGenerator = LoadGenerator()
        self.scheduler = BackgroundScheduler()
        self.scheduler.add_job(
            func=self.update_throughput, trigger="interval", seconds=1,
        )
        self.scheduler.start()
        self.throughput_counter = "0"
        self.r = redis.Redis()
        self.init_redis()
        self.instanceManager.get_storage_data()

    def init_redis(self):
        """Set basic values in redis db."""
        self.r.set("throughput", 0)
        self.r.set("throughput_counter", 0)
        self.r.set("start_time_intervall", time.time())

    def update_throughput(self):
        """Update throughput."""
        self.throughput_counter = self.r.get("throughput_counter").decode("utf-8")
        print(self.throughput_counter)
        self.r.set("throughput_counter", 0)

    def start(self):
        """Start with default values."""
        context = zmq.Context()
        socket = context.socket(zmq.REP)
        socket.bind(f"tcp://*:{s.HI_PORT}")
        print("Hyrise Interface running. Press Ctrl+C to stop.")

        while True:
            message = socket.recv()
            data = loads(message)
            response = ""
            if data["Content-Type"] == "query":
                self.execute_raw_query(data["Content"])
                response = "OK"
            elif data["Content-Type"] == "workload":
                self.execute_raw_workload(data["Content"])
                response = "OK"
            elif data["Content-Type"] == "storage_data":
                response = self.r.get("storage_data").decode("utf-8")
            elif data["Content-Type"] == "throughput":
                response = self.throughput_counter
            elif data["Content-Type"] == "runtime_information":
                response = "[NOT IMPLEMENTED YET]"
                pass
            else:
                response = "[Error]"

            socket.send_string(response)

    def get_storage_data(self):
        """Get storage data from InstanceManager."""
        return self.instanceManager.get_storage_data()

    def execute_raw_query(self, query):
        """Execute a SQL query."""
        return self.loadGenerator.execute_raw_query(query)

    def execute_raw_workload(self, workload):
        """Execute a list of SQL queries forming a workload."""
        return self.loadGenerator.execute_raw_workload(workload)


class InstanceManager:
    """A QueueUser submitting jobs concerning everything but load generation."""

    def __init__(self):
        """Initialize a QueueUser with a Redis Queue."""
        self.queue = Queue(connection=Redis())

    def get_storage_data(self):
        """Submit a job to get storage data from database."""
        job = self.queue.enqueue(get_storage_data_task)
        return self.busy_wait(job)


class LoadGenerator:
    """A QueueUser submitting jobs concerning artificial load generation."""

    def __init__(self):
        """Initialize a QueueUser with a Redis Queue."""
        self.queue = Queue(connection=Redis())

    def execute_raw_query(self, query):
        """Submit a job to execute a SQL query."""
        return self.queue.enqueue(execute_raw_query_task, query)
        # return self.busy_wait(job)

    def execute_raw_workload(self, workload):
        """Submit a job to execute a list of SQL queries forming a workload."""
        return self.queue.enqueue(execute_raw_workload_task, workload)
        # return self.busy_wait(job)


def main():
    """Run a HyriseInterface."""
    HyriseInterface().start()


if __name__ == "__main__":
    main()
