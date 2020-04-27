import { useMocks } from "./mocks";
import {
  Entity,
  Request,
  BackendState,
  getPostAlias,
  getDeleteAlias,
  getResponseStatus,
  getGetAlias,
  getPutAlias,
} from "./helpers";

function getInitialNumbers(
  numbers: Partial<Record<Entity, number>>
): Record<Entity, number> {
  return {
    databases: 1,
    tables: 2,
    columns: 2,
    chunks: 2,
    queries: 10,
    plugins: 2,
    activated_plugins: 1,
    loaded_benchmarks: 1,
    workloads: 0,
    ...numbers,
  };
}

export interface Backend {
  start(status?: BackendState, delay?: number): void;
  reload(request: Request, id: string, type: "POST" | "DELETE"): void;
  restart(status?: BackendState, delay?: number): void;
}

/* return mocked backend, only if requests should be mocked inside cypress */
export function useBackendMock(
  numbers: Partial<Record<Entity, number>> = {}
): Backend {
  function start(): void {
    cy.server();
    mockRoutes();
    return;
  }

  function reload(): void {
    return;
  }

  function restart(): void {
    cy.server();
    mockRoutes();
    return;
  }

  function mockRoutes(): void {
    /* GET */
    cy.route("GET", "**/control/database").as(getGetAlias("database"));
    cy.route("GET", "**/monitor/system**").as(getGetAlias("system"));
    cy.route("GET", "**/monitor/storage**").as(getGetAlias("storage"));
    cy.route("GET", "**/monitor/throughput**").as(getGetAlias("throughput"));
    cy.route("GET", "**/monitor/latency**").as(getGetAlias("latency"));
    cy.route("GET", "**/monitor/queue_length**").as(
      getGetAlias("queue_length")
    );
    cy.route("GET", "**/monitor/krueger_data**").as(
      getGetAlias("krueger_data")
    );
    cy.route("GET", "**/monitor/chunks**").as(getGetAlias("chunks"));
    cy.route("GET", "**/monitor/detailed_query_information").as(
      getGetAlias("detailed_query_information")
    );
    cy.route("GET", "**/monitor/status").as(getGetAlias("status"));
    cy.route("GET", "**/control/database/benchmark_tables").as(
      getGetAlias("benchmark_tables")
    );
    cy.route("GET", "**/control/available_plugins").as(
      getGetAlias("available_plugins")
    );
    cy.route("GET", "**/control/plugin").as(getGetAlias("plugin"));
    cy.route("GET", "**/control/plugin_settings").as(
      getGetAlias("plugin_settings")
    );
    cy.route("GET", "**/control/plugin_log").as(getGetAlias("plugin_log"));
    cy.route("GET", "**/workload/").as(getGetAlias("workload"));

    /* POST */
    cy.route("POST", "**/control/database").as(getPostAlias("database"));
    cy.route("POST", "**/control/database/benchmark_tables").as(
      getPostAlias("benchmark_tables")
    );
    cy.route("POST", "**/control/plugin").as(getPostAlias("plugin"));
    cy.route("POST", "**/control/plugin_settings").as(
      getPostAlias("plugin_settings")
    );
    cy.route("POST", "**/workload/").as(getPostAlias("workload"));

    /* DELETE */
    cy.route("DELETE", "**/control/database").as(getDeleteAlias("database"));
    cy.route("DELETE", "**/control/database/benchmark_tables").as(
      getDeleteAlias("benchmark_tables")
    );
    cy.route("DELETE", "**/control/plugin").as(getDeleteAlias("plugin"));
    cy.route("DELETE", "**/workload/**").as(getDeleteAlias("workload"));

    /* PUT */
    cy.route("PUT", "**/workload/**").as(getPutAlias("workload"));
  }

  if (Cypress.env("stubless")) return { start, reload, restart };
  return mockBackend(numbers);
}

