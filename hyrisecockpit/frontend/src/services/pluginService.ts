import { ref } from "@vue/composition-api";
import axios from "axios";
import { controlBackend } from "../../config";
import { PluginService } from "../types/services";
import { eventBus } from "../plugins/eventBus";
import { usePluginTransformationSevice } from "../services/transformationService";

export function usePluginService(): PluginService {
  const plugins = ref<string[]>([]);
  const activePlugins = ref<string[]>([]);
  const pluginLogs = ref<any>({});
  const pluginEventData = ref<any>({});
  const pluginSettings = ref<any>({});
  const {
    getActivePluginData,
    getPluginLogsData,
    getPluginSettingsData,
    getPluginEventData,
  } = usePluginTransformationSevice();

  getPlugins();
  setInterval(() => getPluginLogs(), 1000);
  getPluginSettings();

  eventBus.$on(["DATABASE_ADDED", "DATABASE_REMOVED"], () => {
    getPlugins();
    getPluginSettings();
  });

  function getPlugins(): void {
    axios
      .get(controlBackend + "available_plugins")
      .then((allPluginsResponse) => {
        plugins.value = allPluginsResponse.data;
        axios.get(controlBackend + "plugin").then((activePluginsResponse) => {
          activePlugins.value = getActivePluginData(activePluginsResponse.data);
        });
      });
  }

  function updatePlugins(databaseId: string, plugin: string): Promise<void> {
    const isActivated = !!activePlugins.value.find(
      (pluginId: string) => pluginId === databaseId + "_" + plugin
    );
    if (isActivated) {
      return axios
        .post(controlBackend + "plugin", { id: databaseId, plugin: plugin })
        .then((response) => {
          getPlugins();
          getPluginSettings();
        });
    } else {
      return axios
        .delete(controlBackend + "plugin", {
          data: { id: databaseId, plugin: plugin },
        })
        .then((response) => {
          getPlugins();
          getPluginSettings();
        });
    }
  }

  function getPluginLogs(): Promise<void> {
    return axios.get(controlBackend + "plugin_log").then((response) => {
      pluginLogs.value = getPluginLogsData(response.data);
      pluginEventData.value = getPluginEventData(response.data);
    });
  }

  function getPluginSettings(): void {
    axios.get(controlBackend + "plugin_settings").then((response) => {
      pluginSettings.value = getPluginSettingsData(
        response.data.body.plugin_settings
      );
    });
  }

  function updatePluginSettings(
    databaseId: string,
    settingId: string,
    settingValue: string
  ) {
    axios
      .post(controlBackend + "plugin_settings", {
        id: databaseId,
        name: settingId,
        value: settingValue,
      })
      .then((response) => {
        getPluginSettings();
      });
  }

  return {
    plugins,
    activePlugins,
    updatePlugins,
    pluginLogs,
    pluginSettings,
    updatePluginSettings,
    pluginEventData,
  };
}
