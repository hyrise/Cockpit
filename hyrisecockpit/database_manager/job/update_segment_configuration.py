from json import dumps
from time import time_ns
from typing import Dict, List, Tuple

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.cursor import ConnectionFactory
from .execute_sql import execute_sql


def _format_results(results: List[Tuple]) -> Dict:
    """Format psycopg2 cursor results.

    This function iterates over each row and creates a dictionary where
    the keys are the table names. For every table name the value is a
    dictionary where the keys are the column names. For every column name
    the value is a list where the indices are the chunk_id and the value is
    the name of the configuration. The name of the configuration can be for example "Dictionary",
    We can build this list with a loop since the chunks are
    in ascending order. The name of the configuration is represented by an integer.
    The integer is the index of the name of the configuration in the mode_id_mapping list.
    """
    formatted_results: Dict = {}
    mode_id_mapping: List = []

    for row in results:
        table_name, column_name, chunk_id, configuration = row
        if table_name not in formatted_results:
            formatted_results[table_name] = {}
        if column_name not in formatted_results[table_name]:
            formatted_results[table_name][column_name] = []
        if configuration not in mode_id_mapping:
            mode_id_mapping.append(configuration)
        formatted_results[table_name][column_name].append(
            mode_id_mapping.index(configuration)
        )

    return {"columns": formatted_results, "mode_mapping": mode_id_mapping}


def update_segment_configuration(
    database_blocked,
    connection_factory: ConnectionFactory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Update segment configuration data for database instance.

    First the needed information is extracted from the Hyrise. After that the raw SQL results
    are formatted and written to the influx.
    """
    sql_segments_encoding: str = """SELECT
                                    table_name,
                                    column_name,
                                    chunk_id,
                                    encoding_type
                                    FROM meta_segments
                                    ORDER BY chunk_id ASC;"""
    sql_segments_order: str = """SELECT
                                meta_chunk_sort_orders.table_name,
                                meta_segments.column_name,
                                meta_chunk_sort_orders.chunk_id,
                                meta_chunk_sort_orders.order_mode
                                FROM meta_chunk_sort_orders
                                JOIN meta_segments
                                    ON meta_segments.table_name = meta_chunk_sort_orders.table_name
                                    AND meta_segments.chunk_id = meta_chunk_sort_orders.chunk_id
                                ORDER BY meta_chunk_sort_orders.chunk_id ASC;"""
    time_stamp = time_ns()

    sql_segments_encoding_results: List[Tuple] = execute_sql(
        sql_segments_encoding, connection_factory
    )
    sql_segments_order_results: List[Tuple] = execute_sql(
        sql_segments_order, connection_factory
    )

    formatted_sql_segments_encoding_results = _format_results(
        sql_segments_encoding_results
    )
    formatted_sql_segments_order_results = _format_results(sql_segments_order_results)

    with storage_connection_factory.create_cursor() as log:
        log.log_meta_information(
            "segment_configuration",
            {
                "segment_configuration_encoding_type": dumps(
                    formatted_sql_segments_encoding_results
                ),
                "segment_configuration_order_mode": dumps(
                    formatted_sql_segments_order_results
                ),
            },
            time_stamp,
        )
