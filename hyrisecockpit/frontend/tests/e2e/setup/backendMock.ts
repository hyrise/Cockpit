import { useMocks } from "./mocks";
import {
  Entity,
  Request,
  BackendStatus,
  getPostAlias,
  getDeleteAlias,
  getResponseStatus,
  getGetAlias
} from "./helpers";

/* backend with mocked routes */

//NOTE: only used routes are mocked yet

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
    ...numbers
  };
}

export interface Backend {
  start(status?: BackendStatus, delay?: number): void;
  reload(request: Request, id: string, type: "POST" | "DELETE"): void;
  restart(status?: BackendStatus, delay?: number): void;
}

export function useBackendMock(
  numbers: Partial<Record<Entity, number>> = {}
): Backend {
  const {
    getMockedResponse,
    getMockedPostCallback,
    getMockedDeleteCallback,
    renewMocks
  } = useMocks(getInitialNumbers(numbers));

  function start(status: BackendStatus = "up", delay?: number): void {
    cy.server();
    mockRoutes(getResponseStatus(status), delay);
  }

  function reload(request: Request, id: string, type: "POST" | "DELETE"): void {
    if (type == "POST") getMockedPostCallback(request)(id);
    if (type == "DELETE") getMockedDeleteCallback(request)(id);
    mockRoutes();
  }

  function restart(status: BackendStatus = "up", delay?: number): void {
    renewMocks();
    start(status, delay);
  }

  function mockRoutes(status: number = 200, delay?: number): void {
    const { mockGetRoute, mockDeleteRoute, mockPostRoute } = useRouteMocking(
      status,
      delay
    );
    mockGetRoutes(mockGetRoute);
    mockPostRoutes(mockPostRoute);
    mockDeleteRoutes(mockDeleteRoute);
  }

  function mockGetRoutes(mock: RouteMockFunction): void {
    mock(
      "**/control/database",
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
    mock("**/control/data", getGetAlias("data"), getMockedResponse("data"));
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
  }

  function mockPostRoutes(mock: RouteMockFunction): void {
    mock("**/control/database", getPostAlias("database"));
    mock("**/control/data", getPostAlias("data"));
    mock("**/control/plugin", getPostAlias("plugin"));
    mock("**/control/plugin_settings", getPostAlias("plugin_settings"));
    mock("**/control/workload", getPostAlias("workload"));
  }

  function mockDeleteRoutes(mock: RouteMockFunction): void {
    mock("**/control/database", getDeleteAlias("database"));
    mock("**/control/data", getDeleteAlias("data"));
    mock("**/control/plugin", getDeleteAlias("plugin"));
    mock("**/control/workload", getDeleteAlias("workload"));
  }

  return {
    restart,
    start,
    reload
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
      delay: delay
    };
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

  return { mockGetRoute, mockPostRoute, mockDeleteRoute };
}
