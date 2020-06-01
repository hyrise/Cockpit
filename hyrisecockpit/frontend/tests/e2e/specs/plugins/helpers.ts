import { getSelectorByConfig, formatDateToHHMMSS } from "../helpers";

const selectors: Record<string, string> = {
  pluginOverview: getSelectorByConfig("div", "plugin-overview"),
  pluginLog: getSelectorByConfig("div", "plugin-log"),
  settingName: getSelectorByConfig("div", "setting-name"),
  settingValue: getSelectorByConfig("input", "setting-value"),
  settingDescription: getSelectorByConfig("span", "setting-description"),
  settingHelpIcon: getSelectorByConfig("button", "setting-help-icon"),
  saveSettingsButton: getSelectorByConfig("button", "setting-save"),
};

export function getSelector(component: string): string {
  return selectors[component];
}

const pluginButtons: Record<string, { element: string; suffix: string }> = {
  changeButton: { element: "button", suffix: "-change-button" },
  switchButton: { element: "input", suffix: "-switch-button" },
};

export function getPluginSelector(plugin: string, button: string): string {
  return getSelectorByConfig(
    pluginButtons[button].element,
    `${plugin}${pluginButtons[button].suffix}`
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
    cy.get(getPluginSelector(plugin, "switchButton")).then((checkbox: any) => {
      expect(checkbox[0].checked).to.eq(
        !!databaseActivePluginData.plugins.find(
          (pluginActive: any) => pluginActive.name === plugin
        )
      );
    });
  });
}

export function assertPlugins(availablePlugins: any[]): void {
  availablePlugins.forEach((plugin: any) => {
    cy.contains(plugin);
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
    expect(content.includes(plugin.reporter)).to.eq(true);
    expect(content.includes(plugin.message)).to.eq(true);
    expect(
      content.includes(
        formatDateToHHMMSS(new Date(plugin.timestamp)).toString()
      )
    ).to.eq(true);
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
      cy.get(getSelector("settingName")).within(() => {
        cy.contains(setting.name);
      });
      cy.get(getSelector("settingValue"))
        .eq(idx)
        .then((value: any) => {
          expect(setting.value.toString()).to.eq(value[0].value);
        });
      cy.get(getSelector("settingHelpIcon")).eq(idx).click({ force: true });
      cy.get(getSelector("settingDescription"))
        .eq(idx)
        .parents()
        .contains(setting.description);
    });
  });
}

export function assertRequestValues(
  database: string,
  plugin: string,
  requestData: any
): void {
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
