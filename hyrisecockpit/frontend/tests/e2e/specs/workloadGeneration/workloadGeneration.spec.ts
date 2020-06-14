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
  assertBenchmarks,
  assertWorkloadChange,
  assertWorkloadDataChange,
  getBenchmarkIndex,
  selectors,
  assertWorkloadEqualizer,
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
    assertBenchmarks(statusData);
  });

  // test start, pause and stop workload
  describe("when clicking the start, pause and stop buttons", () => {
    it("will start, pause and stop workload", () => {
      const activeBenchmark = statusData[0].loaded_benchmarks[0];

      clickElement(getViewSelector("workloadGenerationButton"));
      cy.wait(1000);

      // test start workload
      cy.get(selectors.selectWorkload)
        .eq(getBenchmarkIndex(activeBenchmark))
        .check({ force: true });

      cy.wait("@" + getPostAlias("workload"));
      cy.get("@" + getPostAlias("workload")).should((xhr: any) => {
        assertWorkloadChange(xhr.request.body, activeBenchmark);
      });
      cy.wait("@" + getPutAlias("workload"));

      cy.get(selectors.startWorkload).click();
      cy.wait("@" + getPostAlias("worker"));

      cy.numberOfRequests(getPostAlias("worker")).should("eq", 1);
      cy.numberOfRequests(getPostAlias("workload")).should("eq", 1);

      // update tmp state
      cy.updateAppState(backend, {
        request: "workload",
        id: activeBenchmark,
        method: "POST",
      });

      // test pause workload
      cy.wait("@" + getGetAlias("status"));

      cy.get(selectors.pauseWorkload).click();
      cy.wait("@" + getPutAlias("workload"));
      cy.get("@" + getPutAlias("workload")).should((xhr: any) => {
        assertWorkloadChange(xhr.request.body, activeBenchmark, 0);
      });

      // test stop workload
      cy.get(selectors.stopWorkload).click();
      cy.wait("@" + getDeleteAlias("worker"));

      cy.get(selectors.selectWorkload)
        .eq(getBenchmarkIndex(activeBenchmark))
        .uncheck({ force: true });

      cy.wait("@" + getDeleteAlias("workload"));

      cy.numberOfRequests(getDeleteAlias("worker")).should("eq", 1);
      cy.numberOfRequests(getDeleteAlias("workload")).should("eq", 1);

      cy.numberOfRequests(getPutAlias("workload")).should("eq", 2);

      // update tmp state
      cy.updateAppState(backend, {
        request: "workload",
        id: activeBenchmark,
        method: "DELETE",
      });

      cy.wait("@" + getGetAlias("status"));
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

      // test load table
      cy.get(selectors.selectWorkloadData)
        .eq(getBenchmarkIndex(deactiveBenchmarks[index]))
        .check({ force: true });

      cy.wait("@" + getPostAlias("benchmark_tables"));
      cy.get("@" + getPostAlias("benchmark_tables")).then((xhr: any) => {
        assertWorkloadDataChange(xhr.request.body, deactiveBenchmarks[index]);
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
        assertBenchmarks(statusData);
      });

      // test unload table
      cy.get(selectors.selectWorkloadData)
        .eq(getBenchmarkIndex(deactiveBenchmarks[index]))
        .uncheck({ force: true });

      cy.wait("@" + getDeleteAlias("benchmark_tables"));
      cy.get("@" + getDeleteAlias("benchmark_tables")).then((xhr: any) => {
        assertWorkloadDataChange(xhr.request.body, deactiveBenchmarks[index]);
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
        assertBenchmarks(statusData);
      });
    });
  });

  // test equalizer
  describe("when opening the equalizer", () => {
    it("will show equalizers for every selected workload", () => {
      cy.restartAppState(backend, {
        workloads: 1,
      });
      cy.reload();
      cy.wait("@" + getGetAlias("workload"));
      cy.get("@" + getGetAlias("workload")).then((xhr: any) => {
        clickElement(getViewSelector("workloadGenerationButton"));
        cy.get(selectors.openEqualizer).click({ force: true });

        assertWorkloadEqualizer(xhr.response.body[0].folder_name);
      });

      cy.restartAppState(backend, {});
    });
  });
});
