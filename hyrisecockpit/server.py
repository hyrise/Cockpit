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
        self._init_server(io_threads)

    def _init_server(self, io_threads):
        self._context = Context(io_threads=io_threads)
        self._socket = self._context.socket(REP)
        self._socket.bind("tcp://{:s}:{:s}".format(self._host, self._port))

    def start(self):
        """Start the server loop."""
        while True:
            request = self._socket.recv_json()
            response = self._handle_request(request)
            self._socket.send_json(response)

    def _handle_request(self, request):
        try:
            validate(instance=request, schema=request_schema)
            func, schema = self._calls[request["header"]["message"]]
            if schema:
                validate(request["body"], schema=schema)
            return func(request["body"])
        except ValidationError:
            return get_response(400)
        except KeyError:
            return get_response(404)

    def close(self):
        """Close the socket and terminate it."""
        self._socket.close()
        self._context.term()
