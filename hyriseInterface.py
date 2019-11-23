import json
from time import sleep

import zmq
from redis import Redis
from rq import Queue

from tasks import (
    execute_raw_query_task,
    execute_raw_workload_task,
    get_storage_data_task,
)


class HyriseInterface(object):
    def __init__(self):
        self.instanceManager = InstanceManager()
        self.loadGenerator = LoadGenerator()

    def get_storage_data(self):
        return self.instanceManager.get_storage_data()

    def execute_raw_query(self, query):
        return self.loadGenerator.execute_raw_query(query)

    def execute_raw_workload(self, workload):
        return self.loadGenerator.execute_raw_workload(workload)


class QueueUser(object):
    def __init__(self):
        self.queue = Queue(connection=Redis())

    def busy_wait(self, job):
        # TODO use notify on finished instead
        while True:
            if job.get_status() == "finished":
                print(job.result)
                return job.result
            sleep(0.05)


class InstanceManager(QueueUser):
    def get_storage_data(self):
        job = self.queue.enqueue(get_storage_data_task)
        return self.busy_wait(job)


class LoadGenerator(QueueUser):
    def execute_raw_query(self, query):
        return self.queue.enqueue(execute_raw_query_task, query)
        # return self.busy_wait(job)

    def execute_raw_workload(self, workload):
        return self.queue.enqueue(execute_raw_workload_task, workload)
        # return self.busy_wait(job)


if __name__ == "__main__":
    context = zmq.Context()
    socket = context.socket(zmq.REP)
    socket.bind("tcp://*:5555")
    hi = HyriseInterface()

    while True:
        message = socket.recv()
        data = json.loads(message)
        response = ""
        if data["Content-Type"] == "query":
            hi.execute_raw_query(data["Content"])
            response = "OK"
        elif data["Content-Type"] == "workload":
            hi.execute_raw_workload(data["Content"])
            response = "OK"
        elif data["Content-Type"] == "storage_data":
            response = str(hi.get_storage_data())
        elif data["Content-Type"] == "throughput":
            response = "[NOT IMPLEMENTED YET]"
            pass
        elif data["Content-Type"] == "runtime_information":
            response = "[NOT IMPLEMENTED YET]"
            pass
        else:
            response = "[Error]"

        socket.send_string(response)
