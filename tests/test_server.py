"""Tests for the server module."""
from unittest.mock import patch

from pytest import fixture

from hyrisecockpit.response import get_response
from hyrisecockpit.server import Server


def call_function(body: dict):
    """Execute request."""
    return get_response(200)


class TestServer:
    """Tests for Server class."""

    def idle_function(self, *argv) -> None:
        """Idle function."""
        return

    @fixture
    @patch(
        "hyrisecockpit.server.Server._init_server", idle_function,
    )
    def isolated_server(self):
        """Instance of Server without binding of sockets."""
        return Server("host", "port", {})

    def test_returns_200_on_valid_request(self, isolated_server):
        """Returns 200 for valid request."""
        isolated_server._calls = {"call": (call_function, None)}
        request = {"header": {"message": "call"}, "body": {}}

        assert get_response(200) == isolated_server._handle_request(request)

    def test_returns_200_on_valid_request_with_shema(self, isolated_server):
        """Returns 200 for valid request with valid shema."""
        specific_request_schema = {
            "type": "object",
            "required": ["data"],
            "properties": {"data": {"type": "string"}},
        }

        isolated_server._calls = {"call": (call_function, specific_request_schema)}
        request = {"header": {"message": "call"}, "body": {"data": "info"}}

        assert get_response(200) == isolated_server._handle_request(request)

    def test_returns_400_on_bad_request(self, isolated_server):
        """Returns 400 on bad request."""
        request = {
            "What's the best thing about Switzerland?": "I don't know, but the flag is a big plus."
        }

        assert get_response(400) == isolated_server._handle_request(request)

    def test_returns_400_on_valid_request_with_wrong_shema(self, isolated_server):
        """Returns 400 for valid request with wrong shema."""
        specific_request_schema = {
            "type": "object",
            "required": ["data"],
            "properties": {"data": {"type": "string"}},
        }

        isolated_server._calls = {"call": (call_function, specific_request_schema)}
        request = {"header": {"message": "call"}, "body": {"wrong_key": "info"}}

        assert get_response(400) == isolated_server._handle_request(request)

    def test_returns_404_on_call_not_found(self, isolated_server):
        """Returns 404 when call not found."""
        request = {
            "header": {
                "message": "How do you drown a hipster? Throw him in the mainstream."
            },
            "body": {},
        }
        assert get_response(404) == isolated_server._handle_request(request)
