import { getSelectorByConfig } from "../helpers";

const selectors: Record<string, string> = {
  addDatabaseButton: getSelectorByConfig("span", "add-database-button"),
  addDatabase: getSelectorByConfig("div", "add-database"),
  saveDatabaseButton: getSelectorByConfig("button", "save-database-button")
};

export function getSelector(component: string): string {
  return selectors[component];
}
