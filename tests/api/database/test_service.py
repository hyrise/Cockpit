"""Tests for the database service."""
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.api.app.database.service import DatabaseService

mocked_socket = MagicMock()


def get_mocked_socket_manager(*args):
    """Return fake storage cursor."""
    mocked_socket_manager_constructor: MagicMock = MagicMock()
    mocked_socket_manager_constructor.__enter__.return_value: MagicMock = mocked_socket
    return mocked_socket_manager_constructor


@fixture
def database_service():
    """Return zeromq patched database service."""
    return DatabaseService()


class TestDatabaseService:
    """Tests for the database service."""

    @patch("hyrisecockpit.api.app.database.service.validate")
    @patch(
        "hyrisecockpit.api.app.database.service.ManagerSocket",
        get_mocked_socket_manager,
    )
    def test_sends_request(
        self, mocked_validate: MagicMock, database_service: DatabaseService
    ) -> None:
        """Test sending of message."""
        fake_message = "do something"
        global mocked_socket
        mocked_socket.send_message.return_value = {"some": "response"}

        response = database_service._send_message(fake_message)  # type: ignore

        mocked_socket.send_message.assert_called_once_with(fake_message)
        mocked_validate.assert_called_once()

        assert response == {"some": "response"}  # type: ignore

        mocked_socket = MagicMock()
