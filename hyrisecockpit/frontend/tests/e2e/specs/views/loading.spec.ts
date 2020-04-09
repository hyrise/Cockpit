import { testRedirection } from "../abstractTests";
import { getRoute, getSelector } from "./helpers";
import { useBackendMock } from "../../setup/backendMock";

const backend = useBackendMock();

// test running backend
describe("when backend is up", () => {
  before(() => {
    backend.start();
    cy.visit("/");
  });

  // test on workload monitoring
  describe("visiting the workload monitoring page", () => {
    it("will not show a loading animation", () => {
      testRedirection(
        getSelector("workloadMonitoringButton"),
        getRoute("workloadMonitoring")
      );
      cy.get(getSelector("loadingAnimation")).should("not.be.visible");
    });
  });

  // test on overview
  describe("visiting the overview page", () => {
    it("will not show a loading animation", () => {
      testRedirection(getSelector("overviewButton"), getRoute("overview"));
      cy.get(getSelector("loadingAnimation")).should("not.be.visible");
    });
  });

  // test on comparison
  describe("visiting the comparison page", () => {
    it("will not show a loading animation", () => {
      testRedirection(getSelector("comparisonButton"), getRoute("comparison"));
      cy.get(getSelector("loadingAnimation")).should("not.be.visible");
    });
  });
});

// test not running backend
describe("when backend is down", () => {
  before(() => {
    backend.start("down");
    cy.visit("/");
  });

  // test on workload monitoring
  describe("visiting the workload monitoring page", () => {
    it("will show a loading animation", () => {
      testRedirection(
        getSelector("workloadMonitoringButton"),
        getRoute("workloadMonitoring")
      );
      cy.get(getSelector("loadingAnimation")).should("be.visible");
    });
  });

  // test on overview
  describe("visiting the overview page", () => {
    it("will show a loading animation", () => {
      testRedirection(getSelector("overviewButton"), getRoute("overview"));
      cy.get(getSelector("loadingAnimation")).should("be.visible");
    });
  });

  // test on comparison
  describe("visiting the comparison page", () => {
    it("will show a loading animation", () => {
      testRedirection(getSelector("comparisonButton"), getRoute("comparison"));
      cy.get(getSelector("loadingAnimation")).should("be.visible");
    });
  });
});
