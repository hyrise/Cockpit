import { clickElement } from "../helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import { useBackendMock, mockBackend } from "../../setup/backendMock";
import {
  generateRandomInt,
  getPostAlias,
  getDeleteAlias,
  getGetAlias,
  benchmarks,
} from "../../setup/helpers";
import {
  assertLoadedBenchmarks,
  assertStartableBenchmarks,
  getSelector,
  getBenchmarkIndex,
  assertStartedWorkload,
  assertButtonState,
  assertChangedTable,
} from "./helpers";

let backend = mockBackend();

let statusData: any[] = [];

// test on workload generation
describe("opening workload generation", () => {
  beforeEach(() => {
    cy.setupAppState(backend).then(() => {
      cy.setupData("status").then((xhr: any) => {
        statusData = xhr.response.body;
      });
    });
  });

  // test loaded benchmarks
  it("will initially show the correct loaded and startable benchmarks", () => {
    clickElement(getViewSelector("workloadGenerationButton"));
    assertLoadedBenchmarks(statusData);
    assertStartableBenchmarks(statusData);
  });

  // test changing frequency
  describe("when chaning frequency without starting the workload", () => {
    it("will set frequency to new value but do not start workload", () => {
      const newValue = generateRandomInt(0, 1000);
      clickElement(getViewSelector("workloadGenerationButton"));
      cy.get(getSelector("frequencyField")).clear().type(newValue.toString());
      cy.get(getSelector("frequencySlider")).should(
        "have.value",
        newValue.toString()
      );
      cy.get(getSelector("frequencySlider")).click({ force: true });
      cy.get(getSelector("frequencyField")).should("have.value", "0");
      cy.numberOfRequests(getPostAlias("workload")).should("eq", 0);
    });
  });

  // test start, pause and stop workload
  describe("when clicking the start, pause and stop buttons", () => {
    it("will start, pause and stop workload", () => {
      const activeBenchmark = statusData[0].loaded_benchmarks[0];
      clickElement(getViewSelector("workloadGenerationButton"));
      cy.get("input[type=radio]")
        .eq(getBenchmarkIndex(activeBenchmark))
        .check({ force: true });
      cy.get(getSelector("startButton")).click();

      cy.wait("@" + getPostAlias("workload"));
      cy.get("@" + getPostAlias("workload")).should((xhr: any) => {
        assertStartedWorkload(xhr.request.body, activeBenchmark);
      });
      cy.numberOfRequests(getPostAlias("workload")).should("eq", 1);
      backend.reload("workload", "", "POST");
      cy.wait("@" + getGetAlias("status"));
      assertButtonState("checkbox", true);

      cy.get(getSelector("pauseButton")).click();
      cy.wait("@" + getPostAlias("workload"));
      cy.get("@" + getPostAlias("workload")).should((xhr: any) => {
        assertStartedWorkload(xhr.request.body, activeBenchmark, 0);
      });
      cy.numberOfRequests(getPostAlias("workload")).should("eq", 2);

      cy.get(getSelector("stopButton")).click();

      cy.wait("@" + getDeleteAlias("workload"));
      cy.numberOfRequests(getDeleteAlias("workload")).should("eq", 1);
      backend.reload("workload", "", "DELETE");
      cy.wait("@" + getGetAlias("status"));
      assertButtonState("checkbox", false);
    });
  });

  // test load and unload tables
  describe("when loading or removing tables via button", () => {
    it("will load and unload the correct tables", () => {
      const activeBenchmark = statusData[0].loaded_benchmarks[0];
      const deactiveBenchmarks = benchmarks.filter(
        (type) => type !== activeBenchmark
      );
      const index = generateRandomInt(0, deactiveBenchmarks.length);

      clickElement(getViewSelector("workloadGenerationButton"));

      cy.get("input[type=checkbox]")
        .eq(getBenchmarkIndex(deactiveBenchmarks[index]))
        .check({ force: true });

      cy.wait("@" + getPostAlias("data"));
      cy.get("@" + getPostAlias("data")).then((xhr: any) => {
        assertChangedTable(xhr.request.body, deactiveBenchmarks[index]);
      });
      cy.numberOfRequests(getPostAlias("data")).should("eq", 1);
      backend.reload("data", deactiveBenchmarks[index], "POST");
      cy.setupData("status").then((xhr: any) => {
        statusData = xhr.response.body;
        assertLoadedBenchmarks(statusData);
        assertStartableBenchmarks(statusData);
      });

      cy.get("input[type=checkbox]")
        .eq(getBenchmarkIndex(activeBenchmark))
        .uncheck({ force: true });

      cy.wait("@" + getDeleteAlias("data"));
      cy.get("@" + getDeleteAlias("data")).then((xhr: any) => {
        assertChangedTable(xhr.request.body, activeBenchmark);
      });
      cy.numberOfRequests(getDeleteAlias("data")).should("eq", 1);
      backend.reload("data", activeBenchmark, "DELETE");
      cy.setupData("status").then((xhr: any) => {
        statusData = xhr.response.body;
        assertLoadedBenchmarks(statusData);
        assertStartableBenchmarks(statusData);
      });
    });
  });

  // test restart workload
  describe("when changing frequency after workload start", () => {
    it("will restart workload with new frequency", () => {
      const activeBenchmark = statusData[0].loaded_benchmarks[0];
      const newValue = generateRandomInt(0, 1000);

      clickElement(getViewSelector("workloadGenerationButton"));

      cy.get("input[type=radio]")
        .eq(getBenchmarkIndex(activeBenchmark))
        .check({ force: true });
      cy.get(getSelector("startButton")).click();
      cy.wait("@" + getPostAlias("workload"));

      clickElement(getViewSelector("workloadGenerationButton"));
      cy.get(getSelector("frequencyField")).clear().type(newValue.toString());
      cy.get("div").first().click({ force: true }); // need this to trigger action (cy.trigger not working)

      cy.wait("@" + getPostAlias("workload"));
      cy.get("@" + getPostAlias("workload")).should((xhr: any) => {
        assertStartedWorkload(xhr.request.body, activeBenchmark, newValue);
      });
      cy.numberOfRequests(getPostAlias("workload")).should("eq", 2);
    });
  });

  // test empty databases
  describe("when no database has been added", () => {
    it("will show an error and disable all buttons", () => {
      backend = useBackendMock({ databases: 0 });
      backend.restart();
      cy.reload();
      clickElement(getViewSelector("workloadGenerationButton"));
      assertButtonState("checkbox", true);
      assertButtonState("radio", true);
      cy.contains("No database added");
    });
  });
});
