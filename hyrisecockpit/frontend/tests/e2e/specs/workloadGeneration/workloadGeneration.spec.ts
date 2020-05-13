import { clickElement } from "../helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import { useBackendMock } from "../../setup/backendMock";
import {
  generateRandomInt,
  getPostAlias,
  getDeleteAlias,
  getGetAlias,
  benchmarks,
  getPutAlias,
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

let backend = useBackendMock();

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
  describe("when changing frequency without starting the workload", () => {
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

      cy.wait("@" + getPostAlias("worker"));
      cy.wait("@" + getPostAlias("workload"));
      cy.get("@" + getPostAlias("workload")).should((xhr: any) => {
        assertStartedWorkload(xhr.request.body, activeBenchmark);
      });

      cy.numberOfRequests(getPostAlias("worker")).should("eq", 1);
      cy.numberOfRequests(getPostAlias("workload")).should("eq", 1);

      // update tmp state
      cy.updateAppState(backend, {
        request: "workload",
        id: activeBenchmark,
        method: "POST",
      });

      cy.wait("@" + getGetAlias("status"));
      assertButtonState("checkbox", true);
      cy.wait(1000);

      cy.get(getSelector("pauseButton")).click();
      cy.wait("@" + getPutAlias("workload"));
      cy.get("@" + getPutAlias("workload")).should((xhr: any) => {
        assertStartedWorkload(xhr.request.body, activeBenchmark, 0);
      });

      cy.get(getSelector("stopButton")).click();

      cy.wait("@" + getDeleteAlias("worker"));
      cy.wait("@" + getDeleteAlias("workload"));
      cy.numberOfRequests(getDeleteAlias("worker")).should("eq", 1);
      cy.numberOfRequests(getDeleteAlias("workload")).should("eq", 1);

      // update workload (on render, on start, on pause)
      cy.numberOfRequests(getPutAlias("workload")).should("eq", 3);

      // update tmp state
      cy.updateAppState(backend, {
        request: "workload",
        id: activeBenchmark,
        method: "DELETE",
      });

      cy.wait("@" + getGetAlias("status"));
      assertButtonState("checkbox", false);
    });
  });

  // test load and unload tables
  describe("when loading or removing tables via button", () => {
    it("will load and unload the correct tables", () => {
      const deactiveBenchmarks = benchmarks.filter(
        (type) => type !== statusData[0].loaded_benchmarks[0]
      );
      const index = generateRandomInt(0, deactiveBenchmarks.length);

      clickElement(getViewSelector("workloadGenerationButton"));

      cy.get("input[type=checkbox]")
        .eq(getBenchmarkIndex(deactiveBenchmarks[index]))
        .check({ force: true });

      cy.wait("@" + getPostAlias("benchmark_tables"));
      cy.get("@" + getPostAlias("benchmark_tables")).then((xhr: any) => {
        assertChangedTable(xhr.request.body, deactiveBenchmarks[index]);
      });
      cy.numberOfRequests(getPostAlias("benchmark_tables")).should("eq", 1);
      // update tmp state
      cy.updateAppState(backend, {
        request: "benchmark_tables",
        id: deactiveBenchmarks[index],
        method: "POST",
      });
      cy.setupData("status").then((xhr: any) => {
        statusData = xhr.response.body;
        assertLoadedBenchmarks(statusData);
        assertStartableBenchmarks(statusData);
      });

      cy.get("input[type=checkbox]")
        .eq(getBenchmarkIndex(deactiveBenchmarks[index]))
        .uncheck({ force: true });

      cy.wait("@" + getDeleteAlias("benchmark_tables"));
      cy.get("@" + getDeleteAlias("benchmark_tables")).then((xhr: any) => {
        assertChangedTable(xhr.request.body, deactiveBenchmarks[index]);
      });
      cy.numberOfRequests(getDeleteAlias("benchmark_tables")).should("eq", 1);

      // update tmp state
      cy.updateAppState(backend, {
        request: "benchmark_tables",
        id: deactiveBenchmarks[index],
        method: "DELETE",
      });
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

      cy.wait("@" + getPostAlias("worker"));
      cy.wait("@" + getPostAlias("workload"));
      cy.get("@" + getPostAlias("workload")).should((xhr: any) => {
        assertStartedWorkload(xhr.request.body, activeBenchmark);
      });

      cy.numberOfRequests(getPostAlias("worker")).should("eq", 1);
      cy.numberOfRequests(getPostAlias("workload")).should("eq", 1);

      clickElement(getViewSelector("workloadGenerationButton"));
      cy.get(getSelector("frequencyField")).clear().type(newValue.toString());
      cy.get("div").first().click({ force: true }); // need this to trigger action (cy.trigger not working)

      cy.wait("@" + getPutAlias("workload"));
      cy.get("@" + getPutAlias("workload")).should((xhr: any) => {
        assertStartedWorkload(xhr.request.body, activeBenchmark, newValue);
      });

      // update workload (on render, on start, on frequency change)
      cy.numberOfRequests(getPutAlias("workload")).should("eq", 3);

      // clean tmp state
      cy.cleanAppState(backend, {
        request: "workload",
        id: activeBenchmark,
        method: "DELETE",
      });
    });
  });

  // test empty databases
  describe("when no database has been added", () => {
    it("will show an error and disable all buttons", () => {
      cy.restartAppState(backend, {
        databases: 0,
      });
      cy.reload();
      clickElement(getViewSelector("workloadGenerationButton"));
      assertButtonState("checkbox", true);
      assertButtonState("radio", true);
      cy.contains("No database added");

      cy.restartAppState(backend, {});
    });
  });
});
