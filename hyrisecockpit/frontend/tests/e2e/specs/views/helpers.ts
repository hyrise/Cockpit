import { getSelectorByConfig } from "../helpers";

const routes: Record<string, string> = {
  home: "/",
  overview: "databases/overview",
  comparison: "databases/compare",
  workloadMonitoring: "workload"
};

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
  pluginOverview: getSelectorByConfig("div", "plugin-overview"),
  databaseList: getSelectorByConfig("div", "database-list"),
  workloadGeneration: getSelectorByConfig("div", "workload-generation")
};

export function getSelector(component: string): string {
  return selectors[component];
}

export function getRoute(component: string): string {
  return routes[component];
}
