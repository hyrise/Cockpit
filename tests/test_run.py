# type: ignore
# flake8: noqa

"""Tests for the process manager."""

from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.run import ProcessManager


class TestProcessManager:
    """Tests for process manager class."""

    @fixture
    @patch("hyrisecockpit.run.ProcessManager._init_start_commands", MagicMock())
    @patch("hyrisecockpit.run.ProcessManager._init_logger_pipes", MagicMock())
    @patch("hyrisecockpit.run.ProcessManager._set_logging", MagicMock())
    def process_manager(self) -> ProcessManager:
        """Get a new process manager."""
        cockpit_components = {"backend": True, "frontend": True}
        return ProcessManager(cockpit_components)

    @patch("hyrisecockpit.run.ProcessManager._init_start_commands")
    @patch("hyrisecockpit.run.ProcessManager._init_logger_pipes")
    @patch("hyrisecockpit.run.ProcessManager._set_logging")
    def test_initializes_process_manager(
        self,
        mock_set_logging: MagicMock,
        mock_init_logger_pipes: MagicMock,
        mock_init_start_commands,
    ) -> None:
        """Test initialization of process manager attributes."""
        mock_logger_pipes = MagicMock()
        mock_init_logger_pipes.return_value = mock_logger_pipes
        mock_start_commands = MagicMock()
        mock_init_start_commands.return_value = mock_start_commands

        cockpit_components = {"backend": True, "frontend": True}
        process_manager = ProcessManager(cockpit_components)

        assert process_manager._cockpit_components == cockpit_components
        assert process_manager._running_processes == {}
        assert process_manager._start_commands == mock_start_commands
        assert process_manager._logger_pipes == mock_logger_pipes
        mock_set_logging.assert_called_once()

    @patch("hyrisecockpit.run.logging")
    def test_sets_logging(
        self, mock_logging: MagicMock, process_manager: ProcessManager
    ) -> None:
        """Test sets logging."""
        mock_logging_info = MagicMock()
        mock_logging.INFO.return_value = mock_logging_info

        process_manager._set_logging()

        mock_logging.basicConfig.assert_called_once_with(
            level=mock_logging.INFO,
            format="%(asctime)s :: %(name)s :: %(levelname)s :: %(message)s",
        )

    def test_initializes_start_commands(self, process_manager: ProcessManager) -> None:
        """Test initializes components start commands."""
        expected = {
            "cockpit-backend": ["cockpit-backend"],
            "cockpit-manager": ["cockpit-manager"],
            "cockpit-generator": ["cockpit-generator"],
            "cockpit-frontend": [
                "npm",
                "run",
                "deploy",
                "--prefix",
                "hyrisecockpit/frontend",
            ],
        }

        result = process_manager._init_start_commands()

        assert result == expected

    @patch("hyrisecockpit.run.logging")
    @patch("hyrisecockpit.run.LogPipe")
    def test_creates_logger_pipes(
        self,
        mock_log_pipe: MagicMock,
        mock_logging: MagicMock,
        process_manager: ProcessManager,
    ) -> None:
        """Test creates logger pipes for component."""
        mock_logger = MagicMock()
        mock_logging.getLogger.return_value = mock_logger

        mock_logging_info = MagicMock()
        mock_logging.INFO.return_value = mock_logging_info
        mock_logging_warning = MagicMock()
        mock_logging.WARNING.return_value = mock_logging_warning
        mock_log_pipe.return_value = "pipe"
        expected = {"logpipe_stdout": "pipe", "logpipe_stderr": "pipe"}

        results = process_manager._create_logger_pipes("cockpit-backend")

        mock_logger.setLevel.assert_called_once_with(mock_logging.INFO)
        mock_log_pipe.assert_called_with(mock_logging.WARNING, mock_logger)
        assert results == expected

    def test_initializes_logger_pipes_for_all_components(
        self, process_manager: ProcessManager
    ) -> None:
        """Test initializes logger pipes for all the components."""
        process_manager._create_logger_pipes = lambda component: [component]
        process_manager._cockpit_components = {"backend": True, "frontend": True}
        expected = {
            "cockpit-backend": ["cockpit-backend"],
            "cockpit-manager": ["cockpit-manager"],
            "cockpit-generator": ["cockpit-generator"],
            "cockpit-frontend": ["cockpit-frontend"],
        }

        result = process_manager._init_logger_pipes()

        assert result == expected

    def test_initializes_logger_pipes_for_backend_components(
        self, process_manager: ProcessManager
    ) -> None:
        """Test initializes logger pipes for backend components."""
        process_manager._create_logger_pipes = lambda component: [component]
        process_manager._cockpit_components = {"backend": True, "frontend": False}
        expected = {
            "cockpit-backend": ["cockpit-backend"],
            "cockpit-manager": ["cockpit-manager"],
            "cockpit-generator": ["cockpit-generator"],
        }

        result = process_manager._init_logger_pipes()

        assert result == expected

    def test_initializes_logger_pipes_for_frontend_components(
        self, process_manager: ProcessManager
    ) -> None:
        """Test initializes logger pipes for backend components."""
        process_manager._create_logger_pipes = lambda component: [component]
        process_manager._cockpit_components = {"backend": False, "frontend": True}
        expected = {"cockpit-frontend": ["cockpit-frontend"]}

        result = process_manager._init_logger_pipes()

        assert result == expected

    @patch("hyrisecockpit.run.logging")
    def test_closes_component_processes(
        self, mock_logging: MagicMock, process_manager: ProcessManager
    ) -> None:
        """Test closes component processes."""
        mock_shutdown_component = MagicMock()
        mock_logpipe_stdout = MagicMock()
        mock_logpipe_stderr = MagicMock()
        process_manager._running_processes = {"backend-manager": "sub_process"}
        process_manager._logger_pipes = {
            "backend-manager": {
                "logpipe_stdout": mock_logpipe_stdout,
                "logpipe_stderr": mock_logpipe_stderr,
            }
        }
        process_manager._shutdown_component = mock_shutdown_component

        process_manager.close()

        mock_shutdown_component.assert_called_once_with(
            "backend-manager", "sub_process"
        )
        mock_logpipe_stdout.close.assert_called_once()
        mock_logpipe_stderr.close.assert_called_once()
        mock_logging.info.assert_called_once_with("shutdown backend-manager")

    @patch("hyrisecockpit.run.logging")
    @patch("hyrisecockpit.run.Popen")
    def test_start_component_processes(
        self,
        mock_popen: MagicMock,
        mock_logging: MagicMock,
        process_manager: ProcessManager,
    ) -> None:
        """Test starts component processes."""
        mock_process = MagicMock()
        mock_popen.return_value = mock_process
        mock_logpipe_stdout = MagicMock()
        mock_logpipe_stderr = MagicMock()
        process_manager._logger_pipes = {
            "backend-manager": {
                "logpipe_stdout": mock_logpipe_stdout,
                "logpipe_stderr": mock_logpipe_stderr,
            }
        }
        process_manager._start_commands = {"backend-manager": "backend-manager"}

        process_manager.run()

        mock_logging.info.assert_called_once_with("start backend-manager")
        mock_popen.assert_called_once_with(
            "backend-manager", stdout=mock_logpipe_stdout, stderr=mock_logpipe_stderr
        )
        assert process_manager._running_processes["backend-manager"] == mock_process
