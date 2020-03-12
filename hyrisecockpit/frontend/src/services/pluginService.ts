import { ref } from "@vue/composition-api";
import axios from "axios";
import { controlBackend } from "../../config";
import { PluginService } from "../types/services";

export function usePluginService(): PluginService {
  const plugins = ref<string[]>([]);
  const activePlugins = ref<string[]>([]);

  getPlugins();

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
                      currentDatabase.id + "_" + plugin[0].replace("Plugin", "")
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

  return {
    plugins,
    activePlugins,
    updatePlugins
  };
}
