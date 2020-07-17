"""Server module handling zmq requests.

Used by Database Manager and Workload Generator.
"""

from typing import Callable, Dict, Optional, Tuple

from jsonschema import ValidationError, validate
from zmq import REP, Context

from hyrisecockpit.message import request_schema
from hyrisecockpit.request import Body, Request
from hyrisecockpit.response import Response, get_response


class Server:
    """Server component handling zmq requests."""

    def __init__(
        self,
        host: str,
        port: str,
        calls: Dict[str, Tuple[Callable[[Body], Response], Optional[Dict]]],
        io_threads: int = 1,
    ) -> None:
        """Initialize a Server with a host, port and calls."""
        self._calls = calls
        self._host = host
        self._port = port
        self._init_server(io_threads)

    def _init_server(self, io_threads: int) -> None:
        self._context = Context(io_threads=io_threads)
        self._socket = self._context.socket(REP)
        self._socket.bind("tcp://{:s}:{:s}".format(self._host, self._port))

    def start(self) -> None:
        """Start the server loop."""
        while True:
            request: Request = self._socket.recv_json()
            response: Response = self._handle_request(request)
            self._socket.send_json(response)

    def _handle_request(self, request: Request) -> Response:
        try:
            validate(instance=request, schema=request_schema)
            func, schema = self._calls[request["header"]["message"]]
            if schema:
                validate(request["body"], schema=schema)
            return func(request["body"])
        except ValidationError as e:
            # TODO BAD error handling. Can catch ValidationError in generator
            print(f"ValidationError catched in server: {str(e)}")
            return get_response(400)
        except KeyError as e:
            # TODO BAD error handling. Can catch key Errors in generator
            print(f"KeyError catched in server: {str(e)}")
            return get_response(404)

    def close(self) -> None:
        """Close the socket and terminate it."""
        self._socket.close()
        self._context.term()
