import { ref } from "@vue/composition-api";
import { eventBus } from "../plugins/eventBus";
import { usePluginService } from "@/services/pluginService";
import { PluginController } from "@/types/controller";

export function usePluginController(): PluginController {
  const pluginService = usePluginService();

  /* stored data */

  const availablePlugins = ref<string[]>([]);
  const activePlugins = ref<string[]>([]);

  const pluginLogs = ref<any>({});
  const pluginSettings = ref<any>({});
  const pluginEventData = ref<any>({});

  updatePluginData();
  //setInterval(() => updatePluginLogs(), 1000);

  eventBus.$on(["DATABASE_ADDED", "DATABASE_REMOVED"], () => {
    updatePluginData();
  });

  /* update plugin data */

  function updatePluginData(): void {
    pluginService.fetchAvailablePlugins().then((availablePluginsData) => {
      availablePlugins.value = availablePluginsData;
      pluginService.fetchActivePlugins().then((activePluginsData) => {
        activePlugins.value = activePluginsData;
      });
    });
    pluginService.fetchPluginSettings().then((settingsData) => {
      pluginSettings.value = settingsData;
    });
  }

  function updatePluginLogs(): void {
    pluginService.fetchPluginLogs().then((data: any) => {
      pluginLogs.value = data.logs;
      pluginEventData.value = data.events;
    });
  }

  /* change plugin data */

  async function changePlugin(database: string, plugin: string): Promise<void> {
    return pluginService
      .togglePlugin(database, plugin, isActivated(database, plugin))
      .then(() => {
        updatePluginData();
      });
  }

  async function changePluginSetting(
    database: string,
    settingId: string,
    settingValue: string
  ): Promise<void> {
    return pluginService
      .setPluginSetting(database, settingId, settingValue)
      .then(() => {
        updatePluginData();
      });
  }

  /* helpers */

  function isActivated(database: string, plugin: string): boolean {
    return !!activePlugins.value.find(
      (pluginId: string) => pluginId === database + "_" + plugin
    );
  }

  return {
    availablePlugins,
    activePlugins,
    pluginLogs,
    pluginSettings,
    pluginEventData,
    changePlugin,
    changePluginSetting,
    isActivated,
  };
}
