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
      .get(controlBackend + "plugin/available")
      .then((allPluginsResponse) => {
        availablePlugins = allPluginsResponse.data.map(
          (plugin: any) => plugin.name
        );
      });
    return availablePlugins;
  }

  async function fetchActivePlugins(): Promise<Object> {
    const plugins: any = { data: [], settings: [] };
    await axios.get(controlBackend + "plugin").then((response) => {
      plugins.data = getActivePluginData(response.data);
      plugins.settings = getPluginSettingsData(response.data);
    });

    return plugins;
  }

  async function fetchPluginLogs(): Promise<Object> {
    const pluginMeta: any = { logs: {}, events: {} };
    await axios.get(controlBackend + "plugin/log").then((response) => {
      pluginMeta.logs = getPluginLogsData(response.data);
      pluginMeta.events = getPluginEventData(response.data);
    });
    return pluginMeta;
  }

  /* update plugin data */

  function togglePlugin(
    databaseId: string,
    plugin: string,
    isActivated: boolean
  ): Promise<void> {
    if (isActivated)
      return axios.post(controlBackend + `plugin/${databaseId}`, {
        name: plugin,
      });

    return axios.delete(controlBackend + `plugin/${databaseId}`, {
      data: { name: plugin },
    });
  }

  function setPluginSetting(
    databaseId: string,
    pluginId: string,
    settingId: string,
    settingValue: string
  ): Promise<void> {
    return axios.put(controlBackend + `plugin/${databaseId}`, {
      name: pluginId,
      setting: {
        name: settingId,
        value: settingValue,
      },
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
              (plugin: any) => currentDatabase.id + "_" + plugin.name
            ),
          ]
        : result;
    }, []);
  }

  function getPluginLogsData(data: any): any {
    return data.reduce((result: any, currentDatabase: any) => {
      result[currentDatabase.id] = currentDatabase.log.reduce(
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
      const currentDatabaseSettings =
        currentDatabase.plugins &&
        currentDatabase.plugins.reduce(
          (databaseSettings: any, currentPlugin: any) => {
            databaseSettings[currentPlugin.name] = currentPlugin.settings;
            return databaseSettings;
          },
          {}
        );
      result[currentDatabase.id] = currentDatabaseSettings;
      return result;
    }, {});
  }

  function producePluginLogString(currentLog: any) {
    return `${currentLog.reporter} [${formatDateToHHMMSS(
      new Date(parseInt(currentLog.timestamp))
    )}]: `;
  }

  function getPluginEventData(data: any): any {
    const relevantTime = subSeconds(
      new Date(),
      Vue.prototype.$selectionController.selectedRange.value +
        Vue.prototype.$selectionController.selectedPrecision.value
    );
    return data.reduce((result: any, currentDatabase: any) => {
      result[currentDatabase.id] = currentDatabase.log.reduce(
        (databaseEvents: any, currentLog: any) => {
          if (currentLog.timestamp > relevantTime) {
            return {
              timestamps: [
                ...databaseEvents.timestamps,
                new Date(parseInt(currentLog.timestamp)),
              ],
              events: [
                ...databaseEvents.events,
                { ...currentLog, header: producePluginLogString(currentLog) },
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
    setPluginSetting,
    togglePlugin,
  };
}
