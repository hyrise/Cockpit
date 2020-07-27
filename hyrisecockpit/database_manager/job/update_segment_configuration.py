"""This job updates the segment configurations."""
from json import dumps
from time import time_ns
from typing import Dict

from pandas import DataFrame

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.job.sql_to_data_frame import sql_to_data_frame


def _create_dictionary(meta_segments: DataFrame) -> Dict:  # TODO refactoring
    segment_configuration_data: Dict = {}
    grouped_tables = meta_segments.reset_index().groupby("table_name")

    for table_name in grouped_tables.groups:
        segment_configuration_data[table_name] = {}
        table = grouped_tables.get_group(table_name)
        grouped_columns = table.reset_index().groupby("column_name")

        for column_name in grouped_columns.groups:
            column = grouped_columns.get_group(column_name)
            for _, row in column.iterrows():
                segment_configuration_data[table_name][column_name][
                    "encoding_type"
                ] = row["encoding_type"]
                segment_configuration_data[table_name][column_name]["order_mode"] = row[
                    "order_mode"
                ]
    return segment_configuration_data


def _get_meta_segments(
    segments_encoding: DataFrame, segment_orders: DataFrame
) -> DataFrame:
    return segments_encoding.set_index(
        ["table_name", "column_id", "chunk_id"], verify_integrity=True,
    ).join(
        segment_orders.set_index(
            ["table_name", "column_id", "chunk_id"], verify_integrity=True,
        )
    )


def update_segment_configuration(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Update segment configuration data for database instance."""
    time_stamp = time_ns()

    segments_encodings = sql_to_data_frame(
        database_blocked,
        connection_factory,
        """SELECT table_name, column_name, chunk_id, encoding_type FROM meta_segments;""",
        None,
    )
    segments_orders = sql_to_data_frame(
        database_blocked,
        connection_factory,
        """SELECT table_name, chunk_id, order_mode FROM meta_chunk_sort_orders;""",
        None,
    )

    segment_configuration = {}
    if not (segments_encodings.empty or segments_orders.empty):
        segment_configuration = _create_dictionary(
            _get_meta_segments(segments_encodings, segments_orders)
        )

    with storage_connection_factory.create_cursor() as log:
        log.log_meta_information(
            "segment_configuration",
            {"segment_cofiguration_information": dumps(segment_configuration)},
            time_stamp,
        )
