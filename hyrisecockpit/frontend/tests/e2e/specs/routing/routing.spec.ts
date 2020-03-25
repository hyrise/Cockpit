import { testRedirection, testElementTrigger } from "./abstractTestCases";
import { getRoute } from "./helpers";
import { useBackendMock } from "../../setup/backendMock";

const backend = useBackendMock({
  databases: 1,
  tables: 2,
  columns: 2,
  chunks: 2,
  queries: 10,
  plugins: 3,
  activated_plugins: 0
});

describe("Change page routes", () => {
  beforeEach(() => {
    backend.start();
    cy.visit("/");
  });

  // test overview
  describe("when clicking the overview button", () => {
    it("will redirect to the overview page", () => {
      testRedirection("div", "Overview", getRoute("overview"));
    });
  });

  // test comparison
  describe("when clicking the comparison button", () => {
    it("will redirect to the comparison page", () => {
      testRedirection("div", "Comparison", getRoute("comparison"));
    });
  });

  // test workload monitoring
  describe("when clicking the workload monitoring button", () => {
    it("will redirect to the workload monitoring page", () => {
      testRedirection(
        "div",
        "Workload metrics",
        getRoute("workloadMonitoring")
      );
    });
  });

  // test add database
  describe("when clicking the database button", () => {
    it("will open the database list", () => {
      testElementTrigger("div", "Database", "DATABASES");
    });
  });

  // test workload generation
  describe("when clicking the workload generation button", () => {
    it("will open the workload generation dialog", () => {
      testElementTrigger("div", "Workload Generation", "Workload Generation");
    });
  });

  // test plugin overview
  describe("when clicking the plugins button", () => {
    it("will open the plugin overview panel", () => {
      testElementTrigger("div", "Plugins", "Plugins");
    });
  });
});
