import { getSelectorByCustomConfig, roundNumber } from "../helpers";

export type DatabaseData = {
  id: string;
  host: string;
  number_workers: number;
  port: string;
  dbname: string;
};

export const selectors = {
  addDatabaseButton: getSelectorByCustomConfig("add-database-button"),
  addDatabase: getSelectorByCustomConfig("add-database"),
  saveDatabaseButton: getSelectorByCustomConfig("save-database-button"),
  cancelAddDatabaseButton: getSelectorByCustomConfig(
    "cancel-add-database-button"
  ),
  removeDatabaseButton: getSelectorByCustomConfig("remove-database-button"),
  removeDatabase: getSelectorByCustomConfig("remove-database"),
  deleteDatabaseButton: getSelectorByCustomConfig("delete-database-button"),
  cancelRemoveDatabaseButton: getSelectorByCustomConfig(
    "cancel-remove-database-button"
  ),
  advancedInputButton: getSelectorByCustomConfig("advanced-input-button"),
  idInput: getSelectorByCustomConfig("id-input"),
  hostInput: getSelectorByCustomConfig("host-input"),
  portInput: getSelectorByCustomConfig("port-input"),
  workerInput: getSelectorByCustomConfig("worker-input"),
  databaseDetailsPanel: getSelectorByCustomConfig("database-details-panel"),
  databaseSystemDetails: getSelectorByCustomConfig("database-system-details"),
  hostDetails: getSelectorByCustomConfig("database-host"),
  memoryCapacityDetails: getSelectorByCustomConfig("database-memory-capacity"),
  memoryFootprintDetails: getSelectorByCustomConfig(
    "database-memory-footprint"
  ),
  cpuDetails: getSelectorByCustomConfig("database-number-cpus"),
  workerDetails: getSelectorByCustomConfig("database-number-workers"),
  numberOfDatabases: getSelectorByCustomConfig("number-of-databases"),
  databaseChip: getSelectorByCustomConfig("database-chip"),
  sqlInput: getSelectorByCustomConfig("sql-input"),
  openSQLDialog: getSelectorByCustomConfig("open-sql-dialog"),
  closeSQLDialog: getSelectorByCustomConfig("close-sql-dialog"),
  closeSQLInput: getSelectorByCustomConfig("close-sql-input"),
  sendSQLInput: getSelectorByCustomConfig("send-sql-input"),
};

export function assertPostRequest(
  input: DatabaseData,
  requested: DatabaseData
): void {
  expect(requested.id).to.eq(requested.id);
  expect(input.host).to.eq(requested.host);
  expect(input.number_workers).to.eq(requested.number_workers);
  expect(input.port).to.eq(requested.port);
}

export function assertDeleteRequest(
  input: string,
  requested: { id: string }
): void {
  expect(input).to.eq(requested.id);
}

export function assertSQLRequest(
  database: string,
  query: string,
  requested: { id: string; query: string }
): void {
  expect(database).to.eq(requested.id);
  expect(query).to.eq(requested.query);
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
