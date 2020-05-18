import { getSelectorByConfig, clickElement } from "../helpers";

/* ROUTES */

const routes: Record<string, string> = {
  home: "/#/",
  overview: "/#/databases/overview",
  comparison: "/#/databases/compare",
  workloadMonitoring: "/#/workload",
};

/* SELECTORS */

const selectors: Record<string, string> = {
  overviewButton: getSelectorByConfig("a", "overview-button"),
  comparisonButton: getSelectorByConfig("a", "comparison-button"),
  workloadMonitoringButton: getSelectorByConfig(
    "a",
    "workload-monitoring-button"
  ),
  databaseListButton: getSelectorByConfig("div", "database-list-button"),
  workloadGenerationButton: getSelectorByConfig(
    "div",
    "workload-generation-button"
  ),
  pluginOverviewButton: getSelectorByConfig("div", "plugin-overview-button"),
  selectionListButton: getSelectorByConfig("button", "selection-list-button"),
  pluginOverview: getSelectorByConfig("div", "plugin-overview"),
  databaseList: getSelectorByConfig("div", "database-list"),
  workloadGeneration: getSelectorByConfig("div", "workload-generation"),
  selectionList: getSelectorByConfig("div", "selection-list"),
  unselectDatabase: getSelectorByConfig("button", "add-select-database-button"),
  selectDatabase: getSelectorByConfig(
    "button",
    "remove-select-database-button"
  ),
  unselectMetric: getSelectorByConfig("button", "add-select-metric-button"),
  selectMetric: getSelectorByConfig("button", "remove-select-metric-button"),
  overviewPage: getSelectorByConfig("div", "overview-page"),
  comparisonPage: getSelectorByConfig("div", "comparison-page"),
  workloadMonitoringPage: getSelectorByConfig(
    "div",
    "workload-monitoring-page"
  ),
  metricChip: getSelectorByConfig("span", "metric-chip"),
  loadingAnimation: getSelectorByConfig("div", "loading-animation"),
  historicRangeSelection: getSelectorByConfig(
    "input",
    "historic-range-selection"
  ),
  precisionSelection: getSelectorByConfig("input", "precision-selection"),
  changeRangeTypeButton: getSelectorByConfig("button", "change-range-type"),
  datePickerText: getSelectorByConfig("input", "date-picker-text"),
  timePickerText: getSelectorByConfig("input", "time-picker-text"),
  datePickerSelect: getSelectorByConfig("div", "date-picker-select"),
  timePickerSelect: getSelectorByConfig("div", "time-picker-select"),
  setStaticRangeButton: getSelectorByConfig("button", "set-static-time-range"),
  resetTimeRangeButton: getSelectorByConfig("button", "reset-time-range"),
};

const metrics: Record<string, string[]> = {
  workloadMonitoring: ["generatedQueryTypeProportion"],
  comparison: [
    "throughput",
    "latency",
    "queueLength",
    "cpu",
    "ram",
    "memoryFootprint",
    "storage",
    "access",
    "executedQueryTypeProportion",
  ],
  overview: [
    "throughput",
    "latency",
    "queueLength",
    "cpu",
    "ram",
    "memoryFootprint",
  ],
};

export const historicRanges: Record<
  string,
  { title: string; value: number }
> = {
  0.5: { title: "last 30 seconds", value: 30 },
  1: { title: "last minute", value: 60 },
  5: { title: "last 5 minutes", value: 5 * 60 },
  10: { title: "last 10 minutes", value: 10 * 60 },
  30: { title: "last 30 minutes", value: 30 * 60 },
  60: { title: "last 60 minutes", value: 60 * 60 },
};

export const basicPrecision = [1, 5, 15];

export function getSelector(component: string): string {
  return selectors[component];
}

export function getRoute(component: string): string {
  return routes[component];
}

export function getMetrics(component: string): string[] {
  return metrics[component];
}

/* ASSERTIONS */

export function testRedirection(selector: string, newRoute: string): void {
  clickElement(selector);
  cy.url().should("contain", newRoute);
}

export function checkMultipleMetrics(metric: string): string {
  if (metric === "storage") return "secondStorage";
  if (metric === "access") return "secondAccess";
  return metric;
}

export function assertItemSelect(
  component: "database" | "metric",
  selected: boolean
): void {
  if (component === "database" && selected) {
    cy.get(getSelector("selectDatabase")).should("not.be.visible", {
      force: true,
    });
    cy.get(getSelector("unselectDatabase"))
      .scrollIntoView()
      .should("be.visible", {
        force: true,
      });
  } else if (component === "database" && !selected) {
    cy.get(getSelector("selectDatabase"))
      .scrollIntoView()
      .should("be.visible", { force: true });
    cy.get(getSelector("unselectDatabase")).should("not.be.visible", {
      force: true,
    });
  } else if (component === "metric" && selected) {
    cy.get(getSelector("selectMetric")).should("not.be.visible", {
      force: true,
    });
    cy.get(getSelector("unselectMetric"))
      .scrollIntoView()
      .should("be.visible", { force: true });
  } else if (component === "metric" && !selected) {
    cy.get(getSelector("selectMetric"))
      .scrollIntoView()
      .should("be.visible", { force: true });
    cy.get(getSelector("unselectMetric")).should("not.be.visible", {
      force: true,
    });
  }
}

export function assertTimeIntervalRequest(url: string, range: number): void {
  expect(getEndTimeOfRequest(url) - getStartTimeOfRequest(url)).to.eq(
    range * Math.pow(10, 9) +
      Math.max(getPrecisionOfRequest(url), 3 * Math.pow(10, 9))
  );
}

export function assertPrecisionRequest(url: string, range: number): void {
  expect(getPrecisionOfRequest(url)).to.eq(range * Math.pow(10, 9));
}

export function assertStaticRangeRequest(
  url: string,
  start: Date,
  end: Date,
  precision: number
): void {
  expect(start.getTime() * Math.pow(10, 6)).to.eq(getStartTimeOfRequest(url));
  expect(end.getTime() * Math.pow(10, 6)).to.eq(getEndTimeOfRequest(url));
  expect(precision * Math.pow(10, 9)).to.eq(getPrecisionOfRequest(url));
}

/* FORMAT HELPERS */
export function formatTimeString(date: Date): string {
  return `${date.getHours() < 10 ? "0" + date.getHours() : date.getHours()}:${
    date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()
  }`;
}

/* get metric time reuqest intervalls */
function getStartTimeOfRequest(url: string): number {
  const startIndex = url.indexOf("=") + 1;
  return parseInt(url.substring(startIndex, url.indexOf("&")), 10);
}

function getEndTimeOfRequest(url: string): number {
  const startIndex = url.indexOf("=") + 1;
  const endIndex = url.indexOf("=", startIndex) + 1;
  return parseInt(url.substring(endIndex), 10);
}

function getPrecisionOfRequest(url: string): number {
  const split = url.split("=");
  return parseInt(split[split.length - 1], 10);
}
