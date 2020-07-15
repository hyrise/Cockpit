import { useBackendMock } from "../../setup/backendMock";
import {
  getGetAlias,
  getPostAlias,
  getDeleteAlias,
  generateRandomInt,
  getPutAlias,
} from "../../setup/helpers";
import { selectors as viewSelectors } from "../views/helpers";
import {
  assertActivePlugins,
  assertRequestValues,
  assertSettingsRequestValues,
  getPluginsByState,
  pluginButton,
  selectors,
} from "./helpers";
import { selectors as databaseSelectors } from "../databases/helpers";

const backend = useBackendMock({ plugins: 3 });

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
      const deactivePlugin = getPluginsByState(
        { availablePlugins, databases, databasesActivePluginData },
        "deactive"
      )[0];

      databases.forEach((database: any, idx: number) => {
        cy.get(viewSelectors.pluginOverviewButton).click();
        cy.get(selectors.pluginOverview).within(() => {
          // update tmp state
          cy.updateAppState(backend, {
            request: "plugin",
            id: deactivePlugin,
            method: "POST",
          });

          cy.get(databaseSelectors.databaseChip).eq(idx).click({ force: true });
          cy.get(pluginButton(deactivePlugin, "switchButton")).check({
            force: true,
          });

          cy.wait("@" + getPostAlias("plugin"));
          cy.get("@" + getPostAlias("plugin")).should((xhr: any) => {
            assertRequestValues(deactivePlugin, xhr.request.body);
          });
          cy.numberOfRequests(getPostAlias("plugin")).should("eq", idx + 1);
          cy.wait("@" + getGetAlias("plugin"));
          cy.get("@" + getGetAlias("plugin")).should((xhr: any) => {
            assertActivePlugins(
              database.id,
              availablePlugins,
              xhr.response.body
            );
          });
          cy.get(databaseSelectors.databaseChip).eq(idx).click({ force: true });

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
      const activePlugin = getPluginsByState(
        { availablePlugins, databases, databasesActivePluginData },
        "active"
      )[0];

      databases.forEach((database: any, idx: number) => {
        cy.get(viewSelectors.pluginOverviewButton).click();
        cy.get(selectors.pluginOverview).within(() => {
          // update tmp state
          cy.updateAppState(backend, {
            request: "plugin",
            id: activePlugin,
            method: "DELETE",
          });

          cy.get(databaseSelectors.databaseChip).eq(idx).click({ force: true });
          cy.get(pluginButton(activePlugin, "switchButton")).uncheck({
            force: true,
          });

          cy.wait("@" + getDeleteAlias("plugin"));
          cy.get("@" + getDeleteAlias("plugin")).should((xhr: any) => {
            assertRequestValues(activePlugin, xhr.request.body);
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
          cy.get(databaseSelectors.databaseChip).eq(idx).click({ force: true });

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
  describe("and change settings of an active plugin", () => {
    it("will change the settings value", () => {
      const newValue = generateRandomInt(0, 1000);

      databases.forEach((database: any, idx: number) => {
        const activePlugin = availablePlugins.reduce(
          (activePlugins: Object[], plugin: any, idx: number) => {
            const pluginData = databasesActivePluginData.find(
              (db: any) => db.id === database.id
            );
            const pluginSettings = pluginData.plugins.find(
              (active: any) => active.name === plugin
            );
            if (!!pluginSettings) {
              activePlugins.push({
                plugin: plugin,
                name: pluginSettings.settings[0].name, // plugin only has one available setting
              });
            }
            return activePlugins;
          },
          []
        )[0];
        cy.get(viewSelectors.pluginOverviewButton).click();
        cy.get(selectors.pluginOverview).within(() => {
          cy.get(databaseSelectors.databaseChip).eq(idx).click({ force: true });

          cy.get(pluginButton(activePlugin.plugin, "changeButton")).click();
          cy.wait(300);
          cy.get(selectors.settingValue).clear().type(newValue.toString());
          cy.get(selectors.saveSettingsButton).click();
          cy.wait("@" + getPutAlias("plugin"));
          cy.get("@" + getPutAlias("plugin")).should((xhr: any) => {
            assertSettingsRequestValues(
              activePlugin.plugin,
              activePlugin.name,
              newValue.toString(),
              xhr.request.body
            );
          });
          cy.numberOfRequests(getPutAlias("plugin")).should("eq", idx + 1);
          cy.get(databaseSelectors.databaseChip).eq(idx).click({ force: true });
        });
        cy.reload();
      });
    });
  });
});
