import { getSelectorByCustomConfig } from "../helpers";

/* ROUTES */

export const routes = {
  home: "/#/",
  overview: "/#/databases/overview",
  comparison: "/#/databases/compare",
  workloadMonitoring: "/#/workload",
};

/* SELECTORS */

export const selectors = {
  overviewButton: getSelectorByCustomConfig("overview-button"),
  comparisonButton: getSelectorByCustomConfig("comparison-button"),
  workloadMonitoringButton: getSelectorByCustomConfig(
    "workload-monitoring-button"
  ),
  databaseListButton: getSelectorByCustomConfig("database-list-button"),
  workloadGenerationButton: getSelectorByCustomConfig(
    "workload-generation-button"
  ),
  pluginOverviewButton: getSelectorByCustomConfig("plugin-overview-button"),
  selectionListButton: getSelectorByCustomConfig("selection-list-button"),
  pluginOverview: getSelectorByCustomConfig("plugin-overview"),
  databaseList: getSelectorByCustomConfig("database-list"),
  workloadGeneration: getSelectorByCustomConfig("workload-generation"),
  selectionList: getSelectorByCustomConfig("selection-list"),
  unselectDatabase: getSelectorByCustomConfig("add-select-database-button"),
  selectDatabase: getSelectorByCustomConfig("remove-select-database-button"),
  unselectMetric: getSelectorByCustomConfig("add-select-metric-button"),
  selectMetric: getSelectorByCustomConfig("remove-select-metric-button"),
  overviewPage: getSelectorByCustomConfig("overview-page"),
  comparisonPage: getSelectorByCustomConfig("comparison-page"),
  workloadMonitoringPage: getSelectorByCustomConfig("workload-monitoring-page"),
  metricChip: getSelectorByCustomConfig("metric-chip"),
  loadingAnimation: getSelectorByCustomConfig("loading-animation"),
  historicRangeSelection: getSelectorByCustomConfig("historic-range-selection"),
  precisionSelection: getSelectorByCustomConfig("precision-selection"),
  changeRangeTypeButton: getSelectorByCustomConfig("change-range-type"),
  setStaticRangeButton: getSelectorByCustomConfig("set-static-time-range"),
  resetTimeRangeButton: getSelectorByCustomConfig("reset-time-range"),
  datePickerText: getSelectorByCustomConfig("date-picker-text"),
  timePickerText: getSelectorByCustomConfig("time-picker-text"),
  datePickerSelect: getSelectorByCustomConfig("date-picker-select"),
  timePickerSelect: getSelectorByCustomConfig("time-picker-select"),
};

export const metrics = {
  workloadMonitoring: ["queryTypeProportion", "operatorProportion"],
  comparison: [
    "throughput",
    "latency",
    "queueLength",
    "cpu",
    "ram",
    "memoryFootprint",
    "storage",
    "access",
    "operatorProportion",
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

export const historicRanges = {
  0.5: { title: "last 30 seconds", value: 30 },
  1: { title: "last minute", value: 60 },
  5: { title: "last 5 minutes", value: 5 * 60 },
  10: { title: "last 10 minutes", value: 10 * 60 },
  30: { title: "last 30 minutes", value: 30 * 60 },
  60: { title: "last 60 minutes", value: 60 * 60 },
};

export const basicPrecision = [1, 5, 15];

/* ASSERTIONS */

export function testRedirection(selector: string, newRoute: string): void {
  cy.get(selector).click();
  cy.url().should("contain", newRoute);
}

export function testElementTrigger(
  rootSelector: string,
  triggeredSelector: string
): void {
  cy.get(rootSelector).click();
  cy.get(triggeredSelector);
}

export function assertItemSelect(
  component: "database" | "metric",
  selected: boolean
): void {
  if (component === "database" && selected) {
    cy.get(selectors.selectDatabase).should("not.be.visible", {
      force: true,
    });
    cy.get(selectors.unselectDatabase).scrollIntoView().should("be.visible", {
      force: true,
    });
  } else if (component === "database" && !selected) {
    cy.get(selectors.selectDatabase)
      .scrollIntoView()
      .should("be.visible", { force: true });
    cy.get(selectors.unselectDatabase).should("not.be.visible", {
      force: true,
    });
  } else if (component === "metric" && selected) {
    cy.get(selectors.selectMetric).should("not.be.visible", {
      force: true,
    });
    cy.get(selectors.unselectMetric)
      .scrollIntoView()
      .should("be.visible", { force: true });
  } else if (component === "metric" && !selected) {
    cy.get(selectors.selectMetric)
      .scrollIntoView()
      .should("be.visible", { force: true });
    cy.get(selectors.unselectMetric).should("not.be.visible", {
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

/* get metric time request intervalls */
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
