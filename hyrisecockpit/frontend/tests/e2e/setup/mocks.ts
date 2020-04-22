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
  fakeDatabasePluginLogs,
  fakeDatabaseStatusData,
  fakeIds,
} from "./factories";
import {
  assignFakeData,
  fakeDataByIds,
  fakeDataByIdsWithTimestamps,
  generateUniqueRandomNumbers,
  Entity,
  Request,
  benchmarks,
  DatabaseState,
  empty,
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
  let mockedState: Record<DatabaseState, boolean> = { workloadRunning: false };
  const callbacks = useCallbacks(
    addMockedId,
    removeMockedId,
    changeMockedState,
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
    const plugins = fakeIds(numbers.plugins, "plugin-");
    return {
      databases: fakeIds(numbers.databases, "database-"),
      tables: fakeIds(numbers.tables, "table-"),
      columns: fakeIds(numbers.columns, "column-"),
      chunks: [],
      queries: [],
      plugins: plugins,
      activated_plugins: generateUniqueRandomNumbers(
        numbers.activated_plugins,
        plugins.length
      ).map((index) => plugins[index]),
      loaded_benchmarks: generateUniqueRandomNumbers(
        numbers.loaded_benchmarks,
        benchmarks.length
      ).map((index) => benchmarks[index]),
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
        mockedIds.databases.map((id) =>
          fakeDatabaseStorageData(id, mockedIds.tables, mockedIds.columns)
        )
      ),
    };
    responseMocks.system = fakeDataByIdsWithTimestamps(
      mockedIds.databases,
      "system_data",
      fakeDatabaseSystemData
    );
    responseMocks.throughput = fakeDataByIdsWithTimestamps(
      mockedIds.databases,
      "throughput",
      fakeNumberData
    );
    responseMocks.latency = fakeDataByIdsWithTimestamps(
      mockedIds.databases,
      "latency",
      fakeNumberData
    );
    responseMocks.queue_length = fakeDataByIdsWithTimestamps(
      mockedIds.databases,
      "queue_length",
      fakeNumberData
    );
    responseMocks.krueger_data = fakeDataByIds(
      mockedIds.databases,
      fakeKruegerData
    );
    responseMocks.chunks = {
      chunks_data: assignFakeData(
        mockedIds.databases.map((id) =>
          fakeDatabaseChunksData(
            id,
            mockedIds.tables,
            mockedIds.columns,
            numbers.chunks
          )
        )
      ),
    };
    responseMocks.detailed_query_information = mockedIds.databases.map((id) =>
      fakeDatabaseQueryInformationData(id, numbers.queries)
    );
    //TODO: handle loaded tables for every database
    responseMocks.data = benchmarks;
    responseMocks.status = mockedIds.databases.map((id) =>
      fakeDatabaseStatusData(
        id,
        mockedIds.loaded_benchmarks,
        mockedState.workloadRunning
      )
    );
    responseMocks.available_plugins = mockedIds.plugins;
    // NOTE: currently all databases have the same plugins activated
    responseMocks.plugin = mockedIds.databases.map((id) =>
      fakeDatabasePluginsData(id, mockedIds.activated_plugins)
    );
    responseMocks.plugin_settings = {
      plugin_settings: mockedIds.databases.map((id) =>
        fakeDatabasePluginSettings(id, mockedIds.activated_plugins)
      ),
    };
    // NOTE: currently all databases have exactly one log entry
    responseMocks.plugin_log = mockedIds.databases.map((id) =>
      fakeDatabasePluginLogs(id, mockedIds.plugins)
    );
    return responseMocks as Record<Request, any>;
  }

  function changeMockedState(state: DatabaseState, value: boolean): void {
    mockedState[state] = value;
  }

  function addMockedId(entity: Entity, id: string): void {
    mockedIds[entity].push(id);
  }

  function removeMockedId(entity: Entity, id: string): void {
    mockedIds[entity] = mockedIds[entity].filter(
      (availableId) => availableId !== id
    );
  }

  function mockPostCallbacks(): Partial<Record<Request, (id: string) => void>> {
    const postCallbackMocks: Partial<Record<Request, (id: string) => void>> = {
      database: callbacks.addDatabase,
      plugin: callbacks.activatePlugin,
      workload: callbacks.startWorkload,
      data: callbacks.loadTable,
    };

    return postCallbackMocks;
  }

  function mockDeleteCallbacks(): Partial<
    Record<Request, (id: string) => void>
  > {
    const deleteCallbackMocks: Partial<Record<
      Request,
      (id: string) => void
    >> = {
      database: callbacks.removeDatabase,
      plugin: callbacks.deactivatePlugin,
      workload: callbacks.stopWorkload,
      data: callbacks.removeTable,
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
    getMockedDeleteCallback,
  };
}
