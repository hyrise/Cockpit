import { getSelectorByConfig } from "../helpers";

export type DatabaseData = {
  id: string;
  host: string;
  number_workers: number;
  port: string;
  dbname: string;
};

const selectors: Record<string, string> = {
  addDatabaseButton: getSelectorByConfig("span", "add-database-button"),
  addDatabase: getSelectorByConfig("div", "add-database"),
  saveDatabaseButton: getSelectorByConfig("button", "save-database-button"),
  cancelAddDatabaseButton: getSelectorByConfig(
    "button",
    "cancel-add-database-button"
  ),
  idInput: getSelectorByConfig("input", "id-input"),
  hostInput: getSelectorByConfig("input", "host-input"),
  portInput: getSelectorByConfig("input", "port-input"),
  dbNameInput: getSelectorByConfig("input", "dbname-input"),
  workerInput: getSelectorByConfig("input", "worker-input")
};

export function getSelector(component: string): string {
  return selectors[component];
}

export function assertValues(
  input: DatabaseData,
  requested: DatabaseData
): void {
  expect(input.id).to.eq(requested.id);
  expect(input.host).to.eq(requested.host);
  expect(input.number_workers).to.eq(requested.number_workers);
  expect(input.port).to.eq(requested.port);
  expect(input.dbname).to.eq(requested.dbname);
}
