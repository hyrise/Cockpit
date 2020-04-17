"""This model adjust libraries to work for mac osx."""
from sys import platform

if platform.startswith("linux"):  # noqa
    from multiprocessing import Process, Queue

elif platform.startswith("darwin"):
    from multiprocessing import Value
    from multiprocessing import Process as DefaultProcess
    from multiprocessing import Queue as DefaultQueue
    from psycopg2 import DatabaseError, InterfaceError, ProgrammingError
    from psycopg2.extensions import AsIs

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

    def format_query_parameters(parameters):
        """Format Query parameters."""
        formatted_parameters = (
            tuple(
                AsIs(parameter) if protocol == "as_is" else parameter
                for parameter, protocol in parameters
            )
            if parameters is not None
            else None
        )
        return formatted_parameters

    def execute_table_query(query_tuple, success_flag, connection_factory):
        """Execute queries on database.."""
        query, parameters = query_tuple
        formatted_parameters = format_query_parameters(parameters)
        try:
            with connection_factory.create_cursor() as cur:
                cur.execute(query, formatted_parameters)
                success_flag.value = True
        except (DatabaseError, InterfaceError, ProgrammingError):
            return None  # TODO: log error

    class Process:  # type: ignore
        """Process wrapper."""

        def __init__(self, connection_factory, args):
            """Initialize LoadingTabbleProcess."""
            self.connection_factory = connection_factory
            self.args = args
            self.process = DefaultProcess(
                target=execute_table_query,
                args=(self.args[0], self.args[1], self.connection_factory),
            )

        def start(self):
            """Start process."""
            self.process.start()

        def join(self):
            """Join process."""
            self.process.join()

        def terminate(self):
            """Terminate process."""
            self.process.terminate()
