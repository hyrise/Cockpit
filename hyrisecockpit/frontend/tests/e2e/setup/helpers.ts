import * as faker from "faker";
import { fakeTimeStamp } from "./factories";

// REQUEST HELPERS

export type Entity =
  | "databases"
  | "tables"
  | "columns"
  | "chunks"
  | "queries"
  | "plugins"
  | "activated_plugins"
  | "loaded_benchmarks"
  | "workloads";
export type Request =
  | "database"
  | "system"
  | "memory_footprint"
  | "storage"
  | "throughput"
  | "latency"
  | "queue_length"
  | "chunks"
  | "detailed_query_information"
  | "workload_tables"
  | "available_plugins"
  | "plugin"
  | "plugin_log"
  | "workload"
  | "sql"
  | "worker"
  | "workload_statement_information"
  | "workload_operator_information"
  | "segment_configuration"
  | "status_workloads"
  | "status_database"
  | "negative_throughput";

export type BackendState = "up" | "down";

export type DatabaseState = "workloadRunning";

export const benchmarks = ["tpch", "tpcds", "job", "tpcc"];

export const displayedBenchmark = {
  tpch: "TPC-H (SF 1)",
  tpcds: "TPC-DS (SF 1)",
  tpcc: "TPC-C (SF 1)",
  job: "Join Order Benchmark (SF 1)",
};

export const comparisonRequests: Request[] = [
  "throughput",
  "latency",
  "queue_length",
  "system",
  "storage",
  "workload_operator_information",
  "negative_throughput",
];
export const overviewRequests: Request[] = [
  "throughput",
  "latency",
  "queue_length",
  "system",
  "storage",
  "negative_throughput",
];
export const workloadMonitoringRequests: Request[] = [
  "detailed_query_information",
  "workload_statement_information",
  "workload_operator_information",
];

const requestRoutes: Record<
  Request,
  Partial<{ get: string; post: string; delete: string; put: string }>
> = {
  database: {
    get: "**/control/database/",
    post: "**/control/database/",
    delete: "**/control/database/",
  },
  system: {
    get: "**/monitor/system**",
  },
  storage: {
    get: "**/monitor/storage**",
  },
  memory_footprint: {
    get: "**/metric/memory_footprint**",
  },
  throughput: { get: "**/metric/throughput**" },
  latency: { get: "**/metric/latency**" },
  queue_length: { get: "**/metric/queue_length**" },
  workload_statement_information: {
    get: "**/monitor/workload_statement_information**",
  },
  chunks: { get: "**/monitor/chunks**" },
  detailed_query_information: { get: "**/metric/detailed_query_information**" },
  workload_tables: {
    get: "**/control/database/workload_tables",
    post: "**/control/database/workload_tables",
    delete: "**/control/database/workload_tables",
  },
  available_plugins: { get: "**/control/plugin/available" },
  plugin: {
    get: "**/control/plugin",
    post: "**/control/plugin/**",
    delete: "**/control/plugin/**",
    put: "**/control/plugin/**",
  },
  plugin_log: { get: "**/control/plugin/log" },
  workload: {
    get: "**/workload/",
    post: "**/workload/",
    delete: "**/workload/**",
  },
  sql: { post: "**/control/sql/" },
  worker: {
    post: "**/control/database/worker",
    delete: "**/control/database/worker",
  },
  workload_operator_information: {
    get: "**/monitor/workload_operator_information**",
  },
  status_workloads: { get: "**/status/workload_tables" },
  status_database: { get: "**/status/database" },
  segment_configuration: { get: "**/monitor/segment_configuration" },
  negative_throughput: { get: "**/metric/negative_throughput**" },
};

export function getRequestRoute(
  request: Request,
  method: "get" | "post" | "delete" | "put"
): string {
  return requestRoutes[request][method]!;
}

