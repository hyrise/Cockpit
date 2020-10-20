from json import dumps
from time import time_ns

from pandas import DataFrame

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.job.interfaces import StorageDataType
from hyrisecockpit.database_manager.job.sql_to_data_frame import sql_to_data_frame


def _create_storage_data_dataframe(meta_segments: DataFrame) -> DataFrame:
    """Manipulate the data frame.

    Example:
        The following data frame:
        table_name | chunk_id | column_name | column_data_type | encoding_type | vector_compression_type | estimated_size_in_bytes
        -----------+----------+-------------+------------------+---------------+-------------------------+------------------------
        customer   |        0 |   c_custkey |              int |    Dictionary |   FixedSize2ByteAligned |                   90096
        customer   |        0 |   c_address |           string |    Dictionary |   FixedSize2ByteAligned |                  975528
        lineitem   |        0 |  l_orderkey |              int |    Dictionary |   FixedSize2ByteAligned |                  196558
        would be transformed to the following data-frame:
        table_name | column_name | estimated_size_in_bytes | encoding_type                                                                 | vector_compression_type  | column_data_type
        -----------+-------------+-------------------------+-------------------------------------------------------------------------------+--------------------------+-----------------
        customer   |   c_custkey |                   90096 | [{'name': 'Dictionary', 'amount': 1, 'compression: ["FixedSize2ByteAligned"]} | ["FixedSize2ByteAligned"]| int
                   |   c_address |                  975528 | [{'name': 'Dictionary', 'amount': 1, 'compression: ["FixedSize2ByteAligned"]} | ["FixedSize2ByteAligned"]| string
        lineitem   |  l_orderkey |                  196558 | [{'name': 'Dictionary', 'amount': 1, 'compression: ["FixedSize2ByteAligned"]} | ["FixedSize2ByteAligned"]| int
        It is important to note that the data-frame is grouped by the table_name column.
    """
    meta_segments.set_index(
        ["table_name", "column_name", "chunk_id"],
        inplace=True,
        verify_integrity=True,
    )
    size: DataFrame = DataFrame(
        meta_segments["estimated_size_in_bytes"]
        .groupby(level=["table_name", "column_name"])
        .sum()
    )

    vector_compression_type = DataFrame(
        meta_segments["vector_compression_type"]
        .groupby(level=["table_name", "column_name"])
        .apply(set)
        .apply(list)
    )

    encoding: DataFrame = DataFrame(
        meta_segments["encoding_type"]
        .groupby(level=["table_name", "column_name"])
        .apply(list)
    )

    combined_encoding = encoding.join(vector_compression_type)

    for _, row in combined_encoding.iterrows():
        row["encoding_type"] = [
            {
                "name": encoding,
                "amount": row["encoding_type"].count(encoding),
                "compression": row["vector_compression_type"],
            }
            for encoding in set(row["encoding_type"])
        ]

    datatype: DataFrame = meta_segments.reset_index().set_index(
        ["table_name", "column_name"]
    )[["column_data_type"]]

    result: DataFrame = size.join(combined_encoding).join(datatype)
    return result


def _create_storage_data_dictionary(result: DataFrame) -> StorageDataType:
    """Sort storage data-frame to dictionary.

    For a detailed example please refer to the tests for this job.
    """
    output: StorageDataType = {}
    grouped = result.reset_index().groupby("table_name")
    for column in grouped.groups:
        output[column] = {"size": 0, "number_columns": 0, "data": {}}
        for _, row in grouped.get_group(column).iterrows():
            output[column]["number_columns"] += 1
            output[column]["size"] += row["estimated_size_in_bytes"]
            output[column]["data"][row["column_name"]] = {
                "size": row["estimated_size_in_bytes"],
                "data_type": row["column_data_type"],
                "encoding": row["encoding_type"],
            }
    return output


def update_storage_data(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Get storage data from the database.

    This method gets the meta segment data from the hyrise. It then formats the response
    from the hyrise via panda data-frames to the desired output.
    """
    time_stamp = time_ns()
    meta_segments = sql_to_data_frame(
        database_blocked, connection_factory, "SELECT * FROM meta_segments;", None
    )

    with storage_connection_factory.create_cursor() as log:
        output = {}
        if not meta_segments.empty:
            result = _create_storage_data_dataframe(meta_segments)
            output = _create_storage_data_dictionary(result)
        log.log_meta_information(
            "storage",
            {"storage_meta_information": dumps(output)},
            time_stamp,
        )
