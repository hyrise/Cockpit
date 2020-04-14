import { testElementTrigger } from "../abstractTests";
import { getRoute, getSelector, testRedirection } from "./helpers";

describe("Change page routes", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  // test overview
  describe("when clicking the overview button", () => {
    it("will redirect to the overview page", () => {
      testRedirection(getSelector("overviewButton"), getRoute("overview"));
    });
  });

  // test comparison
  describe("when clicking the comparison button", () => {
    it("will redirect to the comparison page", () => {
      testRedirection(getSelector("comparisonButton"), getRoute("comparison"));
    });
  });

  // test workload monitoring
  describe("when clicking the workload monitoring button", () => {
    it("will redirect to the workload monitoring page", () => {
      testRedirection(
        getSelector("workloadMonitoringButton"),
        getRoute("workloadMonitoring")
      );
    });
  });

  // test database list
  describe("when clicking the database list button", () => {
    it("will open the database list", () => {
      testElementTrigger(
        getSelector("databaseListButton"),
        getSelector("databaseList")
      );
    });
  });

  // test workload generation
  describe("when clicking the workload generation button", () => {
    it("will open the workload generation dialog", () => {
      testElementTrigger(
        getSelector("workloadGenerationButton"),
        getSelector("workloadGeneration")
      );
    });
  });

  // test plugin overview
  describe("when clicking the plugin overview button", () => {
    it("will open the plugin overview panel", () => {
      testElementTrigger(
        getSelector("pluginOverviewButton"),
        getSelector("pluginOverview")
      );
    });
  });

  // test selection list
  describe("when clicking the views settings button", () => {
    it("will open the selection list", () => {
      testRedirection(
        getSelector("workloadMonitoringButton"),
        getRoute("workloadMonitoring")
      );
      testElementTrigger(
        getSelector("selectionListButton"),
        getSelector("selectionList")
      );
    });
  });
});
