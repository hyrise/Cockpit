"""Tests for the update storage data job."""
from json import dumps
from unittest.mock import patch

from typing import Dict, List, Tuple

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_storage_data import (
    update_storage_data,
    _format_results,
    _edit_encoding_entry,
)


class TestUpdateStorageDataJob:
    """Test update storage data job."""

    def test_formats_results(
        self,
    ) -> None:

        sql_results: List[Tuple] = [
            (
                "customer",
                "c_custkey",
                "int",
                "Dictionary",
                "FixedSize2ByteAligned",
                10,
                9000,
            ),
            (
                "customer",
                "c_nationkey",
                "string",
                "FixedStringDictionary",
                "SimdBp128",
                5,
                1000,
            ),
            (
                "customer",
                "c_nationkey",
                "string",
                "Dictionary",
                "SimdBp128",
                25,
                1000,
            ),
            (
                "supplier",
                "s_address",
                "string",
                "Dictionary",
                "FixedSize2ByteAligned",
                10,
                400,
            ),
            (
                "supplier",
                "s_address",
                "string",
                "Dictionary",
                "SimdBp128",
                9,
                400,
            ),
        ]

        expected: Dict = {
            "customer": {
                "size": 11000,
                "number_columns": 2,
                "data": {
                    "c_custkey": {
                        "size": 9000,
                        "data_type": "int",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "occurrences": 10,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    },
                    "c_nationkey": {
                        "size": 2000,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "FixedStringDictionary",
                                "occurrences": 5,
                                "compression": ["SimdBp128"],
                            },
                            {
                                "name": "Dictionary",
                                "occurrences": 25,
                                "compression": ["SimdBp128"],
                            },
                        ],
                    },
                },
            },
            "supplier": {
                "size": 800,
                "number_columns": 1,
                "data": {
                    "s_address": {
                        "size": 800,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "occurrences": 19,
                                "compression": ["FixedSize2ByteAligned", "SimdBp128"],
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
                                "occurrences": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    }
                },
            },
        }

        encoding_type = "Dictionary"
        occurrences = 10
        vector_compression_type = "FixedSize2ByteAligned"

        expected_occurrences = 11
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
                                "name": encoding_type,
                                "occurrences": expected_occurrences,
                                "compression": [vector_compression_type],
                            }
                        ],
                    }
                },
            },
        }
        table_name = "supplier"
        column_name = "s_address"
        _edit_encoding_entry(
            formatted_results[table_name]["data"][column_name]["encoding"],
            encoding_type,
            occurrences,
            vector_compression_type,
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
                                "occurrences": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    }
                },
            },
        }

        encoding_type = "LZ4"
        occurrences = 1
        vector_compression_type = "FixedSize2ByteAligned"

        expected_new_encoding: Dict = {
            "name": encoding_type,
            "occurrences": occurrences,
            "compression": [vector_compression_type],
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
                                "occurrences": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            },
                            expected_new_encoding,
                        ],
                    }
                },
            },
        }
        table_name = "supplier"
        column_name = "s_address"
        _edit_encoding_entry(
            formatted_results[table_name]["data"][column_name]["encoding"],
            encoding_type,
            occurrences,
            vector_compression_type,
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
                                "occurrences": 1,
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
