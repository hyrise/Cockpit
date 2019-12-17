"""Predefined responses for IPC."""

__default = {"header": {"status": 500, "message": "INTERNAL SERVER ERROR"}, "body": {}}

__responses = {
    200: {"header": {"status": 200, "message": "OK"}, "body": {}},
    400: {"header": {"status": 400, "message": "BAD REQUEST"}, "body": {}},
    500: __default,
}


def get_response(code):
    """Get a predefined response with a code."""
    return __responses.get(code, __default,)
