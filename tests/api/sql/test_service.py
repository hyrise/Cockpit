"""Tests for the sql service."""

from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.api.app.sql.interface import SqlQueryInterface
from hyrisecockpit.api.app.sql.model import SqlResponse
from hyrisecockpit.api.app.sql.schema import SqlResponseSchema
from hyrisecockpit.api.app.sql.service import SqlService

mocked_socket = MagicMock()


def get_mocked_socket_manager(*args) -> MagicMock:
    """Return fake storage cursor."""
    mocked_socket_manager_constructor: MagicMock = MagicMock()
    mocked_socket_manager_constructor.__enter__.return_value = mocked_socket
    return mocked_socket_manager_constructor


@fixture
def sql_service() -> SqlService:
    """Return zeromq patched sql service."""
    return SqlService()


class TestSqlService:
    """Tests for the sql service."""

    @patch("hyrisecockpit.api.app.sql.service.validate")
    @patch(
        "hyrisecockpit.api.app.sql.service.ManagerSocket", get_mocked_socket_manager,
    )
    def test_sends_message(
        self, mocked_validate: MagicMock, sql_service: SqlService
    ) -> None:
        """Test sending of message."""
        # TODO FIX alex bad tests (written by alex in case you wonder)
        fake_message = "do something"
        global mocked_socket
        mocked_socket.send_message.return_value = {"some": "response"}
        response = sql_service._send_message(fake_message)  # type: ignore
        mocked_socket.send_message.assert_called_once_with(fake_message)
        mocked_validate.assert_called_once()

        assert response == {"some": "response"}  # type: ignore
        mocked_socket = MagicMock()

    @patch("hyrisecockpit.api.app.sql.service.Header")
    @patch("hyrisecockpit.api.app.sql.service.Request")
    def test_executes_sql_successful(
        self, mock_request: MagicMock, mock_header: MagicMock
    ) -> None:
        """Test executes SQL query successfully."""
        mock_header.return_value = "header object"
        mock_request.return_value = "request object"

        mock_sql_service = SqlService
        mock_sql_service._send_message = MagicMock()  # type: ignore

        mock_results = {
            "id": "Australia",
            "successful": True,
            "results": [["vegemite", "timtam"], ["Vb", "Frosters"]],
            "col_names": ["col_name_1", "col_name_2"],
            "error_message": "",
        }
        mock_sql_service._send_message.return_value = {  # type: ignore
            "header": {"status": 200},
            "body": {"results": mock_results},
        }

        interface: SqlQueryInterface = SqlQueryInterface(
            id="database_id", query="SELECT 1;"
        )
        response = mock_sql_service.execute_sql(interface)

        mock_header.assert_called_once_with(message="execute sql query")
        mock_request.assert_called_once_with(
            header="header object", body=dict(interface)
        )
        mock_sql_service._send_message.assert_called_once_with("request object")  # type: ignore

        schema = SqlResponseSchema()

        assert isinstance(response[0], SqlResponse)
        assert response[1] == 200
        assert schema.dump(response[0]) == mock_results

    @patch("hyrisecockpit.api.app.sql.service.Header")
    @patch("hyrisecockpit.api.app.sql.service.Request")
    def test_execute_sql(self, mock_request: MagicMock, mock_header: MagicMock) -> None:
        """Test executes SQL query."""
        mock_header.return_value = "header object"
        mock_request.return_value = "request object"

        mock_sql_service = SqlService
        mock_sql_service._send_message = MagicMock()  # type: ignore

        mock_results = {
            "id": "Australia",
            "successful": False,
            "results": [],
            "col_names": [],
            "error_message": "Error",
        }
        mock_sql_service._send_message.return_value = {  # type: ignore
            "header": {"status": 400},
            "body": {"results": mock_results},
        }

        interface: SqlQueryInterface = SqlQueryInterface(
            id="database_id", query="SELECT 1"
        )
        response = mock_sql_service.execute_sql(interface)

        mock_header.assert_called_once_with(message="execute sql query")
        mock_request.assert_called_once_with(
            header="header object", body=dict(interface)
        )
        mock_sql_service._send_message.assert_called_once_with("request object")  # type: ignore

        assert response[0] is None
        assert response[1] == 400
