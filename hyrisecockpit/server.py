"""Server module handling zmq requests.

Used by Database Manager and Workload Generator.
"""

from typing import Any, Callable, Dict, Optional, Tuple

from jsonschema import ValidationError, validate
from zmq import REP, Context

from hyrisecockpit.message import request_schema
from hyrisecockpit.response import get_response


class Server:
    """Server component handling zmq requests."""

    def __init__(
        self,
        host: str,
        port: str,
        calls: Dict[
            str, Tuple[Callable[[Dict[str, Any]], Dict[str, Any]], Optional[Dict]]
        ],
        io_threads: int = 1,
    ):
        """Initialize a Server with a host, port and calls."""
        self._calls = calls
        self._host = host
        self._port = port
        self._context = Context(io_threads=io_threads)
        self._socket = self._context.socket(REP)
        self._socket.bind("tcp://{:s}:{:s}".format(self._host, self._port))

    def start(self):
        """Start the server loop."""
        while True:
            # Get the message
            request = self._socket.recv_json()

            # Validate the message
            try:
                validate(instance=request, schema=request_schema)
                # Look for the call
                func, schema = self._calls[request["header"]["message"]]
                # Handle the call
                if schema:
                    validate(request["body"], schema=schema)
                response = func(request["body"])
                self._socket.send_json(response)
            except ValidationError:
                self._socket.send_json(get_response(400))
            except KeyError:
                self._socket.send_json(get_response(404))

    def close(self):
        """Close the socket and terminate it."""
        self._socket.close()
        self._context.term()
