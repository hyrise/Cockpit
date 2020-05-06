"""Tests for the metric interface."""

from hyrisecockpit.api.app.metric.interface import TimeIntervalInterface


class TestDatabaseInterface:
    """Tests for the metric namespace interfaces."""

    def test_creates_time_interval_interface(self) -> None:
        """A detailed time interval interface can be created."""
        assert TimeIntervalInterface(startts=42, endts=422, precision=1,)
