"""Interface to use in the job modules."""

from typing import Dict, List, TypedDict


class Encoding(TypedDict):
    """Type of an encoding in a storage dictionary."""

    name: str
    amount: int
    compression: List[str]


class ColumnData(TypedDict):
    """Type of column data in a storage dictionary."""

    size: int
    data_type: str
    encoding: List[Encoding]


class TableData(TypedDict):
    """Type of table data in a storage dictionary."""

    size: int
    number_columns: int
    data: Dict[str, ColumnData]


StorageDataType = Dict[str, TableData]
