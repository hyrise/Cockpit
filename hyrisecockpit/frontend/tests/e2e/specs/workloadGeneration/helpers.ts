import { benchmarks, displayedBenchmark } from "../../setup/helpers";
import { getSelectorByCustomConfig } from "../helpers";

export const selectors = {
  openEqualizer: getSelectorByCustomConfig("open-equalizer"),
  pauseWorkload: getSelectorByCustomConfig("pause-workload"),
  selectWorkload: getSelectorByCustomConfig("select-workload"),
  selectWorkloadData: getSelectorByCustomConfig("select-workload-data"),
  startWorkload: getSelectorByCustomConfig("start-workload"),
  stopWorkload: getSelectorByCustomConfig("stop-workload"),
  workloadEqualizer: getSelectorByCustomConfig("workload-equalizer"),
};

export function getBenchmarkIndex(benchmark: string): number {
  return benchmarks.findIndex((type: any) => type === benchmark)!;
}

/* ASSERTIONS */
export function assertBenchmarks(statusData: any[]): void {
  console.log(statusData);
  benchmarks.forEach((benchmark: string, idx: number) => {
    // assert loaded workload data
    cy.get(selectors.selectWorkloadData)
      .eq(idx)
      .should(
        statusData[0].loaded_benchmarks.includes(benchmark)
          ? "be.checked"
          : "not.be.checked"
      );
    // assert startable workload
    cy.get(selectors.selectWorkload)
      .eq(idx)
      .should(
        statusData[0].loaded_benchmarks.includes(benchmark)
          ? "not.be.disabled"
          : "be.disabled"
      );
  });
}

export function assertWorkloadChange(
  requestData: any,
  benchmark: string,
  frequency: number = 200,
  weights?: Object
): void {
  expect(requestData.folder_name).to.eq(benchmark);
  expect(requestData.frequency).to.eq(frequency);
  if (weights) expect(requestData.weights).to.eq(weights);
}

export function assertWorkloadDataChange(
  requestData: any,
  benchmark: string
): void {
  expect(requestData.folder_name).to.eq(benchmark);
}

export function assertWorkloadEqualizer(benchmark: string): void {
  cy.get(selectors.workloadEqualizer).contains(
    (displayedBenchmark as any)[benchmark]
  );
}
