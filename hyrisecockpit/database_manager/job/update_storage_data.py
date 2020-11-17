from json import dumps
from time import time_ns

from typing import List, Tuple, Dict

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from psycopg2 import DatabaseError, InterfaceError


def _edit_encoding_entry(
    encodings: List, encoding_type, occurrences, vector_compression_type
) -> None:
    """
    This method checks if an encoding entry for this encoding type exists.
    If so it edits the entry by updating the occurrences and if needed adding
    a new vector_compression_type to the compression list.
    """
    for encoding in encodings:
        if encoding_type == encoding["name"]:
            encoding["amount"] += occurrences
            # If the encoding exists, we need to check if the vector compression type
            # is in the encoding entry. An encoding entry can have multiple
            # vector compression types.
            if vector_compression_type not in encoding["compression"]:
                encoding["compression"].append(vector_compression_type)
            return
    encodings.append(
        {
            "name": encoding_type,
            "amount": occurrences,
            "compression": [vector_compression_type],
        }
    )


def _format_results(results: List[Tuple]) -> Dict:
    formatted_results: Dict = {}

    for row in results:
        (
            table_name,
            column_name,
            column_data_type,
            encoding_type,
            vector_compression_type,
            occurrences,
            size_in_bytes,
        ) = row

        if table_name not in formatted_results:
            formatted_results[table_name] = {"size": 0, "number_columns": 0, "data": {}}

        formatted_results[table_name]["size"] += size_in_bytes

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

        formatted_results[table_name]["data"][column_name]["size"] += size_in_bytes

        _edit_encoding_entry(
            formatted_results[table_name]["data"][column_name]["encoding"],
            encoding_type,
            occurrences,
            vector_compression_type,
        )

    return formatted_results


def update_storage_data(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Get the storage information from hyrise.

    This function requests the storage information via SQL.
    To keep the returned result small we use the group by statement.
    The occurrences aggregation returns how often the tuple exists and so
    how often the encoding_type, vector_compression_type combination (for a chunk) for
    the column_name exists.
    """

    sql = """SELECT
                table_name,
                column_name,
                column_data_type,
                encoding_type,
                vector_compression_type,
                count(*) AS occurrences,
                sum(estimated_size_in_bytes) AS size_in_bytes
            FROM
                meta_segments
            GROUP BY
                table_name,
                column_name,
                column_data_type,
                encoding_type,
                column_data_type,
                vector_compression_type;"""

    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(sql, None)
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
