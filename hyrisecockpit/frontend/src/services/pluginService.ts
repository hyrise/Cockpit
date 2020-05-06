import axios from "axios";
import { controlBackend } from "../../config";
import { PluginService } from "../types/services";
import { useFormatting } from "@/meta/formatting";
import Vue from "vue";

export function usePluginService(): PluginService {
  /* fetch plugin data */

  async function fetchAvailablePlugins(): Promise<string[]> {
    let availablePlugins: any = [];
    await axios
      .get(controlBackend + "available_plugins")
      .then((allPluginsResponse) => {
        availablePlugins = allPluginsResponse.data;
      });
    return availablePlugins;
  }

  async function fetchActivePlugins(): Promise<string[]> {
    let activePlugins: any = [];
    await axios.get(controlBackend + "plugin").then((activePluginsResponse) => {
      activePlugins = getActivePluginData(activePluginsResponse.data);
    });

    return activePlugins;
  }

  async function fetchPluginLogs(): Promise<Object> {
    let pluginMeta: any = { logs: {}, events: {} };
    await axios.get(controlBackend + "plugin_log").then((response) => {
      pluginMeta.logs = getPluginLogsData(response.data);
      pluginMeta.events = getPluginEventData(response.data);
    });
    return pluginMeta;
  }

  async function fetchPluginSettings(): Promise<Object> {
    let pluginSettings: any = {};
    await axios.get(controlBackend + "plugin_settings").then((response) => {
      pluginSettings = getPluginSettingsData(
        response.data.body.plugin_settings
      );
    });
    return pluginSettings;
  }

  /* update plugin data */

  function togglePlugin(
    databaseId: string,
    plugin: string,
    isActivated: boolean
  ): Promise<void> {
    if (isActivated)
      return axios.post(controlBackend + "plugin", { id: databaseId, plugin });

    return axios.delete(controlBackend + "plugin", {
      data: { id: databaseId, plugin },
    });
  }

  function setPluginSetting(
    databaseId: string,
    settingId: string,
    settingValue: string
  ): Promise<void> {
    return axios.post(controlBackend + "plugin_settings", {
      id: databaseId,
      name: settingId,
      value: settingValue,
    });
  }

  /* transform plugin data */
  const { formatDateToHHMMSS, subSeconds, trimString } = useFormatting();

  function getActivePluginData(data: any): any {
    return data.reduce((result: string[], currentDatabase: any) => {
      return currentDatabase.plugins
        ? [
            ...result,
            ...currentDatabase.plugins.map(
              (plugin: string) =>
                currentDatabase.id + "_" + plugin.replace("Plugin", "")
            ),
          ]
        : result;
    }, []);
  }

  function getPluginLogsData(data: any): any {
    return data.reduce((result: any, currentDatabase: any) => {
      result[currentDatabase.id] = currentDatabase.plugin_log.reduce(
        (databaseLog: string, currentLog: any) => {
          return (
            databaseLog +
            `${currentLog.reporter} [${formatDateToHHMMSS(
              new Date(parseInt(currentLog.timestamp))
            )}]: ${currentLog.message}\n`
          );
        },
        ""
      );
      return result;
    }, {});
  }

  function getPluginSettingsData(data: any): any {
    return data.reduce((result: any, currentDatabase: any) => {
      const allDatabaseSettings =
        currentDatabase.plugin_settings &&
        currentDatabase.plugin_settings.reduce(
          (allSettings: any, currentSetting: any) => {
            const pluginName = currentSetting.name.substring(
              0,
              currentSetting.name.indexOf("Plugin")
            );
            allSettings[pluginName]
              ? (allSettings[pluginName] = [
                  ...allSettings[pluginName],
                  currentSetting,
                ])
              : (allSettings[pluginName] = [currentSetting]);
            return allSettings;
          },
          {}
        );
      result[currentDatabase.id] = allDatabaseSettings;
      return result;
    }, {});
  }

  function producePluginLogString(currentLog: any) {
    return `${currentLog.reporter} [${formatDateToHHMMSS(
      new Date(parseInt(currentLog.timestamp))
    )}]: ${currentLog.message}`;
  }

  function getPluginEventData(data: any): any {
    const relevantTime = subSeconds(
      new Date(),
      Vue.prototype.$selectionController.selectedRange.value +
        Vue.prototype.$selectionController.selectedPrecision.value
    );
    return data.reduce((result: any, currentDatabase: any) => {
      result[currentDatabase.id] = currentDatabase.plugin_log.reduce(
        (databaseEvents: any, currentLog: any) => {
          if (currentLog.timestamp > relevantTime) {
            return {
              timestamps: [
                ...databaseEvents.timestamps,
                new Date(parseInt(currentLog.timestamp)),
              ],
              events: [
                ...databaseEvents.events,
                trimString(producePluginLogString(currentLog), 50),
              ],
            };
          } else {
            return databaseEvents;
          }
        },
        { timestamps: [], events: [] }
      );
      return result;
    }, {});
  }

  return {
    fetchActivePlugins,
    fetchAvailablePlugins,
    fetchPluginLogs,
    fetchPluginSettings,
    setPluginSetting,
    togglePlugin,
  };
}
