import {
  fakeDatabaseData,
  fakeDatabaseSystemData,
  fakeDatabaseStorageData,
  fakeNumberData,
  fakeKruegerData,
  fakeDatabaseChunksData,
  fakeDatabaseQueryInformationData
} from "./factories";
import {
  assignFakeData,
  generateRandomIds,
  fakeDataByIds,
  Entity,
  Request
} from "./helpers";

/* mocks containing fake data */

// TODO: mock missing Requests
export function useMocks(
  numbers: Record<Entity, number>
): { renewMocks: () => void; getResponseMock(request: Request): any } {
  let mockedIds: Record<Entity, string[]> = mockIds();
  let requestMocks: Record<Request, any> = mockRequests();

  function renewMocks(): void {
    mockedIds = mockIds();
    requestMocks = mockRequests();
  }

  function mockIds(): Record<Entity, string[]> {
    return {
      databases: generateRandomIds(numbers.databases, "database-"),
      tables: generateRandomIds(numbers.tables, "table-"),
      columns: generateRandomIds(numbers.columns, "column-"),
      chunks: [],
      queries: []
    };
  }

  function mockRequests(): Record<Request, any> {
    const requestMocks: Partial<Record<Request, any>> = {};

    // fake data for all requests
    requestMocks.database = fakeDataByIds(
      mockedIds.databases,
      fakeDatabaseData
    );
    requestMocks.storage = {
      storage: assignFakeData(
        mockedIds.databases.map(id =>
          fakeDatabaseStorageData(id, mockedIds.tables, mockedIds.columns)
        )
      )
    };
    requestMocks.system = {
      system_data: assignFakeData(
        fakeDataByIds(mockedIds.databases, fakeDatabaseSystemData)
      )
    };
    requestMocks.throughput = {
      throughput: assignFakeData(
        fakeDataByIds(mockedIds.databases, fakeNumberData)
      )
    };
    requestMocks.latency = {
      latency: assignFakeData(
        fakeDataByIds(mockedIds.databases, fakeNumberData)
      )
    };
    requestMocks.queue_length = {
      queue_length: assignFakeData(
        fakeDataByIds(mockedIds.databases, fakeNumberData)
      )
    };
    requestMocks.krueger_data = fakeDataByIds(
      mockedIds.databases,
      fakeKruegerData
    );
    requestMocks.chunks = {
      chunks_data: assignFakeData(
        mockedIds.databases.map(id =>
          fakeDatabaseChunksData(
            id,
            mockedIds.tables,
            mockedIds.columns,
            numbers.chunks
          )
        )
      )
    };
    requestMocks.detailed_query_information = mockedIds.databases.map(id =>
      fakeDatabaseQueryInformationData(id, numbers.queries)
    );

    return requestMocks as Record<Request, any>;
  }

  function getResponseMock(request: Request): any {
    return requestMocks[request];
  }

  return { renewMocks, getResponseMock };
}
