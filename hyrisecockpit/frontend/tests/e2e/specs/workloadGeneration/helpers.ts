import { benchmarks } from "../../setup/helpers";
import { getSelectorByConfig } from "../helpers";

const selectors: Record<string, string> = {
  frequencySlider: getSelectorByConfig("input", "frequency-slider"),
  frequencyField: getSelectorByConfig("input", "frequency-field"),
  startButton: getSelectorByConfig("button", "start-workload"),
  pauseButton: getSelectorByConfig("button", "pause-workload"),
  stopButton: getSelectorByConfig("button", "stop-workload"),
};

export function getSelector(component: string): string {
  return selectors[component];
}

export function getBenchmarkIndex(benchmark: string): number {
  return benchmarks.findIndex((type: any) => type === benchmark)!;
}

export function assertLoadedBenchmarks(statusData: any[]): void {
  benchmarks.forEach((benchmark: string, idx: number) => {
    cy.get("input[type=checkbox]")
      .eq(idx)
      .then((checkbox: any) => {
        expect(checkbox[0].checked).to.eq(
          statusData[0].loaded_benchmarks.includes(benchmark)
        );
      });
  });
}

export function assertStartableBenchmarks(statusData: any[]): void {
  benchmarks.forEach((benchmark: string, idx: number) => {
    cy.get("input[type=radio]")
      .eq(idx)
      .then((radioButton: any) => {
        expect(radioButton[0].disabled).to.eq(
          !statusData[0].loaded_benchmarks.includes(benchmark)
        );
      });
  });
}

export function assertStartedWorkload(
  requestData: any,
  benchmark: string,
  frequency: number = 200
): void {
  expect(requestData.folder_name).to.eq(benchmark);
  expect(requestData.frequency).to.eq(frequency);
}

export function assertChangedTable(requestData: any, benchmark: string): void {
  expect(requestData.folder_name).to.eq(benchmark);
}

export function assertButtonState(
  type: "checkbox" | "radio",
  disabled: boolean
): void {
  benchmarks.forEach((benchmark: string, idx: number) => {
    if (disabled) {
      cy.get(`input[type=${type}]`).eq(idx).should("be.disabled");
    } else {
      cy.get(`input[type=${type}]`).eq(idx).should("not.be.disabled");
    }
  });
}
