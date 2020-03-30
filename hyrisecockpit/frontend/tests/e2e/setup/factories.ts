import * as faker from "faker";
import {
  assignFakeData,
  generateRandomFloat,
  generateRandomInt,
  generateRandomNumbers,
  benchmarks
} from "./helpers";

/* factories to fake all request data */

type Database = {
  host: string;
  port: string;
  number_workers: number;
  dbname: string;
};

// IDS

export function fakeId(prefix: string): string {
  return prefix + faker.random.uuid();
}

export function fakeIds(length: number, prefix: string = ""): string[] {
  return [...Array(length).keys()].map(() => fakeId(prefix));
}

// DATABASES

export function fakeDatabaseData(
  databaseId: string,
  predefined?: Database
): Object {
  if (predefined)
    return {
      id: databaseId,
      ...predefined
    };
  return {
    id: databaseId,
    host: faker.random.word(),
    port: faker.random.number().toString(),
    number_workers: faker.random.number(),
    dbname: faker.database.engine()
  };
}

// SYSTEM DATA

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
      free: generateRandomInt(Math.pow(10, 8), Math.pow(10, 8)),
      used: generateRandomInt(Math.pow(10, 8), Math.pow(10, 8)),
      total: generateRandomInt(Math.pow(10, 9), Math.pow(10, 10)),
      percent: generateRandomFloat(0, 100)
    },
    database_threads: faker.random.number()
  };
  return systemData;
}

// STORAGE DATA

function fakeColumnStorageData(columnId: string): Object {
  const storageData: any = {};
  storageData[columnId] = {
    size: faker.random.number(),
    data_type: faker.database.type(),
    encoding: [faker.random.word()]
  };
  return storageData;
}

function fakeTableStorageData(tableId: string, columnIds: string[]): Object {
  const storageData: any = {};
  storageData[tableId] = {
    size: faker.random.number(),
    number_columns: columnIds.length,
    data: assignFakeData(columnIds.map(id => fakeColumnStorageData(id)))
  };
  return storageData;
}

export function fakeDatabaseStorageData(
  databaseId: string,
  tableIds: string[],
  columnIds: string[]
): Object {
  const storageData: any = {};
  storageData[databaseId] = assignFakeData(
    tableIds.map(id => fakeTableStorageData(id, columnIds))
  );
  return storageData;
}

// GENERIC NUMBER DATA

export function fakeNumberData(databaseId: string): Object {
  const data: any = {};
  data[databaseId] = faker.random.number();
  return data;
}

// QUERY TYPE PROPORTION DATA

function fakeQueryTypeProportion(): Object {
  return {
    SELECT: generateRandomInt(0, 100),
    INSERT: generateRandomInt(0, 100),
    UPDATE: generateRandomInt(0, 100),
    DELETE: generateRandomInt(0, 100)
  };
}

export function fakeKruegerData(datebaseId: string): Object {
  return {
    id: datebaseId,
    executed: fakeQueryTypeProportion(),
    generated: fakeQueryTypeProportion()
  };
}

// CHUNKS DATA

function fakeColumnChunksData(
  columnId: string,
  numberOfChunks: number
): Object {
  const data: any = {};
  data[columnId] = generateRandomNumbers(numberOfChunks);
  return data;
}

function fakeTableChunksData(
  tableId: string,
  columnIds: string[],
  numberOfChunks: number
): Object {
  const data: any = {};
  data[tableId] = assignFakeData(
    columnIds.map(id => fakeColumnChunksData(id, numberOfChunks))
  );
  return data;
}

export function fakeDatabaseChunksData(
  databaseId: string,
  tableIds: string[],
  columnIds: string[],
  numberOfChunks: number
): Object {
  const data: any = {};
  data[databaseId] = assignFakeData(
    tableIds.map(id => fakeTableChunksData(id, columnIds, numberOfChunks))
  );
  return data;
}

// DETAILED QUERY INFORMATION DATA

function fakeQueryInformationData(): Object {
  return {
    benchmark: benchmarks[generateRandomInt(0, benchmarks.length)],
    query_number: faker.random.number(),
    throughput: faker.random.number(),
    latency: faker.random.number()
  };
}

export function fakeDatabaseQueryInformationData(
  databaseId: string,
  numberOfQueries: number
): Object {
  return {
    id: databaseId,
    query_information: [...Array(numberOfQueries).keys()].map(() =>
      fakeQueryInformationData()
    )
  };
}

// PLUGIN DATA

export function fakeDatabasePluginsData(
  databaseId: string,
  plugins: string[]
): Object {
  return { id: databaseId, plugins: plugins };
}

type PluginSetting = {
  name: string;
  value: number;
  description: string;
};

function fakePluginSetting(): PluginSetting {
  return {
    name: faker.random.word(),
    value: faker.random.number(),
    description: faker.random.words()
  };
}

export function fakeDatabasePluginSettings(
  databaseId: string,
  plugins: string[]
): Object {
  return {
    id: databaseId,
    plugin_settings: plugins.map(() => fakePluginSetting())
  };
}

function fakePluginLog(pluginId: string): Object {
  return {
    timestamp: faker.date.past().getTime(),
    reporter: pluginId,
    message: faker.random.words()
  };
}

export function fakeDatabasePluginLogs(
  databaseId: string,
  pluginIds: string[]
): Object {
  return { id: databaseId, plugin_log: pluginIds.map(id => fakePluginLog(id)) };
}
