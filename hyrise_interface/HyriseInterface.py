"""Module for managing Hyrise databases.

Includes the HyriseInterface, which uses an InstanceManager and a LoadGenerator.
These are responsible for submitting the requested jobs to a Queue.
"""

import json
import time

import zmq
from apscheduler.schedulers.background import BackgroundScheduler
from redis import Redis
from rq import Queue

import settings as s
from InstanceManager import InstanceManager
from LoadGenerator import LoadGenerator


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
        self.redis = Redis()
        self.init_redis()
        self.databases = dict()
        # Add some instances as a demo
        self.add_hyrise_instance(
            "Hyrise 1",
            s.HYRISE1_HOST,
            s.HYRISE1_PORT,
            s.HYRISE1_USER,
            s.HYRISE1_PASSWORD,
            s.HYRISE1_NAME,
        )
        self.add_hyrise_instance(
            "Hyrise 2",
            s.HYRISE2_HOST,
            s.HYRISE2_PORT,
            s.HYRISE2_USER,
            s.HYRISE2_PASSWORD,
            s.HYRISE2_NAME,
        )

    def init_redis(self):
        """Set basic values in redis db."""
        self.redis.set("throughput", 0)
        self.redis.set("throughput_counter", 0)
        self.redis.set("start_time_intervall", time.time())

    def update_throughput(self):
        """Update throughput."""
        self.throughput_counter = self.redis.get("throughput_counter").decode("utf-8")
        print(self.throughput_counter)
        self.redis.set("throughput_counter", 0)

    def start(self):
        """Start with default values."""
        context = zmq.Context()
        socket = context.socket(zmq.REP)
        socket.bind(f"tcp://{s.HYRISE_INTERFACE_HOST}:{s.HYRISE_INTERFACE_PORT}")
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
                response = "[NOT IMPLEMENTED YETWorkload]"
                pass
            else:
                response = "[Error]"

            socket.send_string(response)

    def add_hyrise_instance(self, id, host, port, user, password, name=""):
        """Add hyrise instance."""
        if id not in self.databases.keys():
            self.databases[id] = {
                "name": name,
                "host": host,
                "port": port,
                "user": user,
                "password": password,
                "queue": Queue(name=id, connection=self.redis),
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
            db_info = dict()  # TODO refactor
            for key in self.databases[id].keys():
                if key in ("name", "host", "port", "password", "user"):
                    db_info[key] = self.databases[id][key]
            func(queue, db_info, *args, **kwargs)

    def execute(self, query):
        """Execute a SQL query."""
        self.multiplex(self.loadGenerator.execute, query)

    def executemany(self, workload):
        """Execute a list of SQL queries forming a workload."""
        self.multiplex(self.loadGenerator.executemany, workload)


def main():
    """Run a HyriseInterface."""
    HyriseInterface().start()


if __name__ == "__main__":
    main()
