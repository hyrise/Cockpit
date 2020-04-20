import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import {
  getGetAlias,
  getPostAlias,
  getDeleteAlias,
  generateRandomInt,
} from "../../setup/helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import {
  getSelector,
  assertActivePlugins,
  getChangeSettingsSelector,
  assertRequestValues,
  assertSettingsRequestValues,
} from "./helpers";

let backend = useBackendMock({ plugins: 3 });

let databases: any = [];
let availablePlugins: any = [];
let databasesActivePlugins: any = [];
let databasesPluginLogs: any = [];
let databasesPluginSettings: any = [];

// test plugins overview
describe("When opening the plugins overview", () => {
  beforeEach(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
      cy.setupData("available_plugins").then((xhr: any) => {
        availablePlugins = xhr.response.body;
        cy.setupData("plugin").then((xhr: any) => {
          databasesActivePlugins = xhr.response.body;
          cy.setupData("plugin_log").then((xhr: any) => {
            databasesPluginLogs = xhr.response.body;
            cy.setupData("plugin_settings").then((xhr: any) => {
              databasesPluginSettings = xhr.response.body.body.plugin_settings;
            });
          });
        });
      });
    });
  });

  // test activate plugin
  describe("and activate a new plugin", () => {
    it("will show this plugin as activated", () => {
      clickElement(getViewSelector("pluginOverviewButton"));

      cy.get(getSelector("pluginOverview")).within(() => {
        databases.forEach((database: any, idx: number) => {
          const deactivePlugins = availablePlugins.reduce(
            (deactivePlugins: Object[], plugin: any, idx: number) => {
              const pluginData = databasesActivePlugins.find(
                (db: any) => db.id === database.id
              );
              if (!pluginData.plugins.includes(plugin)) {
                deactivePlugins.push({ plugin: plugin, idx: idx });
              }
              return deactivePlugins;
            },
            []
          );

          backend.reload("plugin", deactivePlugins[0].plugin, "POST");

          cy.get("button")
            .eq(idx + 1)
            .click();
          cy.get("input[type=checkbox]")
            .eq(deactivePlugins[0].idx)
            .check({ force: true });

          cy.wait("@" + getPostAlias("plugin"));
          cy.get("@" + getPostAlias("plugin")).should((xhr: any) => {
            assertRequestValues(
              database.id,
              deactivePlugins[0].plugin,
              xhr.request.body
            );
          });
          cy.numberOfRequests(getPostAlias("plugin")).should("eq", 1);
          cy.wait("@" + getGetAlias("plugin"));
          cy.get("@" + getGetAlias("plugin")).should((xhr: any) => {
            databasesActivePlugins = xhr.response.body;
            assertActivePlugins(
              database.id,
              availablePlugins,
              databasesActivePlugins
            );
          });
          cy.get("button")
            .eq(idx + 1)
            .click();
          backend.reload("plugin", deactivePlugins[0].plugin, "DELETE");
        });
      });
    });
  });

  // test deactivate plugin
  describe("and deactivate a new plugin", () => {
    it("will show this plugin as deactivated", () => {
      clickElement(getViewSelector("pluginOverviewButton"));

      cy.get(getSelector("pluginOverview")).within(() => {
        databases.forEach((database: any, idx: number) => {
          const activePlugins = availablePlugins.reduce(
            (activePlugins: Object[], plugin: any, idx: number) => {
              const pluginData = databasesActivePlugins.find(
                (db: any) => db.id === database.id
              );
              if (pluginData.plugins.includes(plugin)) {
                activePlugins.push({ plugin: plugin, idx: idx });
              }
              return activePlugins;
            },
            []
          );

          backend.reload("plugin", activePlugins[0].plugin, "DELETE");

          cy.get("button")
            .eq(idx + 1)
            .click();
          cy.get("input[type=checkbox]")
            .eq(activePlugins[0].idx)
            .uncheck({ force: true });

          cy.wait("@" + getDeleteAlias("plugin"));
          cy.get("@" + getDeleteAlias("plugin")).should((xhr: any) => {
            assertRequestValues(
              database.id,
              activePlugins[0].plugin,
              xhr.request.body
            );
          });
          cy.numberOfRequests(getDeleteAlias("plugin")).should("eq", 1);
          cy.wait("@" + getGetAlias("plugin"));
          cy.get("@" + getGetAlias("plugin")).should((xhr: any) => {
            databasesActivePlugins = xhr.response.body;
            assertActivePlugins(
              database.id,
              availablePlugins,
              databasesActivePlugins
            );
          });
          cy.get("button")
            .eq(idx + 1)
            .click();
          backend.reload("plugin", activePlugins[0].plugin, "POST");
        });
      });
    });
  });

  // test change plugin setting
  describe("and change settings of a active plugin", () => {
    it("will change the settings value", () => {
      clickElement(getViewSelector("pluginOverviewButton"));

      cy.get(getSelector("pluginOverview")).within(() => {
        databases.forEach((database: any, idx: number) => {
          const newValue = generateRandomInt(0, 1000);
          const activePlugins = availablePlugins.reduce(
            (activePlugins: Object[], plugin: any, idx: number) => {
              const pluginData = databasesActivePlugins.find(
                (db: any) => db.id === database.id
              );
              const settingsData = databasesPluginSettings.find(
                (db: any) => db.id === database.id
              );
              const pluginSetting = settingsData.plugin_settings.find(
                (setting: any) => setting.name.includes(plugin)
              );
              if (pluginData.plugins.includes(plugin)) {
                activePlugins.push({
                  plugin: plugin,
                  idx: idx,
                  name: pluginSetting.name,
                });
              }
              return activePlugins;
            },
            []
          );
          cy.get("button")
            .eq(idx + 1)
            .click();
          cy.get(getChangeSettingsSelector(activePlugins[0].plugin)).click();
          cy.get(getSelector("settingValue")).clear().type(newValue.toString());
          cy.get(getSelector("saveSettingsButton")).click();
          cy.wait("@" + getPostAlias("plugin_settings"));
          cy.get("@" + getPostAlias("plugin_settings")).should((xhr: any) => {
            assertSettingsRequestValues(
              database.id,
              activePlugins[0].name,
              newValue.toString(),
              xhr.request.body
            );
          });
          cy.numberOfRequests(getPostAlias("plugin_settings")).should("eq", 1);
        });
      });
    });
  });
});
