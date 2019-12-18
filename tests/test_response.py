"""Tests for the response module."""
from pytest import mark

from hyrisecockpit.response import get_response


class TestGetResponse:
    """Tests for the get_response function."""

    def test_returns_entirely_new_objects(self):
        """A response returns different objects when called with the same arguments."""
        response_1 = get_response(200)
        response_1["body"] = "Test"
        response_2 = get_response(200)
        assert response_2["body"] == {}

    @mark.parametrize("code", [200, 400, 500])
    def test_has_status_code(self, code):
        """A response has a status code."""
        response = get_response(code)
        assert response["header"]["status"] == code

    def test_returns_default_500(self):
        """A response defaults to status code 500."""
        response = get_response(None)
        assert response["header"]["status"] == 500
