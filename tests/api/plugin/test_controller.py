"""Tests for the Plugin controller."""

from json import dumps
from unittest.mock import patch

from flask import Flask
from flask.testing import FlaskClient
from pytest import fixture

from hyrisecockpit.api.app import create_app
from hyrisecockpit.api.app.plugin import BASE_ROUTE
from hyrisecockpit.api.app.plugin.interface import (
    DetailedPluginIDInterface,
    DetailedPluginInterface,
    PluginInterface,
    PluginSettingInterface,
)
from hyrisecockpit.api.app.plugin.schema import DetailedPluginIDSchema

url = f"/{BASE_ROUTE}"


@fixture
def database_id() -> str:
    """Get a database id."""
    return "york"


@fixture
def interface() -> PluginInterface:
    """Get a plugin interface."""
    return PluginInterface(name="Compression")


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


class TestPluginController:
    """Tests for the PluginController."""

    def test_gets_all_plugins(self, client: FlaskClient):
        """A PluginController routes get correctly."""
        expected = [
            DetailedPluginIDInterface(
                id="york",
                plugins=[
                    DetailedPluginInterface(
                        name="Compression",
                        settings=[
                            PluginSettingInterface(
                                name="MemoryBudget", value="5000", description="..."
                            )
                        ],
                    ),
                    DetailedPluginInterface(
                        name="Clustering",
                        settings=[
                            PluginSettingInterface(
                                name="SomeOtherSetting", value="true", description="..."
                            )
                        ],
                    ),
                ],
            )
        ]
        with patch(
            "hyrisecockpit.api.app.plugin.service.PluginService.get_all"
        ) as get_all:
            get_all.return_value = expected
            response = client.get(url, follow_redirects=True)
        assert 200 == response.status_code
        assert DetailedPluginIDSchema(many=True).dump(expected) == response.get_json()


class TestDetailedPluginIDController:
    """Tests for the DetailedPluginIDController."""

    def test_activates_the_correct_plugin(
        self, client: FlaskClient, database_id: str, interface: PluginInterface
    ):
        """A DetailedPluginID controller routes post route correctly."""
        with patch(
            "hyrisecockpit.api.app.plugin.service.PluginService.activate_by_id"
        ) as activate:
            activate.return_value = 200
            response = client.post(
                url + f"/{database_id}",
                data=dumps(interface),
                content_type="application/json",
                follow_redirects=True,
            )
        assert 200 == response.status_code
        assert not response.is_json

    def test_doesnt_activate_when_id_not_available(
        self, client: FlaskClient, database_id: str, interface: PluginInterface
    ):
        """A DetailedPluginID controller routes post route correctly."""
        with patch(
            "hyrisecockpit.api.app.plugin.service.PluginService.activate_by_id"
        ) as activate:
            activate.return_value = 404
            response = client.post(
                url + f"/{database_id}",
                data=dumps(interface),
                content_type="application/json",
                follow_redirects=True,
            )
        assert 404 == response.status_code
        assert not response.is_json

    def test_doesnt_activate_when_database_blocked(
        self, client: FlaskClient, database_id: str, interface: PluginInterface
    ):
        """A DetailedPluginID controller routes post route correctly."""
        with patch(
            "hyrisecockpit.api.app.plugin.service.PluginService.activate_by_id"
        ) as activate:
            activate.return_value = 423
            response = client.post(
                url + f"/{database_id}",
                data=dumps(interface),
                content_type="application/json",
                follow_redirects=True,
            )
        assert 423 == response.status_code
        assert not response.is_json

    def test_deactivates_the_correct_plugin(
        self, client: FlaskClient, database_id: str, interface: PluginInterface
    ):
        """A DetailedPluginID controller routes delete correctly."""
        with patch(
            "hyrisecockpit.api.app.plugin.service.PluginService.deactivate_by_id"
        ) as deactivate:
            deactivate.return_value = 200
            response = client.delete(
                url + f"/{database_id}",
                data=dumps(interface),
                content_type="application/json",
                follow_redirects=True,
            )
        assert 200 == response.status_code
        assert not response.is_json

    def test_doesnt_deactivate_when_id_not_available(
        self, client: FlaskClient, database_id: str, interface: PluginInterface
    ):
        """A DetailedPluginID controller routes delete correctly."""
        with patch(
            "hyrisecockpit.api.app.plugin.service.PluginService.deactivate_by_id"
        ) as deactivate:
            deactivate.return_value = 404
            response = client.delete(
                url + f"/{database_id}",
                data=dumps(interface),
                content_type="application/json",
                follow_redirects=True,
            )
        assert 404 == response.status_code
        assert not response.is_json

    def test_doesnt_deactivate_when_database_blocked(
        self, client: FlaskClient, database_id: str, interface: PluginInterface
    ):
        """A DetailedPluginID controller routes delete correctly."""
        with patch(
            "hyrisecockpit.api.app.plugin.service.PluginService.deactivate_by_id"
        ) as deactivate:
            deactivate.return_value = 423
            response = client.delete(
                url + f"/{database_id}",
                data=dumps(interface),
                content_type="application/json",
                follow_redirects=True,
            )
        assert 423 == response.status_code
        assert not response.is_json
