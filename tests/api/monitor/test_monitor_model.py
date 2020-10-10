from hyrisecockpit.api.app.monitor.model import FailedTaskEntry, FailedTasks


class TestFailedTasksModel:
    def test_creates_failed_task_entry(self):
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
        assert timestamp == failed_task_model.timestamp
        assert worker_id == failed_task_model.worker_id
        assert task == failed_task_model.task
        assert error == failed_task_model.error

    def test_creates_failed_tasks(self):
        database_id = "database_id"
        timestamp_failed_one = 1
        worker_id_failed_one = "worker_01"
        task_failed_one = "select * from foo;"
        error_failed_one = "Table with name foo does not exist."
        timestamp_failed_two = 2
        worker_id_failed_two = "worker_02"
        task_failed_two = "select * from foo;"
        error_failed_two = "Table with name foo does not exist."
        failed_task_model_one = FailedTaskEntry(
            timestamp=timestamp_failed_one,
            worker_id=worker_id_failed_one,
            task=task_failed_one,
            error=error_failed_one,
        )
        failed_task_model_two = FailedTaskEntry(
            timestamp=timestamp_failed_two,
            worker_id=worker_id_failed_two,
            task=task_failed_two,
            error=error_failed_two,
        )
        failed_task_model = FailedTasks(
            database_id=database_id,
            failed_task_entries=[failed_task_model_one, failed_task_model_two],
        )
        assert database_id == failed_task_model.id
        assert [
            failed_task_model_one,
            failed_task_model_two,
        ] == failed_task_model.failed_task_entries
