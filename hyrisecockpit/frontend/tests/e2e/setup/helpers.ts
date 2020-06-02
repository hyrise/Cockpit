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
  | "storage"
  | "throughput"
  | "latency"
  | "queue_length"
  | "chunks"
  | "detailed_query_information"
  | "benchmark_tables"
  | "available_plugins"
  | "plugin"
  | "plugin_log"
  | "workload"
  | "status"
  | "sql"
  | "worker"
  | "workload_statement_information"
  | "workload_operator_information";

export type BackendState = "up" | "down";

export type DatabaseState = "workloadRunning";

export const benchmarks = ["tpch_0_1", "tpch_1", "tpcds_1", "job_1"];

export const comparisonRequests: Request[] = [
  "throughput",
  "latency",
  "queue_length",
  "system",
  "storage",
  "workload_operator_information",
];
export const overviewRequests: Request[] = [
  "throughput",
  "latency",
  "queue_length",
  "system",
  "storage",
];
export const workloadMonitoringRequests: Request[] = [
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
  throughput: { get: "**/monitor/throughput**" },
  latency: { get: "**/monitor/latency**" },
  queue_length: { get: "**/monitor/queue_length**" },
  workload_statement_information: {
    get: "**/monitor/workload_statement_information**",
  },
  chunks: { get: "**/monitor/chunks**" },
  detailed_query_information: { get: "**/monitor/detailed_query_information" },
  status: { get: "**/monitor/status" },
  benchmark_tables: {
    get: "**/control/database/benchmark_tables",
    post: "**/control/database/benchmark_tables",
    delete: "**/control/database/benchmark_tables",
  },
  available_plugins: { get: "**/control/plugin/available" },
  plugin: {
    get: "**/control/plugin",
    post: "**/control/plugin/**",
    delete: "**/control/plugin/**",
    put: "**/control/plugin/**",
  },
  plugin_log: { get: "**/control/plugin_log" },
  workload: {
    get: "**/workload/",
    post: "**/workload/",
    delete: "**/workload/**",
    put: "**/workload/**",
  },
  sql: { post: "**/control/sql/" },
  worker: {
    post: "**/control/database/worker",
    delete: "**/control/database/worker",
  },
  workload_operator_information: {
    get: "**/monitor/workload_operator_information**",
  },
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
  throughput: "getThroughput",
  latency: "getLatency",
  queue_length: "getQueueLength",
  workload_statement_information: "getStatementData",
  chunks: "getChunksData",
  detailed_query_information: "getQueryInformation",
  benchmark_tables: "getBenchmarks",
  available_plugins: "getAvailablePLugins",
  plugin: "getPlugin",
  plugin_log: "getPluginLog",
  status: "getDatabaseWorkloadState",
  workload: "getWorkloads",
  workload_operator_information: "getOperatorData",
};

const postAliases: Partial<Record<Request, string>> = {
  database: "addDatabase",
  benchmark_tables: "loadTables",
  plugin: "activatePlugin",
  workload: "startWorkload",
  sql: "sendSQL",
  worker: "startWorker",
};

const deleteAliases: Partial<Record<Request, string>> = {
  database: "removeDatabase",
  benchmark_tables: "removeTables",
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
    let index = selectRandomItem(available);
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
