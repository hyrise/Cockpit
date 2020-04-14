import { getSelectorByConfig, formatDateToHHMMSS } from "../helpers";

const selectors: Record<string, string> = {
  pluginOverview: getSelectorByConfig("div", "plugin-overview"),
  settingName: getSelectorByConfig("div", "setting-name"),
  settingValue: getSelectorByConfig("input", "setting-value"),
  settingDescription: getSelectorByConfig("span", "setting-description"),
  settingHelpIcon: getSelectorByConfig("button", "setting-help-icon"),
  saveSettingsButton: getSelectorByConfig("button", "setting-save")
};

export function getSelector(component: string): string {
  return selectors[component];
}

export function getChangeSettingsSelector(plugin: string): string {
  return getSelectorByConfig("button", `${plugin}-change-button`);
}

export function assertActivePlugins(
  database: string,
  availablePlugins: any[],
  activePluginData: any[]
): void {
  const databaseActivePluginData = activePluginData.find(
    (data: any) => data.id === database
  );

  availablePlugins.forEach((plugin: any, idx: number) => {
    cy.get("input[type=checkbox]")
      .eq(idx)
      .then((checkbox: any) => {
        expect(checkbox[0].checked).to.eq(
          databaseActivePluginData.plugins.includes(plugin)
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
  pluginSettings: any[]
): void {
  const databasePluginSetings = pluginSettings.find(
    (data: any) => data.id === database
  );
  databasePluginSetings.plugin_settings.forEach((plugin: any) => {
    cy.get(getSelector("settingName")).within(() => {
      cy.contains(getPluginName(plugin.name));
    });
    cy.get(getSelector("settingValue")).then((value: any) => {
      expect(plugin.value.toString()).to.eq(value[0].value);
    });
    cy.get(getSelector("settingHelpIcon")).click({ force: true });
    cy.get(getSelector("settingDescription"))
      .parents()
      .contains(plugin.description);
  });
}

function getPluginName(pluginName: string): string {
  return pluginName.substr(pluginName.indexOf("_") + 1);
}

export function assertRequestValues(
  database: string,
  plugin: string,
  requestData: any
): void {
  expect(requestData.id).to.eq(database);
  expect(requestData.plugin).to.eq(plugin);
}

export function assertSettingsRequestValues(
  database: string,
  plugin: string,
  value: string,
  requestData: any
): void {
  expect(requestData.id).to.eq(database);
  expect(requestData.name).to.eq(plugin);
  expect(requestData.value).to.eq(value);
}
