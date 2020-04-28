"""This model adjust libraries to work for mac osx."""
from sys import platform

if platform.startswith("linux"):  # noqa
    from multiprocessing import Queue

elif platform.startswith("darwin"):
    from multiprocessing import Value
    from multiprocessing import Queue as DefaultQueue

    class SharedCounter:
        """A synchronized shared counter."""

        def __init__(self, n=0):
            """Initialize for SharedCounter."""
            self.count = Value("d", n)

        def increment(self, n=1):
            """Increment the counter by n (default = 1)."""
            with self.count.get_lock():
                self.count.value += n

        @property
        def value(self):
            """Return the value of the counter."""
            return self.count.value

    class Queue:  # type: ignore
        """A portable implementation of multiprocessing.Queue."""

        def __init__(self, *args, **kwargs):
            """Initialize for Queue."""
            self.queue = DefaultQueue()
            self.size = SharedCounter(0)

        def put(self, *args, **kwargs):
            """Put element on Queue."""
            self.queue.put(*args, **kwargs)
            self.size.increment(1)

        def get(self, *args, **kwargs):
            """Get element from Queue."""
            element = self.queue.get(*args, **kwargs)
            self.size.increment(-1)
            return element

        def qsize(self):
            """Reliable implementation of multiprocessing qsize."""
            return round(self.size.value)

        def empty(self):
            """Reliable implementation of multiprocessing empty."""
            return not self.qsize()

        def close(self):
            """Clsoe queue."""
            self.queue.close()
