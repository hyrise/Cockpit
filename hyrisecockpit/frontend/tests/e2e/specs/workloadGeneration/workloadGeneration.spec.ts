import { selectors as viewSelectors } from "../views/helpers";
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

const backend = useBackendMock();

let benchmarkStatus: any[] = [];
let databaseStatus: any[] = [];

// test on workload generation
describe("opening workload generation", () => {
  beforeEach(() => {
    cy.setupAppState(backend).then(() => {
      cy.setupData("status_benchmarks").then((xhr: any) => {
        benchmarkStatus = xhr.response.body;
        cy.setupData("status_database").then((xhr: any) => {
          databaseStatus = xhr.response.body;
        });
      });
    });
  });

  // test loaded benchmarks
  it("will initially show the correct loaded and startable benchmarks", () => {
    cy.get(viewSelectors.workloadGenerationButton).click();
    assertBenchmarks(benchmarkStatus);
  });

  // test start and stop workload
  describe("when clicking the start and stop buttons", () => {
    it("will start and stop workload", () => {
      const activeBenchmark = benchmarkStatus[0].loaded_benchmarks[0];

      cy.get(viewSelectors.workloadGenerationButton).click();
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

      // test stop workload
      cy.get(selectors.stopWorkload).click();
      cy.wait("@" + getDeleteAlias("worker"));

      cy.get(selectors.selectWorkload)
        .eq(getBenchmarkIndex(activeBenchmark))
        .uncheck({ force: true });

      cy.wait("@" + getDeleteAlias("workload"));

      cy.numberOfRequests(getDeleteAlias("worker")).should("eq", 1);
      cy.numberOfRequests(getDeleteAlias("workload")).should("eq", 1);

      cy.numberOfRequests(getPutAlias("workload")).should("eq", 1);

      // update tmp state
      cy.updateAppState(backend, {
        request: "workload",
        id: activeBenchmark,
        method: "DELETE",
      });

      cy.wait("@" + getGetAlias("status_database"));
    });
  });

  // test load tables
  describe("when loading tables via button", () => {
    it("will load the correct tables", () => {
      const deactiveBenchmarks = benchmarks.filter(
        (type) => !benchmarkStatus[0].loaded_benchmarks.includes(type)
      );
      const index = generateRandomInt(0, deactiveBenchmarks.length);

      cy.get(viewSelectors.workloadGenerationButton).click();

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

      cy.setupData("status_benchmarks").then((xhr: any) => {
        benchmarkStatus = xhr.response.body;
        cy.setupData("status_database").then((xhr: any) => {
          assertBenchmarks(benchmarkStatus);
        });
      });

      // clean tmp state
      cy.cleanAppState(backend, {
        request: "benchmark_tables",
        id: deactiveBenchmarks[index],
        method: "DELETE",
      });
    });
  });

  // test unload tables
  describe("when unloading tables via button", () => {
    it("will unload the correct tables", () => {
      const activeBenchmark = benchmarkStatus[0].loaded_benchmarks[0];
      cy.get(viewSelectors.workloadGenerationButton).click();

      // test unload table
      cy.get(selectors.selectWorkloadData)
        .eq(getBenchmarkIndex(activeBenchmark))
        .uncheck({ force: true });

      cy.wait("@" + getDeleteAlias("benchmark_tables"));
      cy.get("@" + getDeleteAlias("benchmark_tables")).then((xhr: any) => {
        assertWorkloadDataChange(xhr.request.body, activeBenchmark);
      });
      cy.numberOfRequests(getDeleteAlias("benchmark_tables")).should("eq", 1);

      // update tmp state
      cy.updateAppState(backend, {
        request: "benchmark_tables",
        id: activeBenchmark,
        method: "DELETE",
      });

      cy.setupData("status_benchmarks").then((xhr: any) => {
        benchmarkStatus = xhr.response.body;
        cy.setupData("status_database").then((xhr: any) => {
          assertBenchmarks(benchmarkStatus);
        });
      });

      // clean tmp state
      cy.cleanAppState(backend, {
        request: "benchmark_tables",
        id: activeBenchmark,
        method: "POST",
      });
    });
  });

  // test equalizer
  describe("when opening the equalizer", () => {
    it("will show equalizers for every selected workload", () => {
      const activeBenchmark = benchmarkStatus[0].loaded_benchmarks[0];
      cy.get(viewSelectors.workloadGenerationButton).click();
      cy.wait(1000);

      cy.get(selectors.selectWorkload)
        .eq(getBenchmarkIndex(activeBenchmark))
        .check({ force: true });
      cy.get(selectors.openEqualizer).click({ force: true });

      assertWorkloadEqualizer(activeBenchmark);

      cy.restartAppState(backend, {});
    });
  });
});
