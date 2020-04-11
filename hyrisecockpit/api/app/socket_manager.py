"""Socket connection for function and entities."""

from types import TracebackType
from typing import Optional, Type

from zmq import REQ, Context, Socket

from hyrisecockpit.request import Request
from hyrisecockpit.response import Response
from hyrisecockpit.settings import (
    DB_MANAGER_HOST,
    DB_MANAGER_PORT,
    GENERATOR_HOST,
    GENERATOR_PORT,
)


class BaseSocket:
    """Base Socket that interacts directly with zmq."""

    def __init__(self, url):
        """Initialize a BaseSocket."""
        self._url: str = url

    def open(self) -> None:
        """Open socket connection."""
        context: Context = Context(io_threads=1)
        socket: Socket = context.socket(REQ)
        socket.connect(self._url)
        self._socket: Socket = socket

    def close(self) -> None:
        """Close socket connection."""
        self._socket.disconnect(self._url)
        self._socket.close()

    def send_req(self, message: Request) -> Response:
        """Send message to socket."""
        self._socket.send_json(message)
        response: Response = self._socket.recv_json()
        return response


class GeneratorSocket:
    """GeneratorSocket that sands request to the generator."""

    def __init__(self):
        """Initialize a GeneratorSocket."""
        self._socket: BaseSocket = BaseSocket(
            f"tcp://{GENERATOR_HOST}:{GENERATOR_PORT}"
        )
        self._socket.open()

    def __enter__(self) -> "GeneratorSocket":
        """Return self for a context manager."""
        return self

    def __exit__(
        self,
        exc_type: Optional[Type[BaseException]],
        exc_value: Optional[BaseException],
        traceback: Optional[TracebackType],
    ) -> Optional[bool]:
        """Call close with a context manager."""
        self._socket.close()
        return None

    def send_message(self, message: Request) -> Response:
        """Send message to generator."""
        return self._socket.send_req(message)


class ManagerSocket:
    """ManagerSocket that sands request to the Manager."""

    def __init__(self):
        """Initialize a ManagerSocket."""
        self._socket: BaseSocket = BaseSocket(
            f"tcp://{DB_MANAGER_HOST}:{DB_MANAGER_PORT}"
        )
        self._socket.open()

    def __enter__(self) -> "ManagerSocket":
        """Return self for a context manager."""
        return self

    def __exit__(
        self,
        exc_type: Optional[Type[BaseException]],
        exc_value: Optional[BaseException],
        traceback: Optional[TracebackType],
    ) -> Optional[bool]:
        """Call close with a context manager."""
        self._socket.close()
        return None

    def send_message(self, message: Request) -> Response:
        """Send message to manager."""
        return self._socket.send_req(message)
