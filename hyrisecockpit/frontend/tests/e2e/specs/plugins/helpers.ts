import { formatDateToHHMMSS, getSelectorByCustomConfig } from "../helpers";

export const selectors = {
  pluginEntry: getSelectorByCustomConfig("plugin-entry"),
  pluginOverview: getSelectorByCustomConfig("plugin-overview"),
  pluginLog: getSelectorByCustomConfig("plugin-log"),
  pluginLogArea: getSelectorByCustomConfig("plugin-log-area"),
  databaseHeader: getSelectorByCustomConfig("plugin-database-header"),
  settingName: getSelectorByCustomConfig("setting-name"),
  settingValue: getSelectorByCustomConfig("setting-value"),
  settingDescription: getSelectorByCustomConfig("setting-description"),
  settingHelpIcon: getSelectorByCustomConfig("setting-help-icon"),
  saveSettingsButton: getSelectorByCustomConfig("setting-save"),
  changeButton: "-change-button",
  switchButton: "-switch-button",
};

export function pluginButton(
  plugin: string,
  button: "changeButton" | "switchButton"
): string {
  return getSelectorByCustomConfig(`${plugin}${selectors[button]}`);
}

/** Get all plugins that are active or deactive */
export function getPluginsByState(
  {
    availablePlugins,
    databases,
    databasesActivePluginData,
  }: {
    availablePlugins: any[];
    databases: any[];
    databasesActivePluginData: any[];
  },
  state: "active" | "deactive",
  withIdx = false
): any[] {
  return availablePlugins.reduce(
    (plugins: Object[], plugin: any, idx: number) => {
      const pluginData = databasesActivePluginData.find(
        (db: any) => db.id === databases[0].id
      );
      const relatedPlugin = pluginData.plugins.find(
        (active: any) => active.name === plugin
      );
      if (state === "active" ? !!relatedPlugin : !relatedPlugin) {
        if (withIdx) {
          plugins.push({
            plugin: plugin,
            idx: idx,
          });
        } else {
          plugins.push(plugin);
        }
      }
      return plugins;
    },
    []
  );
}

export function assertActivePlugins(
  database: string,
  availablePlugins: any[],
  activePluginData: any[]
): void {
  const databaseActivePluginData = activePluginData.find(
    (data: any) => data.id === database
  );

  availablePlugins.forEach((plugin: any) => {
    cy.get(pluginButton(plugin, "switchButton")).should(
      !!databaseActivePluginData.plugins.find(
        (pluginActive: any) => pluginActive.name === plugin
      )
        ? "be.checked"
        : "not.be.checked"
    );
  });
}

export function assertPluginExistence(availablePlugins: any[]): void {
  cy.get(selectors.pluginEntry).then((values: any) => {
    availablePlugins.forEach((plugin: any) => {
      expect(values).to.contain(plugin);
    });
  });
}

export function assertPluginLog(
  database: string,
  pluginLogs: any[],
  content: string
): void {
  const databasePluginLog = pluginLogs.find(
    (data: any) => data.id === database
  );
  databasePluginLog.plugin_log.forEach((plugin: any) => {
    expect(content).to.includes(plugin.reporter);
    expect(content).to.includes(plugin.message);
    expect(content).to.includes(
      formatDateToHHMMSS(new Date(plugin.timestamp)).toString()
    );
  });
}

export function assertPluginSettings(
  database: string,
  pluginSettings: any[],
  idx: number
): void {
  const databasePluginSetings = pluginSettings.find(
    (data: any) => data.id === database
  );
  databasePluginSetings.plugins.forEach((plugin: any) => {
    plugin.settings.forEach((setting: any) => {
      cy.get(selectors.settingName).within(() => {
        cy.contains(setting.name);
      });
      cy.get(selectors.settingValue)
        .eq(idx)
        .then((value: any) => {
          expect(setting.value.toString()).to.eq(value[0].value);
        });
      cy.get(selectors.settingHelpIcon).eq(idx).click({ force: true });
      cy.get(selectors.settingDescription)
        .eq(idx)
        .parents()
        .contains(setting.description);
    });
  });
}

export function assertRequestValues(plugin: string, requestData: any): void {
  expect(requestData.name).to.eq(plugin);
}

export function assertSettingsRequestValues(
  plugin: string,
  pluginSettingName: string,
  value: string,
  requestData: any
): void {
  expect(requestData.name).to.eq(plugin);
  expect(requestData.setting.name).to.eq(pluginSettingName);
  expect(requestData.setting.value).to.eq(value);
}
