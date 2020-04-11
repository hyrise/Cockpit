"""Tests for the database service."""
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.api.app.database.service import DatabaseService

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
def database_service():
    """Return zeromq patched database service."""
    return DatabaseService()


class TestDatabaseService:
    """Tests for the database service."""

    @patch("hyrisecockpit.api.app.database.service.Context", mocked_socket_context)
    @patch("hyrisecockpit.api.app.database.service.REQ", "fake_req")
    @patch(
        "hyrisecockpit.api.app.database.service.url", "some_url",
    )
    def test_opens_socket_connection(self, database_service: DatabaseService) -> None:
        """Test that socket connection is created correctly."""
        global mocked_socket_context
        global mocked_context
        global mocked_socket

        response = database_service._open_socket_connection()

        mocked_socket_context.assert_called_once_with(io_threads=1)
        mocked_context.socket.assert_called_once_with("fake_req")
        mocked_socket.connect.assert_called_once_with("some_url")

        assert response == mocked_socket

        reset_socket_context()

    @patch(
        "hyrisecockpit.api.app.database.service.url", "some_url",
    )
    def test_closes_socket_connection(self, database_service: DatabaseService) -> None:
        """Test that socket connection is closed correctly."""
        mocked_socket: MagicMock = MagicMock()

        database_service._close_socket_connection(mocked_socket)

        mocked_socket.disconnect.assert_called_once_with("some_url")
        mocked_socket.close.assert_called_once_with()

    @patch(
        "hyrisecockpit.api.app.database.service.url", "some_url",
    )
    @patch("hyrisecockpit.api.app.database.service.DatabaseService",)
    def test_sends_request(
        self, mocked_database_service: MagicMock, database_service: DatabaseService
    ) -> None:
        """Test sending of request."""
        fake_message = "do something"

        mocked_socket: MagicMock = MagicMock()
        mocked_socket.recv_json.return_value = {"some": "json"}
        mocked_database_service._open_socket_connection.return_value = mocked_socket

        response = database_service._send_req(fake_message)  # type: ignore

        mocked_socket.send_json.assert_called_once_with(fake_message)
        mocked_socket.recv_json.assert_called_once()
        mocked_database_service._open_socket_connection.assert_called_once()
        mocked_database_service._close_socket_connection.assert_called_once_with(
            mocked_socket
        )

        assert response == {"some": "json"}  # type: ignore
