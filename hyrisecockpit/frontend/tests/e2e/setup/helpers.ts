import * as faker from "faker";

export type Entity =
  | "databases"
  | "tables"
  | "columns"
  | "chunks"
  | "queries"
  | "plugins"
  | "activated_plugins";
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
  | "workload";

export const benchmarks = ["tpch_1", "tpch_0.1", "tpcds", "job"];

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

export function getPostAlias(request: Request): string {
  return postAliases[request]!;
}

export function getDeleteAlias(request: Request): string {
  return deleteAliases[request]!;
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

export function generateRandomFloat(min: number, range: number) {
  return Math.random() * range + min;
}

export function generateRandomIds(
  length: number,
  prefix: string = ""
): string[] {
  return [...Array(length).keys()].map(() => prefix + faker.random.uuid());
}

export function generateRandomInt(min: number, range: number) {
  return Math.floor(Math.random() * range + min);
}

export function generateRandomNumbers(length: number): number[] {
  return [...Array(length).keys()].map(() => faker.random.number());
}

export function empty(): void {
  return;
}
