from hyrisecockpit.api.app.monitor.schema import FailedTaskEntrySchema
from hyrisecockpit.api.app.monitor.model import FailedTaskEntry


class TestFailedTaskEntrySchema:
    def test_creates(self):
        assert FailedTaskEntrySchema()

    def test_serializes(self):
        timestamp = 123456789
        worker_id = "worker_01"
        task = "select * from foo;"
        error = "Table with name foo does not exist."
        failed_task_model = FailedTaskEntry(
            timestamp=timestamp,
            worker_id=worker_id,
            task=task,
            error=error,
        )
        serialized = FailedTaskEntrySchema().dump(failed_task_model)
        assert timestamp == failed_task_model.timestamp == serialized["timestamp"]
        assert worker_id == failed_task_model.worker_id == serialized["worker_id"]
        assert task == failed_task_model.task == serialized["task"]
        assert error == failed_task_model.error == serialized["error"]
