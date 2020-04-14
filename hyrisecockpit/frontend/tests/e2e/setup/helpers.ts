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
  | "loaded_benchmarks";
export type Request =
  | "database"
  | "system"
  | "storage"
  | "throughput"
  | "latency"
  | "queue_length"
  | "krueger_data"
  | "chunks"
  | "detailed_query_information"
  | "data"
  | "available_plugins"
  | "plugin"
  | "plugin_settings"
  | "plugin_log"
  | "workload"
  | "status";

export type BackendState = "up" | "down";

export type DatabaseState = "workloadRunning";

export const benchmarks = ["tpch_0_1", "tpch_1", "tpcds_1", "job_1"];

const getAliases: Partial<Record<Request, string>> = {
  database: "getDatabases",
  system: "getSystemData",
  storage: "getStorageData",
  throughput: "getThroughput",
  latency: "getLatency",
  queue_length: "getQueueLength",
  krueger_data: "getKruegerData",
  chunks: "getChunksData",
  detailed_query_information: "getQueryInformation",
  data: "getData",
  available_plugins: "getAvailablePLugins",
  plugin: "getPlugin",
  plugin_settings: "getPluginSettings",
  plugin_log: "getPluginLog",
  status: "getDatabaseWorkloadState"
};

const postAliases: Partial<Record<Request, string>> = {
  database: "addDatabase",
  data: "loadTables",
  plugin: "activatePlugin",
  plugin_settings: "setPluginSettings",
  workload: "startWorkload"
};

const deleteAliases: Partial<Record<Request, string>> = {
  database: "removeDatabase",
  data: "removeTables",
  plugin: "deactivatePlugin",
  workload: "stopWorkload"
};

const responseStatus: Record<BackendState, number> = {
  up: 200,
  down: 500
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

export function getResponseStatus(BackendState: BackendState): number {
  return responseStatus[BackendState];
}

// ASSIGN FAKE DATA HELPERS

export function fakeDataByIdsWithTimestamps(
  ids: string[],
  type: string,
  fakeFunction: () => Object
): Object[] {
  return ids.map(id => {
    return {
      id,
      [type]: [
        {
          timestamp: fakeTimeStamp(),
          [type]: fakeFunction()
        }
      ]
    };
  });
}

export function fakeDataByIds(
  ids: string[],
  fakeFunction: (id: string) => Object
): Object[] {
  return ids.map(id => fakeFunction(id));
}

export function assignFakeData(fakeData: any[]): Object {
  let newData = {};
  fakeData.forEach(data => {
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
    available = available.filter(item => item !== index);
  }
  return selected;
}

export function getNanoSeconds(date: Date): number {
  return date.getTime() * Math.pow(10, 6);
}

export function empty(): void {
  return;
}
