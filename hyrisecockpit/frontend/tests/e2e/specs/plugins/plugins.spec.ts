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

// test plugins overview
describe("When opening the plugins overview", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
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
  it("will show the correct number of databases", () => {
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

  // test correct plugins
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
    clickElement(getViewSelector("pluginOverviewButton"));
    testElementNoExistence(getSelector("pluginOverview"));
  });

  // test correct plugin log messages
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
    clickElement(getViewSelector("pluginOverviewButton"));
    testElementNoExistence(getSelector("pluginOverview"));
  });

  // test correct plugin settings
  it("will show the correct plugin settings for every active plugin and database", () => {
    cy.setupAppState(backend); // need this for properly open change settings button
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
