"""Predefined responses for IPC."""

from copy import deepcopy
from typing import Any, Dict

__default = {"header": {"status": 500, "message": "INTERNAL SERVER ERROR"}, "body": {}}

__responses = {
    200: {"header": {"status": 200, "message": "OK"}, "body": {}},
    400: {"header": {"status": 400, "message": "BAD REQUEST"}, "body": {}},
    500: __default,
}


def get_response(code: int,) -> Dict[str, Any]:
    """Get a predefined response with a code."""
    return deepcopy(__responses.get(code, __default,))


def get_error_response(code: int, message: str) -> Dict[str, Any]:
    """Get a predefined response with a code and error message."""
    response: Dict = deepcopy(__responses.get(code, __default,))
    response["body"]["error"] = message
    return response
