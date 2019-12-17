"""Tests for the response module."""
from hyrisecockpit.response import get_response


class TestGetResponse:
    """Tests for the get_response function."""

    def test_returns_entirely_new_objects(self):
        """A WorkloadGenerator initializes."""
        response_1 = get_response(200)
        response_1["body"] = "Test"
        response_2 = get_response(200)
        assert response_2["body"] == {}
