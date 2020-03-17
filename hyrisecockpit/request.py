"""Predefined responses for IPC."""

from typing import Any, Dict, TypedDict

Body = Dict[str, Any]


class Header(TypedDict):
    """Header Type."""

    message: str


class Request(TypedDict):
    """Minimal Response Type."""

    header: Header
    body: Body