/* backend with mocked routes */
export function mockBackend(
  numbers: Partial<Record<Entity, number>> = {}
): Backend {
  const {
    getMockedResponse,
    getMockedPostCallback,
    getMockedDeleteCallback,
    renewMocks,
  } = useMocks(getInitialNumbers(numbers));

  function start(status: BackendState = "up", delay?: number): void {
    cy.server();
    mockRoutes(getResponseStatus(status), delay);
  }

  function reload(request: Request, id: string, type: "POST" | "DELETE"): void {
    if (type == "POST") getMockedPostCallback(request)(id);
    if (type == "DELETE") getMockedDeleteCallback(request)(id);
    mockRoutes();
  }

  function restart(status: BackendState = "up", delay?: number): void {
    renewMocks();
    start(status, delay);
  }

  function mockRoutes(status: number = 200, delay?: number): void {
    const {
      mockGetRoute,
      mockDeleteRoute,
      mockPostRoute,
      mockPutRoute,
    } = useRouteMocking(status, delay);
    mockGetRoutes(mockGetRoute);
    mockPostRoutes(mockPostRoute);
    mockDeleteRoutes(mockDeleteRoute);
    mockPutRoutes(mockPutRoute);
  }

  function mockPutRoutes(mock: RouteMockFunction): void {
    mock("**/workload/**", getPutAlias("workload"));
  }

  function mockGetRoutes(mock: RouteMockFunction): void {
    mock(
      "**/control/database/",
      getGetAlias("database"),
      getMockedResponse("database")
    );
    mock(
      "**/monitor/system**",
      getGetAlias("system"),
      getMockedResponse("system")
    );
    mock(
      "**/monitor/storage**",
      getGetAlias("storage"),
      getMockedResponse("storage"),
      true
    );
    mock(
      "**/monitor/throughput**",
      getGetAlias("throughput"),
      getMockedResponse("throughput")
    );
    mock(
      "**/monitor/latency**",
      getGetAlias("latency"),
      getMockedResponse("latency")
    );
    mock(
      "**/monitor/queue_length**",
      getGetAlias("queue_length"),
      getMockedResponse("queue_length")
    );
    mock(
      "**/monitor/krueger_data**",
      getGetAlias("krueger_data"),
      getMockedResponse("krueger_data")
    );
    mock(
      "**/monitor/chunks**",
      getGetAlias("chunks"),
      getMockedResponse("chunks"),
      true
    );
    mock(
      "**/monitor/detailed_query_information",
      getGetAlias("detailed_query_information"),
      getMockedResponse("detailed_query_information")
    );
    mock(
      "**/monitor/status",
      getGetAlias("status"),
      getMockedResponse("status")
    );
    mock(
      "**/control/database/benchmark_tables",
      getGetAlias("benchmark_tables"),
      getMockedResponse("benchmark_tables")
    );
    mock(
      "**/control/available_plugins",
      getGetAlias("available_plugins"),
      getMockedResponse("available_plugins")
    );
    mock(
      "**/control/plugin",
      getGetAlias("plugin"),
      getMockedResponse("plugin")
    );
    mock(
      "**/control/plugin_settings",
      getGetAlias("plugin_settings"),
      getMockedResponse("plugin_settings"),
      true
    );
    mock(
      "**/control/plugin_log",
      getGetAlias("plugin_log"),
      getMockedResponse("plugin_log")
    );
    mock(
      "**/workload/",
      getGetAlias("workload"),
      getMockedResponse("workload")
    );
    //mock("**/workload/**", getGetAlias("workload"));
  }

  function mockPostRoutes(mock: RouteMockFunction): void {
    mock("**/control/database/", getPostAlias("database"));
    mock(
      "**/control/database/benchmark_tables",
      getPostAlias("benchmark_tables")
    );
    mock("**/control/plugin", getPostAlias("plugin"));
    mock("**/control/plugin_settings", getPostAlias("plugin_settings"));
    mock("**/workload/", getPostAlias("workload"));
  }

  function mockDeleteRoutes(mock: RouteMockFunction): void {
    mock("**/control/database/", getDeleteAlias("database"));
    mock(
      "**/control/database/benchmark_tables",
      getDeleteAlias("benchmark_tables")
    );
    mock("**/control/plugin", getDeleteAlias("plugin"));
    mock("**/workload/**", getDeleteAlias("workload"));
  }

  return {
    restart,
    start,
    reload,
  };
}

type RouteMockFunction = (
  url: string,
  alias: string,
  response?: any,
  withBody?: boolean
) => void;

function useRouteMocking(
  status: number,
  delay?: number
): {
  mockGetRoute: RouteMockFunction;
  mockPostRoute: RouteMockFunction;
  mockPutRoute: RouteMockFunction;
  mockDeleteRoute: RouteMockFunction;
} {
  function getRouteMock(
    method: string,
    url: string,
    response: any,
    withBody: boolean,
    delay: number
  ): Object {
    return {
      method: method,
      url: url,
      status: status,
      response: withBody ? { body: response } : response,
      delay: delay,
    };
  }

  function mockPutRoute(
    url: string,
    alias: string,
    response: any = {},
    withBody: boolean = false
  ): void {
    cy.route(getRouteMock("PUT", url, response, withBody, delay || 0)).as(
      alias
    );
  }

  function mockGetRoute(
    url: string,
    alias: string,
    response: any = {},
    withBody: boolean = false
  ): void {
    cy.route(getRouteMock("GET", url, response, withBody, delay || 0)).as(
      alias
    );
  }

  function mockPostRoute(
    url: string,
    alias: string,
    response: any = {},
    withBody: boolean = false
  ): void {
    cy.route(getRouteMock("POST", url, response, withBody, delay || 100)).as(
      alias
    );
  }

  function mockDeleteRoute(
    url: string,
    alias: string,
    response: any = {},
    withBody: boolean = false
  ): void {
    cy.route(getRouteMock("DELETE", url, response, withBody, delay || 100)).as(
      alias
    );
  }

  return { mockGetRoute, mockPostRoute, mockDeleteRoute, mockPutRoute };
}
