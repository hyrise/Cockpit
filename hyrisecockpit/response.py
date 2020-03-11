"""Predefined responses for IPC."""

from typing import Dict

_responses: Dict[int, str] = {
    200: "OK",
    400: "BAD REQUEST",
    404: "NOT FOUND",
    423: "LOCKED",
    500: "INTERNAL SERVER ERROR",
    501: "NOT IMPLEMENTED",
}


def get_response(code: int,) -> Dict[str, Dict]:
    """Get a predefined response with a code."""
    code = code if code in _responses else 500
    message = _responses[code]
    return {"header": {"status": code, "message": message}, "body": {}}


def get_error_response(code: int, message: str) -> Dict[str, Dict]:
    """Get a predefined response with a code and error message."""
    response: Dict = get_response(code)
    response["body"]["error"] = message
    return response
