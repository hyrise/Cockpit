import { testElementTrigger } from "../abstractTests";
import { routes, selectors, testRedirection } from "./helpers";

describe("Change page routes", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  // test overview
  describe("when clicking the overview button", () => {
    it("will redirect to the overview page", () => {
      testRedirection(selectors.overviewButton, routes.overview);
    });
  });

  // test comparison
  describe("when clicking the comparison button", () => {
    it("will redirect to the comparison page", () => {
      testRedirection(selectors.comparisonButton, routes.comparison);
    });
  });

  // test workload monitoring
  describe("when clicking the workload monitoring button", () => {
    it("will redirect to the workload monitoring page", () => {
      testRedirection(
        selectors.workloadMonitoringButton,
        routes.workloadMonitoring
      );
    });
  });

  // test database list
  describe("when clicking the database list button", () => {
    it("will open the database list", () => {
      testElementTrigger(selectors.databaseListButton, selectors.databaseList);
    });
  });

  // test workload generation
  describe("when clicking the workload generation button", () => {
    it("will open the workload generation dialog", () => {
      testElementTrigger(
        selectors.workloadGenerationButton,
        selectors.workloadGeneration
      );
    });
  });

  // test plugin overview
  describe("when clicking the plugin overview button", () => {
    it("will open the plugin overview panel", () => {
      testElementTrigger(
        selectors.pluginOverviewButton,
        selectors.pluginOverview
      );
    });
  });

  // test selection list
  describe("when clicking the views settings button", () => {
    it("will open the selection list", () => {
      cy.visit(routes.workloadMonitoring);
      testElementTrigger(
        selectors.selectionListButton,
        selectors.selectionList
      );
    });
  });
});
