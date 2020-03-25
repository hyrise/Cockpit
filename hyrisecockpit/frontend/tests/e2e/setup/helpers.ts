import * as faker from "faker";

export type Entity = "databases" | "tables" | "columns" | "chunks";
export type Request =
  | "database"
  | "system"
  | "storage"
  | "throughput"
  | "latency"
  | "queue_length"
  | "krueger_data"
  | "chunks";

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

export function generateRandomIds(length: number): string[] {
  return [...Array(length).keys()].map(() => faker.random.uuid());
}

export function generateRandomInt(min: number, range: number) {
  return Math.floor(Math.random() * range + min);
}

export function generateRandomNumbers(length: number): number[] {
  return [...Array(length).keys()].map(() => faker.random.number());
}
