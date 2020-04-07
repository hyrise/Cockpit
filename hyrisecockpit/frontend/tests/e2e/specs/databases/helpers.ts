import { getSelectorByConfig, roundNumber } from "../helpers";

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
  removeDatabaseButton: getSelectorByConfig("button", "remove-database-button"),
  removeDatabase: getSelectorByConfig("div", "remove-database"),
  deleteDatabaseButton: getSelectorByConfig("button", "delete-database-button"),
  cancelRemoveDatabaseButton: getSelectorByConfig(
    "button",
    "cancel-remove-database-button"
  ),
  advancedInputButton: getSelectorByConfig("button", "advanced-input-button"),
  idInput: getSelectorByConfig("input", "id-input"),
  hostInput: getSelectorByConfig("input", "host-input"),
  portInput: getSelectorByConfig("input", "port-input"),
  dbNameInput: getSelectorByConfig("input", "dbname-input"),
  workerInput: getSelectorByConfig("input", "worker-input"),
  userInput: getSelectorByConfig("input", "user-input"),
  passwordInput: getSelectorByConfig("input", "password-input"),
  databaseDetailsPanel: getSelectorByConfig("div", "database-details-panel"),
  databaseSystemDetails: getSelectorByConfig("div", "database-system-details"),
  idDetails: getSelectorByConfig("div", "database-id"),
  hostDetails: getSelectorByConfig("div", "database-host"),
  memoryCapacityDetails: getSelectorByConfig("div", "database-memory-capacity"),
  memoryFootprintDetails: getSelectorByConfig(
    "div",
    "database-memory-footprint"
  ),
  cpuDetails: getSelectorByConfig("div", "database-number-cpus"),
  workerDetails: getSelectorByConfig("div", "database-number-workers"),
  numberOfDatabases: getSelectorByConfig("span", "number-of-databases"),
  databaseChip: getSelectorByConfig("span", "database-chip")
};

export function getSelector(component: string): string {
  return selectors[component];
}

export function assertAdvancedPostValues(
  input: DatabaseData,
  requested: DatabaseData
): void {
  expect(input.id).to.eq(requested.id);
  expect(input.host).to.eq(requested.host);
  expect(input.number_workers).to.eq(requested.number_workers);
  expect(input.port).to.eq(requested.port);
  expect(input.dbname).to.eq(requested.dbname);
}

export function assertDefaultPostValues(
  input: DatabaseData,
  requested: DatabaseData
): void {
  expect(input.host).to.eq(requested.host);
  expect(input.number_workers).to.eq(requested.number_workers);
  expect(requested.id).to.eq(requested.host);
  expect(input.host).to.eq(requested.id);
}

export function assertDeleteValues(
  input: string,
  requested: { id: string }
): void {
  expect(input).to.eq(requested.id);
}

// DATA HELPERS

function getTableMemoryFootprint(data: any): number {
  return roundNumber(
    Object.values(data).reduce(
      (sum1: number, table: any) => sum1 + table.size,
      0
    ),
    Math.pow(10, 3),
    1 / Math.pow(10, 3),
    false
  );
}

export function getDatabaseMemoryFootprint(data: any): number {
  const memory: number[] = [];
  Object.entries(data).forEach(([table, tableData]: [string, any]) => {
    memory.push(getTableMemoryFootprint(tableData.data));
  });
  return roundNumber(
    memory.reduce((total, tableMemory) => total + tableMemory, 0),
    Math.pow(10, 3),
    Math.pow(10, 3),
    false
  );
}

export function getDatabaseMainMemoryCapacity(data: any): number {
  return roundNumber(
    data.memory.total,
    Math.pow(10, 3),
    1 / Math.pow(10, 6),
    false
  );
}
