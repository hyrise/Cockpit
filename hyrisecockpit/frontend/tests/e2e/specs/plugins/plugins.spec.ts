import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import { getSelector as getDatabaseSelector } from "../databases/helpers";
import {
  getSelector,
  assertActivePlugins,
  assertPlugins,
  assertPluginLog,
  assertPluginSettings,
  getPluginSelector,
} from "./helpers";
import { testElementNoExistence } from "../abstractTests";

let backend = useBackendMock();

let databases: any = [];
let availablePlugins: any = [];
let databasesActivePluginData: any = [];
let databasesPluginLogs: any = [];
// test plugins overview
describe("When opening the plugins overview", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
      cy.setupData("available_plugins").then((xhr: any) => {
        availablePlugins = xhr.response.body.map((plugin: any) => plugin.name);
        cy.setupData("plugin").then((xhr: any) => {
          databasesActivePluginData = xhr.response.body;
          cy.setupData("plugin_log").then((xhr: any) => {
            databasesPluginLogs = xhr.response.body;
          });
        });
      });
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
        assertPlugins(availablePlugins);
        assertActivePlugins(
          database.id,
          availablePlugins,
          databasesActivePluginData
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
        cy.get("button").contains(database.id).click();
        cy.get(getSelector("pluginLog")).eq(idx).click({ force: true });
        cy.get("textarea")
          .eq(idx)
          .then((textarea: any) => {
            assertPluginLog(
              database.id,
              databasesPluginLogs,
              textarea[0].value
            );
          });
        cy.get("button").contains(database.id).click();
      });
    });
    clickElement(getViewSelector("pluginOverviewButton"));
    testElementNoExistence(getSelector("pluginOverview"));
  });

  // test correct plugin settings
  it("will show the correct plugin settings for every active plugin and database", () => {
    cy.setupAppState(backend); // need this for properly open change settings button
    cy.wait(500);
    clickElement(getViewSelector("pluginOverviewButton"));
    cy.get(getSelector("pluginOverview")).within(() => {
      databases.forEach((database: any, idx: number) => {
        const activePlugins = availablePlugins.reduce(
          (activePlugins: Object[], plugin: any, idx: number) => {
            const pluginData = databasesActivePluginData.find(
              (db: any) => db.id === database.id
            );
            if (
              !!pluginData.plugins.find((active: any) => active.name === plugin)
            ) {
              activePlugins.push({
                plugin: plugin,
                idx: idx,
              });
            }
            return activePlugins;
          },
          []
        );
        cy.get("button").contains(database.id).click();
        cy.get(getPluginSelector(activePlugins[0].plugin, "changeButton"))
          .eq(idx)
          .click();
        cy.wait(1000);

        assertPluginSettings(database.id, databasesActivePluginData, idx);

        cy.get("button").contains(database.id).click();
      });
    });
  });
});
