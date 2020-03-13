"""Predefined responses for IPC."""

from typing import Dict, TypedDict


class Header(TypedDict):
    """Header Type."""

    status: int
    message: str


class ResponseBase(TypedDict):
    """Minimal Response Type."""

    header: Header


class Response(ResponseBase, total=False):
    """Response Type."""

    body: Dict


_responses: Dict[int, str] = {
    200: "OK",
    400: "BAD REQUEST",
    404: "NOT FOUND",
    423: "LOCKED",
    500: "INTERNAL SERVER ERROR",
    501: "NOT IMPLEMENTED",
}


def get_response(code: int,) -> Response:
    """Get a predefined response with a code."""
    code = code if code in _responses else 500
    message = _responses[code]
    return {"header": {"status": code, "message": message}, "body": {}}


def get_error_response(code: int, message: str) -> Response:
    """Get a predefined response with a code and error message."""
    response: Response = get_response(code)
    response["body"]["error"] = message
    return response
