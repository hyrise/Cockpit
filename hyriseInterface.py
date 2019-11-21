from time import sleep

from redis import Redis
from rq import Queue

from tasks.instanceManager import getStorageDataTask
from tasks.loadGenerator import executeRawQueryTask


class hyriseInterface(object):
    def __init__(self, instanceManager, loadGenerator):
        self.instanceManager = instanceManager
        self.loadGenerator = loadGenerator

    def getStorageData(self):
        return self.instanceManager.getStorageData()

    def executeRawQuery(self, query):
        return self.loadGenerator.executeRawQuery(query)


class QueueUser(object):
    def __init__(self):
        self.queue = Queue(connection=Redis())

    def busyWait(self, job):
        # TODO use notify on finished instead
        while True:
            if job.get_status() == "finished":
                print(job.result)
                return job.result
            sleep(0.05)


class instanceManager(QueueUser):
    def getStorageData(self):
        job = self.queue.enqueue(getStorageDataTask)
        return self.busyWait(job)


class loadGenerator(QueueUser):
    def executeRawQuery(self, query):
        return self.queue.enqueue(executeRawQueryTask, query)


if __name__ == "__main__":
    im = instanceManager()
    im.getStorageData()
    lg = loadGenerator()
    lg.executeRawQuery()
