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
  generateRandomInt,
  fakeDataByIds,
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
  getMockedPostCallback: (request: Request) => (payload: any) => void;
  getMockedDeleteCallback: (request: Request) => (payload?: any) => void;
} {
  const callbacks = useCallbacks(renewMockResponses);
  let mockedIds: Record<Entity, string[]> = mockIds();
  let responseMocks: Record<Request, any> = mockResponses();
  let postCallbackMocks: Partial<Record<
    Request,
    (payload: any) => void
  >> = mockPostCallbacks();
  let deleteCallbackMocks: Partial<Record<
    Request,
    (payload?: any) => void
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
      activated_plugins: [...Array(numbers.activated_plugins).keys()].map(
        () => plugins[generateRandomInt(0, plugins.length)]
      )
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

  function mockPostCallbacks(): Partial<
    Record<Request, (payload: any) => void>
  > {
    //TODO: add callbacks here
    const postCallbackMocks: Partial<Record<
      Request,
      (payload: any) => void
    >> = {};
    postCallbackMocks.database = callbacks.handleDatabaseCreation;

    return postCallbackMocks;
  }

  function mockDeleteCallbacks(): Partial<
    Record<Request, (payload?: any) => void>
  > {
    //TODO: add callbacks here
    const deleteCallbackMocks: Partial<Record<Request, () => void>> = {};

    return deleteCallbackMocks;
  }

  function getMockedPostCallback(request: Request): (payload: any) => void {
    return postCallbackMocks[request] || empty;
  }

  function getMockedDeleteCallback(request: Request): (payload?: any) => void {
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
