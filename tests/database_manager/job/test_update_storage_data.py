"""Tests for the update storage data job."""
from json import dumps
from unittest.mock import patch

from typing import Dict, List, Tuple

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_storage_data import (
    update_storage_data,
    _format_results,
    _add_encoding_entry,
)


class TestUpdateStorageDataJob:
    """Test update storage data job."""

    def test_formats_results(
        self,
    ) -> None:

        sql_results: List[Tuple] = [
            (
                "customer",
                0,
                "c_custkey",
                "int",
                "Dictionary",
                "FixedSize2ByteAligned",
                9000,
            ),
            (
                "customer",
                0,
                "c_nationkey",
                "string",
                "Dictionary",
                "FixedSize2ByteAligned",
                1000,
            ),
            (
                "supplier",
                0,
                "s_address",
                "string",
                "Dictionary",
                "FixedSize2ByteAligned",
                400,
            ),
        ]

        expected: Dict = {
            "customer": {
                "size": 10000,
                "number_columns": 2,
                "data": {
                    "c_custkey": {
                        "size": 9000,
                        "data_type": "int",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    },
                    "c_nationkey": {
                        "size": 1000,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    },
                },
            },
            "supplier": {
                "size": 400,
                "number_columns": 1,
                "data": {
                    "s_address": {
                        "size": 400,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    }
                },
            },
        }

        results: Dict = _format_results(sql_results)

        assert results == expected

    def test_adds_encoding_entry_to_formatted_results_if_encoding_exists(self) -> None:
        formatted_results: Dict = {
            "supplier": {
                "size": 400,
                "number_columns": 1,
                "data": {
                    "s_address": {
                        "size": 400,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    }
                },
            },
        }
        new_encoding: Dict = {
            "name": "Dictionary",
            "amount": 1,
            "compression": ["FixedSize2ByteAligned"],
        }

        expected_amount = 2
        expected: Dict = {
            "supplier": {
                "size": 400,
                "number_columns": 1,
                "data": {
                    "s_address": {
                        "size": 400,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": expected_amount,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    }
                },
            },
        }
        table_name = "supplier"
        column_name = "s_address"
        _add_encoding_entry(
            formatted_results[table_name]["data"][column_name]["encoding"], new_encoding
        )

        assert expected == formatted_results

    def test_adds_encoding_entry_to_formatted_results(self) -> None:
        formatted_results: Dict = {
            "supplier": {
                "size": 400,
                "number_columns": 1,
                "data": {
                    "s_address": {
                        "size": 400,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    }
                },
            },
        }
        new_encoding: Dict = {
            "name": "LZ4",
            "amount": 1,
            "compression": ["FixedSize2ByteAligned"],
        }
        expected: Dict = {
            "supplier": {
                "size": 400,
                "number_columns": 1,
                "data": {
                    "s_address": {
                        "size": 400,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            },
                            new_encoding,
                        ],
                    }
                },
            },
        }
        table_name = "supplier"
        column_name = "s_address"
        _add_encoding_entry(
            formatted_results[table_name]["data"][column_name]["encoding"], new_encoding
        )

        assert expected == formatted_results

    @patch("hyrisecockpit.database_manager.job.update_storage_data._format_results")
    @patch("hyrisecockpit.database_manager.job.update_storage_data.time_ns", lambda: 42)
    def test_logs_storage_data(
        self,
        mock_format_results: MagicMock,
    ) -> None:
        mock_cursor = MagicMock()
        mock_storage_connection_factory = MagicMock()
        mock_storage_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        storage_results: Dict = {
            "supplier": {
                "size": 400,
                "number_columns": 1,
                "data": {
                    "s_address": {
                        "size": 400,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    }
                },
            },
        }
        mock_format_results.return_value = storage_results

        update_storage_data(
            MagicMock(),
            MagicMock(),
            mock_storage_connection_factory,
        )

        mock_cursor.log_meta_information.assert_called_with(
            "storage",
            {"storage_meta_information": dumps(storage_results)},
            42,
        )
