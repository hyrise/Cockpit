import { useBackendMock } from "../../setup/backendMock";
import { selectors as viewSelectors } from "../views/helpers";
import {
  assertActivePlugins,
  assertPluginExistence,
  assertPluginLog,
  assertPluginSettings,
  selectors,
  pluginButton,
  getPluginsByState,
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

  // test correct plugins
  it("will show the correct plugins for every database", () => {
    cy.get(viewSelectors.pluginOverviewButton).click();
    cy.get(selectors.pluginOverview).within(() => {
      databases.forEach((database: any, idx: number) => {
        cy.get(selectors.databaseHeader).eq(idx).click();
        assertPluginExistence(availablePlugins);
        assertActivePlugins(
          database.id,
          availablePlugins,
          databasesActivePluginData
        );
      });
    });
    cy.get(viewSelectors.pluginOverviewButton).click();
    testElementNoExistence(selectors.pluginOverview);
  });

  // test correct plugin log messages
  it("will show the correct plugin logs for every database", () => {
    cy.get(viewSelectors.pluginOverviewButton).click();
    cy.get(selectors.pluginOverview).within(() => {
      databases.forEach((database: any, idx: number) => {
        cy.get(selectors.databaseHeader).eq(idx).click();
        cy.get(selectors.pluginLog).eq(idx).click({ force: true });
        cy.get(selectors.pluginLogArea)
          .eq(idx)
          .then((textarea: any) => {
            assertPluginLog(
              database.id,
              databasesPluginLogs,
              textarea[0].value
            );
          });
        cy.get(selectors.databaseHeader).eq(idx).click();
      });
    });
    cy.get(viewSelectors.pluginOverviewButton).click();
    testElementNoExistence(selectors.pluginOverview);
  });

  // test correct plugin settings
  it("will show the correct plugin settings for every active plugin and database", () => {
    cy.setupAppState(backend); // need this for properly open change settings button
    cy.wait(500);
    cy.get(viewSelectors.pluginOverviewButton).click();
    cy.get(selectors.pluginOverview).within(() => {
      databases.forEach((database: any, idx: number) => {
        const activePlugins = getPluginsByState(
          { availablePlugins, databases, databasesActivePluginData },
          "active",
          true
        );

        cy.get(selectors.databaseHeader).eq(idx).click();
        cy.get(pluginButton(activePlugins[0].plugin, "changeButton"))
          .eq(idx)
          .click();
        cy.wait(1000);

        assertPluginSettings(database.id, databasesActivePluginData, idx);

        cy.get(selectors.databaseHeader).eq(idx).click();
      });
    });
  });
});
