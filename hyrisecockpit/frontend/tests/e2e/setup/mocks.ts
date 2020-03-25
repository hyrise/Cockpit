import {
  fakeDatabaseData,
  fakeDatabaseSystemData,
  fakeDatabaseStorageData
} from "./factories";
import { assignFakeData, generateRandomIds } from "./helpers";

export type Entity = "databases" | "tables" | "columns";
export type Request = "database" | "system" | "storage";

// TODO: mock missing Requests
export function useMocks(
  numbers: Record<Entity, number>
): { renewMocks: () => void; getMockedResponse(request: Request): any } {
  let mockedIds: Record<Entity, string[]> = mockIds();
  let requestMocks: Record<Request, any> = mockRequests();

  function renewMocks(): void {
    mockedIds = mockIds();
    requestMocks = mockRequests();
  }

  function mockIds(): Record<Entity, string[]> {
    return {
      databases: generateRandomIds(numbers.databases),
      tables: generateRandomIds(numbers.tables),
      columns: generateRandomIds(numbers.columns)
    };
  }

  function mockRequests(): Record<Request, any> {
    const requestMocks: Partial<Record<Request, any>> = {};
    requestMocks.database = mockedIds.databases.map(id => fakeDatabaseData(id));
    const storageFake = mockedIds.databases.map(id =>
      fakeDatabaseStorageData(id, mockedIds.tables, mockedIds.columns)
    );
    const systemFake = mockedIds.databases.map(id =>
      fakeDatabaseSystemData(id)
    );
    requestMocks.storage = { storage: assignFakeData(storageFake) };
    requestMocks.system = { system_data: assignFakeData(systemFake) };
    return requestMocks as Record<Request, any>;
  }

  function getMockedResponse(request: Request): any {
    return requestMocks[request];
  }

  return { renewMocks, getMockedResponse };
}
