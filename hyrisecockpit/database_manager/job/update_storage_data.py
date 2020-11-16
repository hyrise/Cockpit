from json import dumps
from time import time_ns

from typing import List, Tuple, Dict

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from psycopg2 import DatabaseError, InterfaceError


def _add_encoding_entry(encodings: List, new_encoding: Dict) -> None:
    encoding_exists = False
    vector_compression_type = new_encoding["compression"][0]
    for encoding in encodings:
        if encoding["name"] == new_encoding["name"]:
            encoding["amount"] += 1
            # If the encoding exists we need to check if the vector compression type
            # is in the encoding entry. A encoding entry can have multiple
            # vector compression types.
            if vector_compression_type not in encoding["compression"]:
                encoding["compression"].append(vector_compression_type)
            encoding_exists = True
            break
    if not encoding_exists:
        encodings.append(new_encoding)


def _format_results(results: List[Tuple]) -> Dict:
    formatted_results: Dict = {}

    for row in results:
        (
            table_name,
            _,
            column_name,
            column_data_type,
            encoding_type,
            vector_compression_type,
            estimated_size_in_bytes,
        ) = row
        if table_name not in formatted_results:
            formatted_results[table_name] = {"size": 0, "number_columns": 0, "data": {}}
        formatted_results[table_name]["size"] += estimated_size_in_bytes
        # The data entry inside the tables_name entries contains all information
        # for the columns.
        if column_name not in formatted_results[table_name]["data"]:
            formatted_results[table_name]["number_columns"] += 1
            # The data entry inside the column entries contains all information
            # for the column. A column can have multiple encodings. Because every
            # chunk can have a different encoding.
            formatted_results[table_name]["data"][column_name] = {
                "size": 0,
                "data_type": column_data_type,
                "encoding": [],
            }
        formatted_results[table_name]["data"][column_name][
            "size"
        ] += estimated_size_in_bytes
        new_encoding = {
            "name": encoding_type,
            "amount": 1,
            "compression": [vector_compression_type],
        }
        # We need to make sure if the encoding entry already exists or not.
        # If it is not existing we need to add it.
        _add_encoding_entry(
            formatted_results[table_name]["data"][column_name]["encoding"], new_encoding
        )

    return formatted_results


def update_storage_data(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Get the storage information from hyrise.

    This function requests the storage information via SQL.
    It then formats the results for the front-end and logs them
    to the influx.
    """

    sql = """SELECT
                table_name,
                chunk_id,
                column_name,
                column_data_type,
                encoding_type,
                vector_compression_type,
                estimated_size_in_bytes
            FROM
                meta_segments;"""
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(sql)
            results = cur.fetchall()
    except (DatabaseError, InterfaceError):
        results = []

    time_stamp = time_ns()
    formatted_results = _format_results(results)

    with storage_connection_factory.create_cursor() as log:
        log.log_meta_information(
            "storage",
            {"storage_meta_information": dumps(formatted_results)},
            time_stamp,
        )
