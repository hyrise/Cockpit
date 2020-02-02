"""Predefined message structures for IPC."""

request_schema = {
    "type": "object",
    "required": ["header", "body"],
    "properties": {
        "header": {
            "type": "object",
            "required": ["message"],
            "properties": {"message": {"type": "string"}},
        },
        "body": {"type": "object"},
    },
}

response_schema = {
    "type": "object",
    "required": ["header", "body"],
    "properties": {
        "header": {
            "type": "object",
            "required": ["status", "message"],
            "properties": {
                "status": {"type": "integer"},
                "message": {"type": "string"},
            },
        },
        "body": {"type": "object"},
    },
}

add_database_request_schema = {
    "type": "object",
    "required": ["user", "password", "host", "port", "dbname", "number_workers"],
    "properties": {
        "user": {"type": "string"},
        "password": {"type": "string"},
        "host": {"type": "string"},
        "port": {"type": "string"},
        "dbname": {"type": "string"},
        "number_workers": {"type": "integer"},
    },
}

delete_database_request_schema = {
    "type": "object",
    "required": ["id"],
    "properties": {"id": {"type": "string"}},
}

load_data_request_schema = {
    "type": "object",
    "required": ["datatype", "sf"],
    "properties": {"datatype": {"type": "string"}, "sf": {"type": "string"}},
}

delete_data_request_schema = {
    "type": "object",
    "required": ["datatype"],
    "properties": {"datatype": {"type": "string"}},
}

start_workload_request_schema = {
    "type": "object",
    "required": ["benchmark", "scale-factor", "frequency"],
    "properties": {
        "benchmark": {"type": "string"},
        "scale-factor": {"type": "string"},
        "frequency": {"type": "integer"},
    },
}
