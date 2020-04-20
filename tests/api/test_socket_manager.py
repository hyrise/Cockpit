"""Tests socket manager."""
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.api.app.socket_manager import (
    BaseSocket,
    GeneratorSocket,
    ManagerSocket,
)

mocked_socket_context: MagicMock = MagicMock()
mocked_context: MagicMock = MagicMock()
mocked_socket: MagicMock = MagicMock()
mocked_context.socket.return_value = mocked_socket
mocked_socket_context.return_value = mocked_context


def reset_socket_context() -> None:
    """Reset mocked socket context."""
    global mocked_socket_context
    global mocked_context
    global mocked_socket
    mocked_socket_context = MagicMock()
    mocked_context = MagicMock()
    mocked_socket = MagicMock()
    mocked_context.socket.return_value = mocked_socket
    mocked_socket_context.return_value = mocked_context


@fixture
def base_socket():
    """Return a base socket."""
    return BaseSocket("some_url")


@fixture
@patch("hyrisecockpit.api.app.socket_manager.BaseSocket", MagicMock())
def generator_socket():
    """Return a generator socket."""
    return GeneratorSocket()


@fixture
@patch("hyrisecockpit.api.app.socket_manager.BaseSocket", MagicMock())
def manager_socket():
    """Return a manager socket."""
    return ManagerSocket()


class TestSocketManager:
    """Tests for socket manager."""

    def test_initializes_base_socket_correctly(self, base_socket: BaseSocket) -> None:
        """Test that base socket initializes correctly."""
        assert base_socket._url == "some_url"

    @patch("hyrisecockpit.api.app.socket_manager.Context", mocked_socket_context)
    @patch("hyrisecockpit.api.app.socket_manager.REQ", "fake_req")
    def test_base_socket_opens_socket_connection(self, base_socket: BaseSocket) -> None:
        """Test that base socket connection is created correctly."""
        global mocked_socket_context
        global mocked_context
        global mocked_socket

        base_socket.open()

        mocked_socket_context.assert_called_once_with(io_threads=1)
        mocked_context.socket.assert_called_once_with("fake_req")
        mocked_socket.connect.assert_called_once_with("some_url")

        assert base_socket._socket == mocked_socket

        reset_socket_context()

    def test_base_socket_closes_socket_connection(
        self, base_socket: BaseSocket
    ) -> None:
        """Test that base socket connection is closed correctly."""
        mocked_socket: MagicMock = MagicMock()
        base_socket._url = "Hi"
        base_socket._socket = mocked_socket

        base_socket.close()

        mocked_socket.disconnect.assert_called_once_with("Hi")
        mocked_socket.close.assert_called_once_with()

    def test_base_socket_sends_request(self, base_socket: BaseSocket) -> None:
        """Test sending of request."""
        mocked_socket: MagicMock = MagicMock()
        mocked_socket.recv_json.return_value = "Hi"
        base_socket._socket = mocked_socket

        responce = base_socket.send_req("What's up")  # type: ignore

        mocked_socket.send_json.assert_called_once_with("What's up")
        assert responce == "Hi"  # type: ignore

    @patch("hyrisecockpit.api.app.socket_manager.BaseSocket")
    @patch("hyrisecockpit.api.app.socket_manager.GENERATOR_HOST", "hallo")
    @patch("hyrisecockpit.api.app.socket_manager.GENERATOR_PORT", "world")
    def test_initializes_generator_socket_correctly(
        self, mocked_base_socket: MagicMock
    ) -> None:
        """Test that generator socket initializes correctly."""
        mocked_socket: MagicMock = MagicMock()
        mocked_base_socket.return_value = mocked_socket

        generator_socket = GeneratorSocket()  # type: ignore

        mocked_base_socket.assert_called_once_with(f"tcp://hallo:world")
        assert generator_socket._socket == mocked_socket
        mocked_socket.open.assert_called_once()

    def test_generator_socket_sends_message(
        self, generator_socket: GeneratorSocket
    ) -> None:
        """Test generator socket send message."""
        mocked_base_socket: MagicMock = MagicMock()
        generator_socket._socket = mocked_base_socket

        generator_socket.send_message("hi")  # type: ignore

        mocked_base_socket.send_req.assert_called_once_with("hi")

    @patch("hyrisecockpit.api.app.socket_manager.BaseSocket")
    @patch("hyrisecockpit.api.app.socket_manager.DB_MANAGER_HOST", "hallo")
    @patch("hyrisecockpit.api.app.socket_manager.DB_MANAGER_PORT", "manager")
    def test_initializes_manager_socket_correctly(
        self, mocked_base_socket: MagicMock
    ) -> None:
        """Test that manager socket initializes correctly."""
        mocked_socket: MagicMock = MagicMock()
        mocked_base_socket.return_value = mocked_socket

        manager_socket = ManagerSocket()  # type: ignore

        mocked_base_socket.assert_called_once_with(f"tcp://hallo:manager")
        assert manager_socket._socket == mocked_socket
        mocked_socket.open.assert_called_once()

    def test_manager_socket_sends_message(self, manager_socket: ManagerSocket) -> None:
        """Test manager socket send message."""
        mocked_base_socket: MagicMock = MagicMock()
        manager_socket._socket = mocked_base_socket

        manager_socket.send_message("hi")  # type: ignore

        mocked_base_socket.send_req.assert_called_once_with("hi")
