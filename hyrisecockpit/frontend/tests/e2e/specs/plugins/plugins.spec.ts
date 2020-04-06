import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getGetAlias } from "../../setup/helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import { getSelector as getDatabaseSelector } from "../databases/helpers";
import {
  getSelector,
  assertCorrectActivePlugins,
  assertCorrectPlugins,
  assertCorrectPluginLog,
  assertCorrectPluginSettings,
  getChangeSettingsSelector
} from "./helpers";
import { testElementNoExistence } from "../abstractTests";

let backend = useBackendMock();

let databases: any = [];
let availablePlugins: any = [];
let databasesActivePlugins: any = [];
let databasesPluginLogs: any = [];
let databasesPluginSettings: any = [];

describe("When observing the plugins overview", () => {
  beforeEach(() => {
    backend.start();
    cy.visit("/");
    cy.wait("@" + getGetAlias("database"));
    cy.get("@" + getGetAlias("database")).should((xhr: any) => {
      databases = xhr.response.body;
    });
    cy.wait("@" + getGetAlias("available_plugins"));
    cy.get("@" + getGetAlias("available_plugins")).should((xhr: any) => {
      availablePlugins = xhr.response.body;
    });
    cy.wait("@" + getGetAlias("plugin"));
    cy.get("@" + getGetAlias("plugin")).should((xhr: any) => {
      databasesActivePlugins = xhr.response.body;
    });
    cy.wait("@" + getGetAlias("plugin_log"));
    cy.get("@" + getGetAlias("plugin_log")).should((xhr: any) => {
      databasesPluginLogs = xhr.response.body;
    });
    cy.wait("@" + getGetAlias("plugin_settings"));
    cy.get("@" + getGetAlias("plugin_settings")).should((xhr: any) => {
      databasesPluginSettings = xhr.response.body.body.plugin_settings;
    });
  });

  // test correct number of databases
  describe("and just opening and closing the plugin overview", () => {
    it("will show the correct number of databases and clos overview", () => {
      clickElement(getViewSelector("pluginOverviewButton"));
      cy.get(getSelector("pluginOverview")).within(() => {
        databases.forEach((database: any, idx: number) => {
          cy.get(getDatabaseSelector("databaseChip"))
            .eq(idx)
            .contains(database.id);
        });
      });
      clickElement(getViewSelector("pluginOverviewButton"));
      testElementNoExistence(getSelector("pluginOverview"));
    });
  });
  // test correct plugins
  describe("and just opening the plugin overview", () => {
    it("will show the correct plugins for every database", () => {
      clickElement(getViewSelector("pluginOverviewButton"));
      cy.get(getSelector("pluginOverview")).within(() => {
        databases.forEach((database: any, idx: number) => {
          cy.get("button")
            .eq(idx + 1)
            .click();
          assertCorrectPlugins(availablePlugins);
          assertCorrectActivePlugins(
            database.id,
            availablePlugins,
            databasesActivePlugins
          );
        });
      });
    });
  });
  // test correct plugin log messages
  describe("and just opening the plugin overview", () => {
    it("will show the correct plugin logs for every database", () => {
      clickElement(getViewSelector("pluginOverviewButton"));
      cy.get(getSelector("pluginOverview")).within(() => {
        databases.forEach((database: any, idx: number) => {
          cy.get("button")
            .eq(idx + 1)
            .click();
          cy.get("button")
            .contains("Plugin log messages")
            .click();
          cy.get("textarea").then((textarea: any) => {
            assertCorrectPluginLog(
              database.id,
              databasesPluginLogs,
              textarea[0].value
            );
          });
          cy.get("button")
            .eq(idx + 1)
            .click();
        });
      });
    });
  });
  // test correct plugin settings
  describe("and just opening the plugin overview", () => {
    it("will show the correct plugin settings for every active plugin and database", () => {
      clickElement(getViewSelector("pluginOverviewButton"));
      cy.get(getSelector("pluginOverview")).within(() => {
        databases.forEach((database: any, idx: number) => {
          const activePlugins = availablePlugins.reduce(
            (activePlugins: Object[], plugin: any, idx: number) => {
              const pluginData = databasesActivePlugins.find(
                (db: any) => db.id === database.id
              );
              if (pluginData.plugins.includes(plugin)) {
                activePlugins.push({
                  plugin: plugin,
                  idx: idx
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

          assertCorrectPluginSettings(database.id, databasesPluginSettings);

          cy.get("button")
            .eq(idx + 1)
            .click();
        });
      });
    });
  });
});
