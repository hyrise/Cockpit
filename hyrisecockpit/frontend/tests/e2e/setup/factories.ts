import * as faker from "faker";
import { assignFakeData, generateRandomFloat } from "./helpers";

//TODO: add faker for missing entities

export function fakeDatabaseData(databaseId: string): Object {
  return {
    id: databaseId,
    host: faker.random.word(),
    port: faker.random.number().toString(),
    number_workers: faker.random.number(),
    dbname: faker.database.engine()
  };
}

export function fakeDatabaseSystemData(databaseId: string): Object {
  const systemData: any = {};
  systemData[databaseId] = {
    cpu: {
      cpu_system_usage: generateRandomFloat(0, 100),
      cpu_process_usage: generateRandomFloat(0, 100),
      cpu_count: faker.random.number(),
      cpu_clock_speed: faker.random.number()
    },
    memory: {
      free: faker.random.number(),
      used: faker.random.number(),
      total: faker.random.number(),
      percent: generateRandomFloat(0, 100)
    },
    database_threads: faker.random.number()
  };
  return systemData;
}

export function fakeColumnStorageData(columnId: string): Object {
  const storageData: any = {};
  storageData[columnId] = {
    size: faker.random.number(),
    data_type: faker.database.type(),
    encoding: [faker.random.word()]
  };
  return storageData;
}

export function fakeTableStorageData(
  tableId: string,
  columnIds: string[]
): Object {
  const storageData: any = {};
  const columnFakes = columnIds.map(id => fakeColumnStorageData(id));
  storageData[tableId] = {
    size: faker.random.number(),
    number_columns: columnIds.length,
    data: assignFakeData(columnFakes)
  };
  return storageData;
}

export function fakeDatabaseStorageData(
  databaseId: string,
  tableIds: string[],
  columnIds: string[]
): Object {
  const storageData: any = {};
  const tableFakes = tableIds.map(id => fakeTableStorageData(id, columnIds));
  storageData[databaseId] = assignFakeData(tableFakes);

  return storageData;
}
