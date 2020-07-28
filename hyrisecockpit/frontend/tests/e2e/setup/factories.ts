import * as faker from "faker";
import {
  assignFakeData,
  generateRandomFloat,
  generateRandomInt,
  generateRandomNumbers,
  generateUniqueRandomNumbers,
  getNanoSeconds,
  benchmarks,
} from "./helpers";

/* factories to fake all request data */

type Database = {
  host: string;
  port: string;
  number_workers: number;
  dbname: string;
};

// TIME

export function fakeTimeStamp(): number {
  return getNanoSeconds(new Date());
}

// IDS

export function fakeId(prefix: string, key: number): string {
  return `${prefix}-${key}`;
}

export function fakeIds(length: number, prefix: string = ""): string[] {
  return [...Array(length).keys()].map((key) => fakeId(prefix, key));
}

// DATABASES

export function fakeDatabaseData(
  databaseId: string,
  predefined?: Database
): Object {
  if (predefined)
    return {
      id: databaseId,
      ...predefined,
    };
  return {
    id: databaseId,
    host: faker.random.word(),
    port: faker.random.number().toString(),
    number_workers: faker.random.number(),
    dbname: faker.database.engine(),
  };
}

// SYSTEM DATA

export function fakeDatabaseSystemData(): Object {
  return {
    cpu: {
      cpu_system_usage: generateRandomFloat(0, 100),
      cpu_process_usage: generateRandomFloat(0, 100),
      cpu_count: faker.random.number(),
      cpu_clock_speed: faker.random.number(),
    },
    memory: {
      free: generateRandomInt(Math.pow(10, 8), Math.pow(10, 8)),
      used: generateRandomInt(Math.pow(10, 8), Math.pow(10, 8)),
      total: generateRandomInt(Math.pow(10, 9), Math.pow(10, 10)),
      percent: generateRandomFloat(0, 1),
    },
    database_threads: faker.random.number(),
  };
}

// STORAGE DATA

function fakeEncodingData(): Object {
  return {
    amount: faker.random.number(),
    compression: [faker.random.word()],
    name: faker.random.word(),
  };
}

function fakeColumnStorageData(columnId: string): Object {
  const storageData: any = {};
  storageData[columnId] = {
    size: faker.random.number(),
    data_type: faker.database.type(),
    encoding: [fakeEncodingData()],
  };
  return storageData;
}

function fakeTableStorageData(tableId: string, columnIds: string[]): Object {
  const storageData: any = {};
  storageData[tableId] = {
    size: faker.random.number(),
    number_columns: columnIds.length,
    data: assignFakeData(
      columnIds.map((id) => fakeColumnStorageData(`${tableId}-${id}`))
    ),
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
    tableIds.map((id) => fakeTableStorageData(id, columnIds))
  );
  return storageData;
}

// GENERIC NUMBER DATA

export function fakeNumberData(): Object {
  return faker.random.number();
}

// QUERY TYPE PROPORTION DATA

function fakeQueryTypeProportionData(suffix: number): Object {
  return {
    query_type: faker.random.word() + suffix,
    total_latency: generateRandomInt(1, Math.pow(10, 3)) * Math.pow(10, 6),
    total_frequency: faker.random.number(Math.pow(10, 3)),
  };
}

export function fakeDatabaseQueryTypeData(
  datebaseId: string,
  numberOfTypes: number
): Object {
  return {
    id: datebaseId,
    workload_statement_information: [
      ...Array(numberOfTypes).keys(),
    ].map((key) => fakeQueryTypeProportionData(key)),
  };
}

// OPERATOR DATA
function fakeOperatorData(suffix: number): Object {
  return {
    operator: faker.random.word() + suffix,
    total_time_ns: generateRandomInt(1, Math.pow(10, 3)) * Math.pow(10, 6),
  };
}

export function fakeDatabaseOperatorData(
  databaseId: string,
  numberOfOperators: number
): Object {
  return {
    id: databaseId,
    workload_operator_information: [
      ...Array(numberOfOperators).keys(),
    ].map((key) => fakeOperatorData(key)),
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
    columnIds.map((id) =>
      fakeColumnChunksData(`${tableId}-${id}`, numberOfChunks)
    )
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
    tableIds.map((id) => fakeTableChunksData(id, columnIds, numberOfChunks))
  );
  return data;
}

// DETAILED QUERY INFORMATION DATA

function fakeQueryInformationData(latency: number): Object {
  return {
    benchmark: benchmarks[generateRandomInt(0, benchmarks.length)],
    query_number: latency / Math.pow(10, 3),
    throughput: generateRandomInt(0, 100),
    latency: latency,
  };
}

export function fakeDatabaseQueryInformationData(
  databaseId: string,
  numberOfQueries: number
): Object {
  // ensure uniquenes of latency data
  const latencyData = generateUniqueRandomNumbers(
    numberOfQueries,
    Math.pow(10, 3) - Math.pow(10, 2)
  ).map((latency: any) => latency + Math.pow(10, 2));
  return {
    id: databaseId,
    details_query_information: [
      ...Array(numberOfQueries).keys(),
    ].map((idx: number) =>
      fakeQueryInformationData(latencyData[idx] * Math.pow(10, 6))
    ),
  };
}

// PLUGIN DATA

export function fakeAvailablePlugin(plugin: string): Object {
  return { name: plugin };
}

export function fakeDatabasePluginsData(
  databaseId: string,
  plugins: string[]
): Object {
  return {
    id: databaseId,
    plugins: plugins.map((plugin) => {
      return { name: plugin, settings: [fakePluginSetting(plugin)] };
    }),
  };
}

type PluginSetting = {
  name: string;
  value: number;
  description: string;
};

function fakePluginSetting(plugin: string): PluginSetting {
  return {
    name: plugin + "_" + faker.random.word(),
    value: faker.random.number(),
    description: faker.random.words(),
  };
}

export function fakeDatabasePluginSettings(
  databaseId: string,
  plugins: string[]
): Object {
  return {
    id: databaseId,
    plugin_settings: plugins.map((plugin) => fakePluginSetting(plugin)),
  };
}

function fakePluginLog(pluginId: string): Object {
  return {
    timestamp: faker.date.past().getTime(),
    reporter: pluginId,
    message: faker.random.words(),
  };
}

export function fakeDatabasePluginLogs(
  databaseId: string,
  pluginIds: string[]
): Object {
  return {
    id: databaseId,
    plugin_log: pluginIds.map((id) => fakePluginLog(id)),
  };
}

// WORKLOADS

export function fakeDatabaseStatusData(
  databaseId: string,
  state: boolean
): Object {
  return {
    id: databaseId,
    hyrise_active: true,
    database_blocked_status: false,
    worker_pool_status: state ? "running" : "",
  };
}

export function fakeBenchmarkStatusData(
  databaseId: string,
  loadedBenchmarks: string[]
): Object {
  return {
    id: databaseId,
    loaded_benchmarks: loadedBenchmarks,
    loaded_tables: [],
  };
}

export function fakeWorkloadData(benchmark: string): Object {
  return {
    weights: {},
    frequency: faker.random.number(),
    folder_name: benchmark,
  };
}
