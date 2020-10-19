from unittest.mock import patch
from typing import List, Dict
from flask import Flask
from flask.testing import FlaskClient
from pytest import fixture


from hyrisecockpit.api.app import create_app
from hyrisecockpit.api.app.monitor import BASE_ROUTE_NEW
from hyrisecockpit.cross_platform_support.testing_support import MagicMock

from hyrisecockpit.api.app.monitor.model import (
    Cpu,
    Memory,
    SystemDataEntry,
    SystemData,
    SystemEntry,
    EncodingEntry,
    ColumnEntry,
    TableData,
    StorageData,
    ChunksEntry,
    FailedTasks,
    FailedTaskEntry,
    EncodingTypeEntry,
    OrderModeEntry,
    SegmentConfigurationEntry,
    WorkloadStatementInformationEntry,
    WorkloadStatementInformation,
    WorkloadOperatorInformationEntry,
    WorkloadOperatorInformation,
)

url = f"/{BASE_ROUTE_NEW}"


@fixture
def app() -> Flask:
    """Return a testing app."""
    app = create_app()
    app.testing = True
    return app


@fixture
def client(app: Flask) -> FlaskClient:
    """Return a test client."""
    with app.test_client() as client:
        return client


class TestMonitorController:
    @patch("hyrisecockpit.api.app.monitor.controller.MonitorService")
    def test_get_system(
        self, mock_metric_service: MagicMock, client: FlaskClient
    ) -> None:
        cpu_system_usage: float = 0.42
        cpu_process_usage: float = 0.42
        cpu_count: int = 16
        free: int = 10
        available: int = 10
        total: int = 20
        percent: float = 10.02
        database_threads: int = 10
        timestamp: int = 42
        database_id: str = "database_one"
        cpu_model = Cpu(
            cpu_system_usage=cpu_system_usage,
            cpu_process_usage=cpu_process_usage,
            cpu_count=cpu_count,
        )
        memory_model = Memory(
            free=free, available=available, total=total, percent=percent
        )
        system_data_entry_model: SystemDataEntry = SystemDataEntry(
            cpu=cpu_model, memory=memory_model, database_threads=database_threads
        )
        sytem_data_model: SystemData = SystemData(
            timestamp=timestamp, system_data_entry=system_data_entry_model
        )

        system_entry_model: SystemEntry = SystemEntry(
            database_id=database_id, system_data=[sytem_data_model]
        )

        expected: List[Dict] = [
            {
                "id": database_id,
                "system_data": [
                    {
                        "timestamp": timestamp,
                        "system_data": {
                            "cpu": {
                                "cpu_system_usage": cpu_system_usage,
                                "cpu_process_usage": cpu_process_usage,
                                "cpu_count": cpu_count,
                            },
                            "memory": {
                                "free": free,
                                "available": available,
                                "total": total,
                                "percent": percent,
                            },
                            "database_threads": database_threads,
                        },
                    }
                ],
            }
        ]
        mock_metric_service.get_system_data.return_value = [system_entry_model]
        fake_startts = 1
        fake_endts = 5
        fake_precision = 1
        parameterized_url = f"{url}/system?startts={fake_startts}&endts={fake_endts}&precision={fake_precision}"

        response = client.get(parameterized_url, follow_redirects=True)

        assert 200 == response.status_code
        assert expected == response.get_json()

    @patch("hyrisecockpit.api.app.monitor.controller.MonitorService")
    def test_get_storage(
        self, mock_metric_service: MagicMock, client: FlaskClient
    ) -> None:
        database_id: str = "some_db_id"
        encoding_name: str = "Dictionary"
        amount: int = 1
        compression: List[str] = ["FixedSize2ByteAligned"]
        columns_entry_size: int = 89644
        data_type = "float"
        table_size: int = 4374976
        number_columns: int = 1
        encoding_model: List[EncodingEntry] = [
            EncodingEntry(name=encoding_name, amount=amount, compression=compression)
        ]
        colums_entry_model: ColumnEntry = ColumnEntry(
            size=columns_entry_size, data_type=data_type, encoding=encoding_model
        )
        data: Dict[str, ColumnEntry] = {"c_acctbal": colums_entry_model}
        table_data_model: TableData = TableData(
            size=table_size, number_columns=number_columns, data=data
        )

        storage_data_model: StorageData = StorageData(
            id=database_id, storage={"customer_tpch_0_1": table_data_model}
        )

        expected: List[Dict] = [
            {
                "id": database_id,
                "storage": {
                    "customer_tpch_0_1": {
                        "size": table_size,
                        "number_columns": number_columns,
                        "data": {
                            "c_acctbal": {
                                "size": columns_entry_size,
                                "data_type": data_type,
                                "encoding": [
                                    {
                                        "name": encoding_name,
                                        "amount": amount,
                                        "compression": compression,
                                    }
                                ],
                            }
                        },
                    }
                },
            }
        ]
        mock_metric_service.get_storage.return_value = [storage_data_model]

        response = client.get(f"{url}/storage", follow_redirects=True)

        assert 200 == response.status_code
        assert expected == response.get_json()

    @patch("hyrisecockpit.api.app.monitor.controller.MonitorService")
    def test_get_chunks(
        self, mock_metric_service: MagicMock, client: FlaskClient
    ) -> None:

        database_id: str = "database_one"
        chunks_data: Dict = {
            "part_tpch_1": {
                "p_brand": [0, 0, 0, 0],
                "p_comment": [0, 0, 0, 0],
                "p_container": [0, 0, 0, 0],
            }
        }

        chunks_entry_model: ChunksEntry = ChunksEntry(
            database_id=database_id, chunks_data=chunks_data
        )
        mock_metric_service.get_chunks.return_value = [chunks_entry_model]
        expected: List[Dict] = [{"id": database_id, "chunks_data": chunks_data}]

        response = client.get(f"{url}/chunks", follow_redirects=True)

        assert 200 == response.status_code
        assert expected == response.get_json()

    @patch("hyrisecockpit.api.app.monitor.controller.MonitorService")
    def test_get_failed_tasks(
        self, mock_metric_service: MagicMock, client: FlaskClient
    ) -> None:
        database_id: str = "some_db_id"
        timestamp: int = 123456789
        worker_id: str = "worker_01"
        task: str = "select * from foo;"
        error: str = "Table with name foo does not exist."
        failed_task_model_entry: FailedTaskEntry = FailedTaskEntry(
            timestamp=timestamp,
            worker_id=worker_id,
            task=task,
            error=error,
        )
        failed_task_model: FailedTasks = FailedTasks(
            database_id=database_id,
            failed_queries=[failed_task_model_entry],
        )
        mock_metric_service.get_failed_tasks.return_value = [failed_task_model]
        expected: List[Dict] = [
            {
                "id": database_id,
                "failed_queries": [
                    {
                        "timestamp": timestamp,
                        "worker_id": worker_id,
                        "task": task,
                        "error": error,
                    }
                ],
            }
        ]

        response = client.get(f"{url}/failed_tasks", follow_redirects=True)

        assert 200 == response.status_code
        assert expected == response.get_json()

    @patch("hyrisecockpit.api.app.monitor.controller.MonitorService")
    def test_get_segment_configuration(
        self, mock_metric_service: MagicMock, client: FlaskClient
    ) -> None:

        database_id: str = "some_db_id"
        encoding: str = "Dictionary"
        order: str = "Ascending"
        encoding_entry_model: EncodingTypeEntry = EncodingTypeEntry(
            encoding_type=encoding
        )
        order_mode_entry_model: OrderModeEntry = OrderModeEntry(order_mode=order)
        encoding_type: Dict[str, Dict[str, EncodingTypeEntry]] = {
            "customer_tpch_1": {"0": encoding_entry_model}
        }
        order_mode: Dict[str, Dict[str, OrderModeEntry]] = {
            "customer_tpch_1": {"0": order_mode_entry_model}
        }

        segment_configuration_entry: SegmentConfigurationEntry = (
            SegmentConfigurationEntry(
                id=database_id,
                encoding_type=encoding_type,
                order_mode=order_mode,
            )
        )
        mock_metric_service.get_segment_configuration.return_value = [
            segment_configuration_entry
        ]

        expected: List[Dict] = [
            {
                "id": database_id,
                "encoding_type": {
                    "customer_tpch_1": {"0": {"encoding_type": encoding}}
                },
                "order_mode": {"customer_tpch_1": {"0": {"order_mode": order}}},
            }
        ]

        response = client.get(f"{url}/segment_configuration", follow_redirects=True)

        assert 200 == response.status_code
        assert expected == response.get_json()

    @patch("hyrisecockpit.api.app.monitor.controller.MonitorService")
    def test_get_workload_statement_information(
        self, mock_metric_service: MagicMock, client: FlaskClient
    ) -> None:
        database_id: str = "some_db_id"
        query_type: str = "SELECT"
        total_latency: int = 9568298895
        total_frequency: int = 1504
        workload_statement_information_entry_model: WorkloadStatementInformationEntry = WorkloadStatementInformationEntry(
            query_type=query_type,
            total_latency=total_latency,
            total_frequency=total_frequency,
        )

        workload_statement_information_model: WorkloadStatementInformation = (
            WorkloadStatementInformation(
                id=database_id,
                workload_statement_information=[
                    workload_statement_information_entry_model
                ],
            )
        )
        mock_metric_service.get_workload_statement_information.return_value = [
            workload_statement_information_model
        ]

        expected: List[Dict] = [
            {
                "id": database_id,
                "workload_statement_information": [
                    {
                        "query_type": query_type,
                        "total_latency": total_latency,
                        "total_frequency": total_frequency,
                    }
                ],
            }
        ]

        response = client.get(
            f"{url}/workload_statement_information", follow_redirects=True
        )

        assert 200 == response.status_code
        assert expected == response.get_json()

    @patch("hyrisecockpit.api.app.monitor.controller.MonitorService")
    def test_get_workload_operation_information(
        self, mock_metric_service: MagicMock, client: FlaskClient
    ) -> None:
        database_id: str = "some_db_id"
        operator: str = "Alias"
        total_time_ns: int = 9568298895
        workload_operator_information_entry_model: WorkloadOperatorInformationEntry = (
            WorkloadOperatorInformationEntry(
                operator=operator, total_time_ns=total_time_ns
            )
        )

        workload_operator_information_model: WorkloadOperatorInformation = (
            WorkloadOperatorInformation(
                id=database_id,
                workload_operator_information=[
                    workload_operator_information_entry_model
                ],
            )
        )
        mock_metric_service.get_workload_operator_information.return_value = [
            workload_operator_information_model
        ]

        expected: List[Dict] = [
            {
                "id": database_id,
                "workload_operator_information": [
                    {
                        "operator": operator,
                        "total_time_ns": total_time_ns,
                    }
                ],
            }
        ]

        response = client.get(
            f"{url}/workload_operator_information", follow_redirects=True
        )

        assert 200 == response.status_code
        assert expected == response.get_json()
