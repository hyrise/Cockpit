"""Tests for the response module."""
from pytest import mark

from hyrisecockpit.response import _responses, get_response

minimal_responses = [200, 400, 500]


class TestGetResponse:
    """Tests for the get_response function."""

    @mark.parametrize("code", {*_responses.keys(), *minimal_responses})
    def test_has_defined_structure(self, code: int):
        """A response has a defined structure."""
        response = get_response(code)
        assert list(response.keys()) == ["header", "body"]
        assert list(response["header"].keys()) == ["status", "message"]
        assert list(response["body"].keys()) == []

    @mark.parametrize("code", {*_responses.keys(), *minimal_responses})
    def test_returns_unique_objects(self, code: int):
        """A response returns different objects when called with the same arguments."""
        response_1 = get_response(code)
        response_1["body"] = {"Test": "test"}
        response_2 = get_response(code)
        assert response_2["body"] == {}

    @mark.parametrize("code", {*_responses.keys(), *minimal_responses})
    def test_has_correct_status(self, code: int):
        """A response has a status code matching the one requested (if defined)."""
        response = get_response(code)
        assert response["header"]["status"] == code

    def test_returns_default_500(self):
        """A response defaults to status code 500 when the code is not defined."""
        response = get_response(None)
        assert response["header"]["status"] == 500
