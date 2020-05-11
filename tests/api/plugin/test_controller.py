"""Tests for the Plugin controller."""

from json import dumps
from unittest.mock import patch

from flask.testing import FlaskClient
from pytest import mark

from hyrisecockpit.api.app.plugin import BASE_ROUTE
from hyrisecockpit.api.app.plugin.interface import (
    DetailedPluginIDInterface,
    DetailedPluginInterface,
    PluginInterface,
    PluginSettingInterface,
    UpdatePluginSettingInterface,
)
from hyrisecockpit.api.app.plugin.schema import DetailedPluginIDSchema

url = f"/{BASE_ROUTE}"


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

    @mark.parametrize("status", [200, 404, 423])
    def test_activates_a_plugin(
        self, client: FlaskClient, id: str, interface: PluginInterface, status: int
    ):
        """A DetailedPluginID controller routes post route correctly."""
        with patch(
            "hyrisecockpit.api.app.plugin.service.PluginService.activate_by_id"
        ) as activate:
            activate.return_value = status
            response = client.post(
                url + f"/{id}",
                data=dumps(interface),
                content_type="application/json",
                follow_redirects=True,
            )
        assert response.status_code == status
        assert not response.is_json

    @mark.parametrize("status", [200, 404, 423])
    def test_deactivates_a_plugin(
        self, client: FlaskClient, id: str, interface: PluginInterface, status: int
    ):
        """A DetailedPluginID controller routes delete correctly."""
        with patch(
            "hyrisecockpit.api.app.plugin.service.PluginService.deactivate_by_id"
        ) as deactivate:
            deactivate.return_value = status
            response = client.delete(
                url + f"/{id}",
                data=dumps(interface),
                content_type="application/json",
                follow_redirects=True,
            )
        assert response.status_code == status
        assert not response.is_json

    @mark.parametrize("status", [200, 404, 423])
    def test_updates_a_plugin(
        self,
        client: FlaskClient,
        id: str,
        interface_update_plugin_setting: UpdatePluginSettingInterface,
        status: int,
    ):
        """A DetailedPluginID controller routes put correctly."""
        with patch(
            "hyrisecockpit.api.app.plugin.service.PluginService.update_plugin_setting"
        ) as update:
            update.return_value = status
            response = client.put(
                url + f"/{id}",
                data=dumps(interface_update_plugin_setting),
                content_type="application/json",
                follow_redirects=True,
            )
        assert response.status_code == status
        assert not response.is_json
