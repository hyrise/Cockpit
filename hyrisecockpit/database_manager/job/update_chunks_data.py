"""This job updates the chunks data."""
from copy import deepcopy
from json import dumps
from time import time_ns
from typing import Dict

from pandas import DataFrame

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.job.sql_to_data_frame import sql_to_data_frame


def _calculate_chunks_difference(base: Dict, substractor: Dict) -> Dict:
    """Calculate difference base - substractor."""
    for table_name in base.keys():
        if table_name in substractor.keys():
            for column_name in base[table_name].keys():
                if column_name in substractor[table_name].keys():
                    if len(base[table_name][column_name]) == len(
                        substractor[table_name][column_name]
                    ):
                        base[table_name][column_name] = [
                            base[table_name][column_name][i]
                            - substractor[table_name][column_name][i]
                            if base[table_name][column_name][i]
                            >= substractor[table_name][column_name][i]
                            else base[table_name][column_name][i]
                            for i in range(len(base[table_name][column_name]))
                        ]
    return base


def _create_chunks_dictionary(meta_segments: DataFrame) -> Dict:  # TODO refactoring
    chunks_data: Dict = {}
    grouped_tables = meta_segments.reset_index().groupby("table_name")

    for table_name in grouped_tables.groups:
        chunks_data[table_name] = {}
        table = grouped_tables.get_group(table_name)
        grouped_columns = table.reset_index().groupby("column_name")

        for column_name in grouped_columns.groups:
            column = grouped_columns.get_group(column_name)
            access_data = []
            for _, row in column.iterrows():
                access_data.append(row["access_count"])
            chunks_data[table_name][column_name] = access_data
    return chunks_data


def update_chunks_data(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
    previous_chunk_data,
) -> None:
    """Update chunks data for database instance."""
    time_stamp = time_ns()
    sql = """SELECT table_name, column_name, chunk_id, (point_accesses + sequential_accesses + monotonic_accesses + random_accesses) as access_count
        FROM meta_segments;"""

    meta_segments = sql_to_data_frame(database_blocked, connection_factory, sql, None)
    chunks_data = {}

    if not meta_segments.empty:
        new_chunks_data = _create_chunks_dictionary(meta_segments)

        if previous_chunk_data["value"] is None:
            previous_chunk_data["value"] = new_chunks_data
            return

        new_chunks_deep_copy = deepcopy(new_chunks_data)
        chunks_data = _calculate_chunks_difference(
            new_chunks_deep_copy, previous_chunk_data["value"]
        )
        previous_chunk_data["value"] = new_chunks_data

    with storage_connection_factory.create_cursor() as log:
        log.log_meta_information(
            "chunks_data",
            {"chunks_data_meta_information": dumps(chunks_data)},
            time_stamp,
        )
