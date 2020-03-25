import {
  fakeDatabaseData,
  fakeDatabaseSystemData,
  fakeDatabaseStorageData
} from "./factories";
import * as faker from "faker";
import { assignFakeData } from "./helpers";

export type Entity = "databases" | "tables" | "columns";
export type Request = "database" | "system" | "storage";

function getRandomIds(number: number): string[] {
  return [...Array(number).keys()].map(() => faker.random.uuid());
}

// TODO: mock missing Requests
export function useMocks(
  numbers: Record<Entity, number>
): { mockRequests: () => void; getMockedResponse(request: Request): any } {
  const mockedIds: Record<Entity, string[]> = {
    databases: getRandomIds(numbers.databases),
    tables: getRandomIds(numbers.tables),
    columns: getRandomIds(numbers.columns)
  };
  const requestMocks: Partial<Record<Request, any>> = {};

  function mockRequests(): void {
    requestMocks.database = mockedIds.databases.map(id => fakeDatabaseData(id));
    const storageFake = mockedIds.databases.map(id =>
      fakeDatabaseStorageData(id, mockedIds.tables, mockedIds.columns)
    );
    const systemFake = mockedIds.databases.map(id =>
      fakeDatabaseSystemData(id)
    );
    requestMocks.storage = { storage: assignFakeData(storageFake) };
    requestMocks.system = { system_data: assignFakeData(systemFake) };
  }

  function getMockedResponse(request: Request): any {
    return requestMocks[request];
  }

  return { mockRequests, getMockedResponse };
}