const getAliases: Partial<Record<Request, string>> = {
  database: "getDatabases",
  system: "getSystemData",
  storage: "getStorageData",
  memory_footprint: "getMemoryFootprint",
  throughput: "getThroughput",
  latency: "getLatency",
  queue_length: "getQueueLength",
  workload_statement_information: "getStatementData",
  chunks: "getChunksData",
  detailed_query_information: "getQueryInformation",
  workload_tables: "getBenchmarks",
  available_plugins: "getAvailablePLugins",
  plugin: "getPlugin",
  plugin_log: "getPluginLog",
  workload: "getWorkloads",
  workload_operator_information: "getOperatorData",
  status_workloads: "getBenchmarkStatus",
  status_database: "getDatabaseStatus",
  segment_configuration: "getSegmentData",
  negative_throughput: "getNegativeThroughput",
};

const postAliases: Partial<Record<Request, string>> = {
  database: "addDatabase",
  workload_tables: "loadTables",
  plugin: "activatePlugin",
  workload: "startWorkload",
  sql: "sendSQL",
  worker: "startWorker",
};

const deleteAliases: Partial<Record<Request, string>> = {
  database: "removeDatabase",
  workload_tables: "removeTables",
  plugin: "deactivatePlugin",
  workload: "stopWorkload",
  worker: "stopWorker",
};

const putAliases: Partial<Record<Request, string>> = {
  plugin: "updatePlugin",
  workload: "updateWorkload",
};

const responseStatus: Record<BackendState, number> = {
  up: 200,
  down: 500,
};

export function getGetAlias(request: Request): string {
  return getAliases[request]!;
}

export function getPostAlias(request: Request): string {
  return postAliases[request]!;
}

export function getDeleteAlias(request: Request): string {
  return deleteAliases[request]!;
}

export function getPutAlias(request: Request): string {
  return putAliases[request]!;
}

export function getResponseStatus(BackendState: BackendState): number {
  return responseStatus[BackendState];
}

export function getNumberOfEntities(
  numbers: Partial<Record<Entity, number>>
): Record<Entity, number> {
  return {
    databases: 1,
    tables: 2,
    columns: 2,
    chunks: 2,
    queries: 10,
    plugins: 3,
    activated_plugins: 1,
    loaded_benchmarks: 1,
    workloads: 0,
    ...numbers,
  };
}

// ASSIGN FAKE DATA HELPERS

export function fakeDataByIdsWithTimestamps(
  ids: string[],
  type: string,
  fakeFunction: () => Object
): Object[] {
  return ids.map((id) => {
    return {
      id,
      [type]: [
        {
          timestamp: fakeTimeStamp(),
          [type]: fakeFunction(),
        },
      ],
    };
  });
}

export function fakeDataByIds(
  ids: string[],
  fakeFunction: (id: string) => Object
): Object[] {
  return ids.map((id) => fakeFunction(id));
}

export function assignFakeData(fakeData: any[]): Object {
  let newData = {};
  fakeData.forEach((data) => {
    newData = { ...newData, ...data };
  });
  return newData;
}

// FAKE DATA HELPERS

export function generateRandomFloat(min: number, range: number) {
  return Math.random() * range + min;
}

export function generateRandomInt(min: number, range: number) {
  return Math.floor(Math.random() * range + min);
}

export function generateRandomNumbers(length: number): number[] {
  return [...Array(length).keys()].map(() => faker.random.number());
}

export function selectRandomItem(array: number[]): number {
  return array[generateRandomInt(0, array.length)];
}

export function generateUniqueRandomNumbers(
  length: number,
  range: number
): number[] {
  let available = [...Array(range).keys()];
  const selected: number[] = [];
  for (let i = 0; i < length; i++) {
    const index = selectRandomItem(available);
    selected.push(index);
    available = available.filter((item) => item !== index);
  }
  return selected;
}

export function getNanoSeconds(date: Date): number {
  return date.getTime() * Math.pow(10, 6);
}

export function empty(): void {
  return;
}
