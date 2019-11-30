"""Module for the HyriseInterface component InstanceManager.

InstanceManager submits jobs to a Queue.
"""
from redis import Redis
from rq import Queue


class InstanceManager(object):
    """A QueueUser submitting jobs concerning everything but load generation."""

    def __init__(self):
        """Initialize a QueueUser with a Redis Queue."""
        self.queue = Queue(connection=Redis())
