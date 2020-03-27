import {
  fakeDatabaseData,
  fakeDatabaseSystemData,
  fakeDatabaseStorageData,
  fakeNumberData,
  fakeKruegerData,
  fakeDatabaseChunksData,
  fakeDatabaseQueryInformationData,
  fakeDatabasePluginsData,
  fakeDatabasePluginSettings,
  fakeDatabasePluginLogs
} from "./factories";
import {
  assignFakeData,
  generateRandomIds,
  fakeDataByIds,
  generateUniqueRandomNumbers,
  Entity,
  Request,
  benchmarks,
  empty
} from "./helpers";
import { useCallbacks } from "./callbacks";

/* mocks containing fake data */

export function useMocks(
  numbers: Record<Entity, number>
): {
  renewMocks: () => void;
  renewMockResponses: () => void;
  getMockedResponse(request: Request): any;
  getMockedPostCallback: (request: Request) => (id: string) => void;
  getMockedDeleteCallback: (request: Request) => (id: string) => void;
} {
  const callbacks = useCallbacks(
    addMockedId,
    removeMockedId,
    renewMockResponses
  );
  let mockedIds: Record<Entity, string[]> = mockIds();
  let responseMocks: Record<Request, any> = mockResponses();
  let postCallbackMocks: Partial<Record<
    Request,
    (id: string) => void
  >> = mockPostCallbacks();
  let deleteCallbackMocks: Partial<Record<
    Request,
    (id: string) => void
  >> = mockDeleteCallbacks();

  function renewMocks(): void {
    mockedIds = mockIds();
    responseMocks = mockResponses();
  }

  function renewMockResponses(): void {
    responseMocks = mockResponses();
  }

  function mockIds(): Record<Entity, string[]> {
    const plugins = generateRandomIds(numbers.plugins, "plugin-");
    return {
      databases: generateRandomIds(numbers.databases, "database-"),
      tables: generateRandomIds(numbers.tables, "table-"),
      columns: generateRandomIds(numbers.columns, "column-"),
      chunks: [],
      queries: [],
      plugins: plugins,
      activated_plugins: generateUniqueRandomNumbers(
        numbers.activated_plugins,
        plugins.length
      ).map(index => plugins[index])
    };
  }

  function mockResponses(): Record<Request, any> {
    const responseMocks: Partial<Record<Request, any>> = {};

    responseMocks.database = fakeDataByIds(
      mockedIds.databases,
      fakeDatabaseData
    );
    responseMocks.storage = {
      storage: assignFakeData(
        mockedIds.databases.map(id =>
          fakeDatabaseStorageData(id, mockedIds.tables, mockedIds.columns)
        )
      )
    };
    responseMocks.system = {
      system_data: assignFakeData(
        fakeDataByIds(mockedIds.databases, fakeDatabaseSystemData)
      )
    };
    responseMocks.throughput = {
      throughput: assignFakeData(
        fakeDataByIds(mockedIds.databases, fakeNumberData)
      )
    };
    responseMocks.latency = {
      latency: assignFakeData(
        fakeDataByIds(mockedIds.databases, fakeNumberData)
      )
    };
    responseMocks.queue_length = {
      queue_length: assignFakeData(
        fakeDataByIds(mockedIds.databases, fakeNumberData)
      )
    };
    responseMocks.krueger_data = fakeDataByIds(
      mockedIds.databases,
      fakeKruegerData
    );
    responseMocks.chunks = {
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
    responseMocks.detailed_query_information = mockedIds.databases.map(id =>
      fakeDatabaseQueryInformationData(id, numbers.queries)
    );
    //TODO: handle loaded tables for every database
    responseMocks.data = benchmarks;
    responseMocks.available_plugins = mockedIds.plugins;
    // NOTE: currently all databases have the same plugins activated
    responseMocks.plugin = mockedIds.databases.map(id =>
      fakeDatabasePluginsData(id, mockedIds.activated_plugins)
    );
    responseMocks.plugin_settings = {
      plugin_settings: mockedIds.databases.map(id =>
        fakeDatabasePluginSettings(id, mockedIds.activated_plugins)
      )
    };
    // NOTE: currently all databases have exactly one log entry
    responseMocks.plugin_log = mockedIds.databases.map(id =>
      fakeDatabasePluginLogs(id, mockedIds.plugins)
    );
    return responseMocks as Record<Request, any>;
  }

  function addMockedId(entity: Entity, id: string): void {
    mockedIds[entity].push(id);
  }

  function removeMockedId(entity: Entity, id: string): void {
    mockedIds[entity] = mockedIds[entity].filter(
      availableId => availableId !== id
    );
  }

  function mockPostCallbacks(): Partial<Record<Request, (id: string) => void>> {
    //TODO: add callbacks here
    const postCallbackMocks: Partial<Record<Request, (id: string) => void>> = {
      database: callbacks.handleAddDatabase
    };

    return postCallbackMocks;
  }

  function mockDeleteCallbacks(): Partial<
    Record<Request, (id: string) => void>
  > {
    //TODO: add callbacks here
    const deleteCallbackMocks: Partial<Record<
      Request,
      (id: string) => void
    >> = {
      database: callbacks.handleRemoveDatabase
    };

    return deleteCallbackMocks;
  }

  function getMockedPostCallback(request: Request): (id: string) => void {
    return postCallbackMocks[request] || empty;
  }

  function getMockedDeleteCallback(request: Request): (id: string) => void {
    return deleteCallbackMocks[request] || empty;
  }

  function getMockedResponse(request: Request): any {
    return responseMocks[request];
  }

  return {
    renewMocks,
    renewMockResponses,
    getMockedResponse,
    getMockedPostCallback,
    getMockedDeleteCallback
  };
}
