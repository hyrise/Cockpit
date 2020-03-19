import { ref } from "@vue/composition-api";
import axios from "axios";
import { controlBackend } from "../../config";
import { PluginService } from "../types/services";
import { useDatabaseController } from "../databaseController";

export function usePluginService(): PluginService {
  const plugins = ref<string[]>([]);
  const activePlugins = ref<string[]>([]);
  const pluginLogs = ref<any>({});
  const pluginSettings = ref<any>({});

  getPlugins();
  setInterval(() => getPluginLogs(), 1000);
  getPluginSettings();

  function getPlugins(): void {
    axios.get(controlBackend + "available_plugins").then(allPluginsResponse => {
      plugins.value = allPluginsResponse.data;
      axios.get(controlBackend + "plugin").then(activePluginsResponse => {
        activePlugins.value = activePluginsResponse.data.reduce(
          (result: string[], currentDatabase: any) => {
            return currentDatabase.plugins
              ? [
                  ...result,
                  ...currentDatabase.plugins.map(
                    (plugin: string) =>
                      currentDatabase.id + "_" + plugin.replace("Plugin", "")
                  )
                ]
              : result;
          },
          []
        );
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
        .then(response => {
          getPlugins();
        });
    } else {
      return axios
        .delete(controlBackend + "plugin", {
          data: { id: databaseId, plugin: plugin }
        })
        .then(response => {
          getPlugins();
        });
    }
  }

  function getPluginLogs(): Promise<void> {
    return axios.get(controlBackend + "plugin_log").then(response => {
      pluginLogs.value = response.data.reduce(
        (result: any, currentDatabase: any) => {
          result[currentDatabase.id] = currentDatabase.plugin_log.reduce(
            (databaseLog: string, currentLog: any) => {
              return (
                databaseLog +
                `${currentLog.reporter} [${new Date(
                  parseInt(currentLog.timestamp)
                ).toLocaleTimeString()}]: ${currentLog.message}\n`
              );
            },
            ""
          );
          return result;
        },
        {}
      );
    });
  }

  function getPluginSettings(): Promise<void> {
    axios.get(controlBackend + "plugin_settings", {params: {id: "citadelle"}}).then(response => {
      console.log(response);
    })
  }

  return {
    plugins,
    activePlugins,
    updatePlugins,
    pluginLogs
  };
}
