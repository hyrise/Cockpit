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
  getRequestRoute,
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
    plugins: 3,
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
  rename(request: Request, alias: string, status?: number): void;
}

/* return mocked backend, only if requests should be mocked inside cypress */
export function useBackendMock(
  numbers: Partial<Record<Entity, number>> = {}
): Backend {
  function start(): void {
    cy.server();
    mockRoutes();
  }

  function reload(): void {
    return;
  }

  function restart(): void {
    cy.server();
    mockRoutes();
  }

  function rename(request: Request, alias: string, status?: number): void {
    cy.route("GET", getRequestRoute(request, "get")).as(alias);
  }

  function mockRoutes(): void {
    /* GET */
    cy.route("GET", getRequestRoute("database", "get")).as(
      getGetAlias("database")
    );
    cy.route("GET", getRequestRoute("system", "get")).as(getGetAlias("system"));
    cy.route("GET", getRequestRoute("storage", "get")).as(
      getGetAlias("storage")
    );
    cy.route("GET", getRequestRoute("throughput", "get")).as(
      getGetAlias("throughput")
    );
    cy.route("GET", getRequestRoute("latency", "get")).as(
      getGetAlias("latency")
    );
    cy.route("GET", getRequestRoute("queue_length", "get")).as(
      getGetAlias("queue_length")
    );
    cy.route("GET", getRequestRoute("krueger_data", "get")).as(
      getGetAlias("krueger_data")
    );
    cy.route("GET", getRequestRoute("chunks", "get")).as(getGetAlias("chunks"));
    cy.route("GET", getRequestRoute("detailed_query_information", "get")).as(
      getGetAlias("detailed_query_information")
    );
    cy.route("GET", getRequestRoute("status", "get")).as(getGetAlias("status"));
    cy.route("GET", getRequestRoute("benchmark_tables", "get")).as(
      getGetAlias("benchmark_tables")
    );
    cy.route("GET", getRequestRoute("available_plugins", "get")).as(
      getGetAlias("available_plugins")
    );
    cy.route("GET", getRequestRoute("plugin", "get")).as(getGetAlias("plugin"));
    cy.route("GET", getRequestRoute("plugin_settings", "get")).as(
      getGetAlias("plugin_settings")
    );
    cy.route("GET", getRequestRoute("plugin_log", "get")).as(
      getGetAlias("plugin_log")
    );
    cy.route("GET", getRequestRoute("workload", "get")).as(
      getGetAlias("workload")
    );

    /* POST */
    cy.route("POST", getRequestRoute("database", "post")).as(
      getPostAlias("database")
    );
    cy.route("POST", getRequestRoute("benchmark_tables", "post")).as(
      getPostAlias("benchmark_tables")
    );
    cy.route("POST", getRequestRoute("plugin", "post")).as(
      getPostAlias("plugin")
    );
    cy.route("POST", getRequestRoute("plugin_settings", "post")).as(
      getPostAlias("plugin_settings")
    );
    cy.route("POST", getRequestRoute("workload", "post")).as(
      getPostAlias("workload")
    );

    /* DELETE */
    cy.route("DELETE", getRequestRoute("database", "delete")).as(
      getDeleteAlias("database")
    );
    cy.route("DELETE", getRequestRoute("benchmark_tables", "delete")).as(
      getDeleteAlias("benchmark_tables")
    );
    cy.route("DELETE", getRequestRoute("plugin", "delete")).as(
      getDeleteAlias("plugin")
    );
    cy.route("DELETE", getRequestRoute("workload", "delete")).as(
      getDeleteAlias("workload")
    );

    /* PUT */
    cy.route("PUT", getRequestRoute("workload", "put")).as(
      getPutAlias("workload")
    );
  }

  if (Cypress.env("stubless")) return { start, reload, restart, rename };
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

  function rename(request: Request, alias: string, status = 200): void {
    const { mockGetRoute } = useRouteMocking(status);

    mockGetRoute(
      getRequestRoute(request, "get"),
      alias,
      getMockedResponse(request)
    );
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
    mock(getRequestRoute("workload", "put"), getPutAlias("workload"));
  }

  function mockGetRoutes(mock: RouteMockFunction): void {
    mock(
      getRequestRoute("database", "get"),
      getGetAlias("database"),
      getMockedResponse("database")
    );
    mock(
      getRequestRoute("system", "get"),
      getGetAlias("system"),
      getMockedResponse("system")
    );
    mock(
      getRequestRoute("storage", "get"),
      getGetAlias("storage"),
      getMockedResponse("storage"),
      true
    );
    mock(
      getRequestRoute("throughput", "get"),
      getGetAlias("throughput"),
      getMockedResponse("throughput")
    );
    mock(
      getRequestRoute("latency", "get"),
      getGetAlias("latency"),
      getMockedResponse("latency")
    );
    mock(
      getRequestRoute("queue_length", "get"),
      getGetAlias("queue_length"),
      getMockedResponse("queue_length")
    );
    mock(
      getRequestRoute("krueger_data", "get"),
      getGetAlias("krueger_data"),
      getMockedResponse("krueger_data")
    );
    mock(
      getRequestRoute("chunks", "get"),
      getGetAlias("chunks"),
      getMockedResponse("chunks"),
      true
    );
    mock(
      getRequestRoute("detailed_query_information", "get"),
      getGetAlias("detailed_query_information"),
      getMockedResponse("detailed_query_information")
    );
    mock(
      getRequestRoute("status", "get"),
      getGetAlias("status"),
      getMockedResponse("status")
    );
    mock(
      getRequestRoute("benchmark_tables", "get"),
      getGetAlias("benchmark_tables"),
      getMockedResponse("benchmark_tables")
    );
    mock(
      getRequestRoute("available_plugins", "get"),
      getGetAlias("available_plugins"),
      getMockedResponse("available_plugins")
    );
    mock(
      getRequestRoute("plugin", "get"),
      getGetAlias("plugin"),
      getMockedResponse("plugin")
    );
    mock(
      getRequestRoute("plugin_settings", "get"),
      getGetAlias("plugin_settings"),
      getMockedResponse("plugin_settings"),
      true
    );
    mock(
      getRequestRoute("plugin_log", "get"),
      getGetAlias("plugin_log"),
      getMockedResponse("plugin_log")
    );
    mock(
      getRequestRoute("workload", "get"),
      getGetAlias("workload"),
      getMockedResponse("workload")
    );
  }

  function mockPostRoutes(mock: RouteMockFunction): void {
    mock(getRequestRoute("database", "post"), getPostAlias("database"));
    mock(
      getRequestRoute("benchmark_tables", "post"),
      getPostAlias("benchmark_tables")
    );
    mock(getRequestRoute("plugin", "post"), getPostAlias("plugin"));
    mock(
      getRequestRoute("plugin_settings", "post"),
      getPostAlias("plugin_settings")
    );
    mock(getRequestRoute("workload", "post"), getPostAlias("workload"));
  }

  function mockDeleteRoutes(mock: RouteMockFunction): void {
    mock(getRequestRoute("database", "delete"), getDeleteAlias("database"));
    mock(
      getRequestRoute("benchmark_tables", "delete"),
      getDeleteAlias("benchmark_tables")
    );
    mock(getRequestRoute("plugin", "delete"), getDeleteAlias("plugin"));
    mock(getRequestRoute("workload", "delete"), getDeleteAlias("workload"));
  }

  return {
    restart,
    start,
    reload,
    rename,
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
