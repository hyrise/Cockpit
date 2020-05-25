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
  getPluginSelector,
  assertRequestValues,
  assertSettingsRequestValues,
} from "./helpers";
import { getSelector as getDatabaseSelector } from "../databases/helpers";

let backend = useBackendMock({ plugins: 3 });

let databases: any = [];
let availablePlugins: any = [];
let databasesActivePluginData: any = [];

// test plugins overview
describe("When opening the plugins overview", () => {
  beforeEach(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
      cy.setupData("available_plugins").then((xhr: any) => {
        availablePlugins = xhr.response.body.map((plugin: any) => plugin.name);
        cy.setupData("plugin").then((xhr: any) => {
          databasesActivePluginData = xhr.response.body;
        });
      });
    });
  });

  // test activate plugin
  describe("and activate a new plugin", () => {
    it("will show this plugin as activated", () => {
      const deactivePlugin = availablePlugins.reduce(
        (deactivePlugins: Object[], plugin: any, idx: number) => {
          const pluginData = databasesActivePluginData.find(
            (db: any) => db.id === databases[0].id
          );
          if (
            !pluginData.plugins.find((active: any) => active.name === plugin)
          ) {
            deactivePlugins.push(plugin);
          }
          return deactivePlugins;
        },
        []
      )[0];
      console.log(deactivePlugin);
      databases.forEach((database: any, idx: number) => {
        clickElement(getViewSelector("pluginOverviewButton"));
        cy.get(getSelector("pluginOverview")).within(() => {
          // update tmp state
          cy.updateAppState(backend, {
            request: "plugin",
            id: deactivePlugin,
            method: "POST",
          });

          cy.get(getDatabaseSelector("databaseChip"))
            .eq(idx)
            .click({ force: true });
          cy.get(getPluginSelector(deactivePlugin, "switchButton")).check({
            force: true,
          });

          cy.wait("@" + getPostAlias("plugin"));
          cy.get("@" + getPostAlias("plugin")).should((xhr: any) => {
            assertRequestValues(database.id, deactivePlugin, xhr.request.body);
          });
          cy.numberOfRequests(getPostAlias("plugin")).should("eq", idx + 1);
          cy.wait("@" + getGetAlias("plugin"));
          cy.get("@" + getGetAlias("plugin")).should((xhr: any) => {
            console.log(database.id, availablePlugins, xhr.response.body);
            assertActivePlugins(
              database.id,
              availablePlugins,
              xhr.response.body
            );
          });
          cy.get(getDatabaseSelector("databaseChip"))
            .eq(idx)
            .click({ force: true });

          // clean tmp state
          cy.cleanAppState(backend, {
            request: "plugin",
            id: deactivePlugin,
            method: "DELETE",
          });
        });
        cy.reload();
        cy.wait("@" + getGetAlias("plugin"));
      });
    });
  });

  // test deactivate plugin
  describe("and deactivate a new plugin", () => {
    it("will show this plugin as deactivated", () => {
      const activePlugin = availablePlugins.reduce(
        (activePlugins: Object[], plugin: any, idx: number) => {
          const pluginData = databasesActivePluginData.find(
            (db: any) => db.id === databases[0].id
          );
          if (
            !!pluginData.plugins.find((active: any) => active.name === plugin)
          ) {
            activePlugins.push(plugin);
          }
          return activePlugins;
        },
        []
      )[0];
      databases.forEach((database: any, idx: number) => {
        clickElement(getViewSelector("pluginOverviewButton"));
        cy.get(getSelector("pluginOverview")).within(() => {
          // update tmp state
          cy.updateAppState(backend, {
            request: "plugin",
            id: activePlugin,
            method: "DELETE",
          });

          cy.get(getDatabaseSelector("databaseChip"))
            .eq(idx)
            .click({ force: true });

          cy.get(getPluginSelector(activePlugin, "switchButton")).uncheck({
            force: true,
          });

          cy.wait("@" + getDeleteAlias("plugin"));
          cy.get("@" + getDeleteAlias("plugin")).should((xhr: any) => {
            assertRequestValues(database.id, activePlugin, xhr.request.body);
          });
          cy.numberOfRequests(getDeleteAlias("plugin")).should("eq", idx + 1);
          cy.wait("@" + getGetAlias("plugin"));
          cy.get("@" + getGetAlias("plugin")).should((xhr: any) => {
            assertActivePlugins(
              database.id,
              availablePlugins,
              xhr.response.body
            );
          });
          cy.get(getDatabaseSelector("databaseChip"))
            .eq(idx)
            .click({ force: true });

          // clean tmp state
          cy.cleanAppState(backend, {
            request: "plugin",
            id: activePlugin,
            method: "POST",
          });
        });
        cy.reload();
        cy.wait("@" + getGetAlias("plugin"));
      });
    });
  });

  // test change plugin setting
  describe("and change settings of a active plugin", () => {
    it("will change the settings value", () => {
      const newValue = generateRandomInt(0, 1000);

      databases.forEach((database: any, idx: number) => {
        const activePlugin = availablePlugins.reduce(
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
                name: pluginSetting.name,
              });
            }
            return activePlugins;
          },
          []
        )[0];
        clickElement(getViewSelector("pluginOverviewButton"));
        cy.get(getSelector("pluginOverview")).within(() => {
          cy.get(getDatabaseSelector("databaseChip"))
            .eq(idx)
            .click({ force: true });

          cy.get(
            getPluginSelector(activePlugin.plugin, "changeButton")
          ).click();
          cy.wait(300);
          cy.get(getSelector("settingValue")).clear().type(newValue.toString());
          cy.get(getSelector("saveSettingsButton")).click();
          cy.wait("@" + getPostAlias("plugin_settings"));
          cy.get("@" + getPostAlias("plugin_settings")).should((xhr: any) => {
            assertSettingsRequestValues(
              database.id,
              activePlugin.name,
              newValue.toString(),
              xhr.request.body
            );
          });
          cy.numberOfRequests(getPostAlias("plugin_settings")).should(
            "eq",
            idx + 1
          );
          cy.get(getDatabaseSelector("databaseChip"))
            .eq(idx)
            .click({ force: true });
        });
        cy.reload();
      });
    });
  });
});
