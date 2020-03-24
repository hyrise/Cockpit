import {
  fakeDatabaseData,
  fakeDatabaseSystemData,
  fakeDatabaseStorageData
} from "../factories";
import * as faker from "faker";

export type Entity = "databases" | "tables" | "columns";
export type Query = "database" | "system" | "storage";

function getRandomIds(number: number): string[] {
  return [...Array(number).keys()].map(() => faker.random.word());
}

// TODO: mock missing queries
export function useMocks(
  numbers: Record<Entity, number>
): { mockQueries: () => void; getMockedResponse(query: Query): any } {
  const mockedIds: Record<Entity, string[]> = {
    databases: getRandomIds(numbers.databases),
    tables: getRandomIds(numbers.tables),
    columns: getRandomIds(numbers.columns)
  };
  const queryMocks: Partial<Record<Query, any>> = {};

  function mockQueries(): void {
    queryMocks.database = mockedIds.databases.map(id => fakeDatabaseData(id));
    queryMocks.storage = { storage: {} };
    queryMocks.system = { system_data: {} };
    mockedIds.databases
      .map(id =>
        fakeDatabaseStorageData(id, mockedIds.tables, mockedIds.columns)
      )
      .forEach(database => {
        queryMocks.storage.storage = {
          ...queryMocks.storage.storage,
          ...database
        };
      });
    mockedIds.databases
      .map(id => fakeDatabaseSystemData(id))
      .forEach(database => {
        queryMocks.system.system_data = {
          ...queryMocks.system.system_data,
          ...database
        };
      });
  }

  function getMockedResponse(query: Query): any {
    return queryMocks[query];
  }

  return { mockQueries, getMockedResponse };
}
