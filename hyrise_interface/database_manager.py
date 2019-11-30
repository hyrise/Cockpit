"""Module for managing databases."""

import json

import zmq
from apscheduler.schedulers.background import BackgroundScheduler
from redis import Redis
from rq import Queue
from rq.registry import FinishedJobRegistry

import settings as s
import task


class DatabaseManager(object):
    """An interface for concrete Hyrise databases."""

    def __init__(self):
        """Initialize a HyriseInterface."""
        # Add scheduler
        self.scheduler = BackgroundScheduler()
        self.scheduler.add_job(
            func=self.update_throughput, trigger="interval", seconds=1,
        )
        self.scheduler.start()

        # Initialize Redis connection
        self.redis = Redis(s.QUEUE_HOST, s.QUEUE_PORT, s.QUEUE_DB, s.QUEUE_PASSWORD)

        # Add some instances as a demo
        self.databases = dict()
        self.add_hyrise_instance(
            "Hyrise 1", s.DB1_HOST, s.DB1_PORT, s.DB1_USER, s.DB1_PASSWORD, s.DB1_NAME,
        )
        self.add_hyrise_instance(
            "Hyrise 2", s.DB2_HOST, s.DB2_PORT, s.DB2_USER, s.DB2_PASSWORD, s.DB2_NAME,
        )

    def update_throughput(self):
        """Update throughput of all databases, currently cumulative."""
        throughput = 0
        for id in self.databases.keys():
            registry = self.databases[id]["finished job registry"]
            throughput += registry.count
            # TODO cleanup the registry
        print(throughput)
        return throughput

    def start(self):
        """Start with default values."""
        context = zmq.Context()
        socket = context.socket(zmq.REP)
        print(s.DB_MANAGER_HOST, s.DB_MANAGER_PORT)
        socket.bind(f"tcp://{s.DB_MANAGER_HOST}:{s.DB_MANAGER_PORT}")
        print("Hyrise Interface running. Press Ctrl+C to stop.")

        while True:
            message = socket.recv()
            data = json.loads(message)
            response = ""
            if data["Content-Type"] == "query":
                self.execute(data["Content"])
                response = "OK"
            elif data["Content-Type"] == "workload":
                self.executemany(data["Content"])
                response = "OK"
            elif data["Content-Type"] == "storage_data":
                response = self.redis.get("storage_data").decode("utf-8")
            elif data["Content-Type"] == "throughput":
                response = json.dumps({"throughput": self.throughput_counter})
            elif data["Content-Type"] == "runtime_information":
                response = "[NOT IMPLEMENTED YET]"
                pass
            else:
                response = "[Error]"

            socket.send_string(response)

    def add_hyrise_instance(self, id, host, port, user, password, name=""):
        """Add hyrise instance."""
        if id not in self.databases.keys():
            queue = Queue(name=id, connection=self.redis)
            self.databases[id] = {
                "name": name,
                "host": host,
                "port": port,
                "user": user,
                "password": password,
                "queue": queue,
                "finished job registry": FinishedJobRegistry(
                    "Hyrise 1", queue=queue, connection=self.redis
                ),
            }
            return id
        return False

    def pop_hyrise_instance(self, id):
        """Remove hyrise instance."""
        if id in self.databases.keys():
            del self.databases[id]
            return id
        return False

    def multiplex(self, func, *args, **kwargs):
        """Execute a function with the given args for each queue."""
        for id in self.databases.keys():
            queue = self.databases[id]["queue"]
            queue.enqueue(func, *args, **kwargs)

    def execute(self, query):
        """Execute a SQL query."""
        self.multiplex(task.execute, query)

    def executemany(self, workload):
        """Execute a list of SQL queries forming a workload."""
        self.multiplex(task.executemany, workload)


def main():
    """Run a DatabaseManager."""
    DatabaseManager().start()


if __name__ == "__main__":
    main()
