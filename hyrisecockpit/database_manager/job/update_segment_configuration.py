from json import dumps
from time import time_ns
from typing import Dict, List, Tuple

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.cursor import ConnectionFactory

from psycopg2 import DatabaseError, InterfaceError


def _execute_sql(sql: str, connection_factory: ConnectionFactory):
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(sql, None)
            return cur.fetchall()
    except (DatabaseError, InterfaceError):
        return []


def _format_results(results: List[Tuple]) -> Dict:
    """Format psycopg2 cursor results.

    This function iterates over each row and creates a dictionary where
    the keys are the tables names. For every table name the value is a
    dictionary where the keys are the column names. For every column name
    the value is a list where the indices are the chunk_id and the value is
    the mode. The mode can be for example "Dictionary",
    We can build this list with a loop since the chunks are
    in ascending order. The mode is represented by an integer.
    The integer is the index of the mode in the mode_id_mapping list.
    We use this list to make it easier in the frontend to build the headmap.
    """
    formatted_results: Dict = {}
    mode_id_mapping: List = []

    for row in results:
        table_name, column_name, chunk_id, mode = row
        if table_name not in formatted_results:
            formatted_results[table_name] = {}
        if column_name not in formatted_results[table_name]:
            formatted_results[table_name][column_name] = []
        if mode not in mode_id_mapping:
            mode_id_mapping.append(mode)
        formatted_results[table_name][column_name].append(mode_id_mapping.index(mode))

    return {"columns": formatted_results, "mode_mapping": mode_id_mapping}


def update_segment_configuration(
    database_blocked,
    connection_factory: ConnectionFactory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Update segment configuration data for database instance.

    First the needed information is extracted from the Hyrise. After that the raw SQL results
    are formatted to a dictionary they are written to the influx.
    The table meta_chunk_sort_orders only has the columns table_name, chunk_id, column_id and order_mode.
    To be able to assign the chunks to the column name we need to join the meta_chunk_sort_orders with the
    meta_segments table.
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

    sql_segments_encoding_results: List[Tuple] = _execute_sql(
        sql_segments_encoding, connection_factory
    )
    sql_segments_order_results: List[Tuple] = _execute_sql(
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
