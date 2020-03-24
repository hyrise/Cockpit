import { testRedirection, testElementTrigger } from "./abstractTestCases";
import { getRoute } from "./helpers";

describe("Change page routes", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  describe("when clicking the overview button", () => {
    it("will redirect to the overview page", () => {
      testRedirection("div", "Overview", getRoute("overview"));
    });
  });
  describe("when clicking the comparison button", () => {
    it("will redirect to the comparison page", () => {
      testRedirection("div", "Comparison", getRoute("comparison"));
    });
  });
  describe("when clicking the workload monitoring button", () => {
    it("will redirect to the workload monitoring page", () => {
      testRedirection(
        "div",
        "Workload metrics",
        getRoute("workloadMonitoring")
      );
    });
  });
  describe("when clicking the database button button", () => {
    it("will open the database list", () => {
      testElementTrigger("div", "Database", "DATABASES");
    });
  });

  //TODO: add tests for missing buttons
});
