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

export function useBackendMock(
  numbers: Record<Entity, number>
): {
  restart(status?: BackendStatus, delay?: number): void;
  start(status?: BackendStatus, delay?: number): void;
  reload(request: Request, id: string, type: "POST" | "DELETE"): void;
} {
  const {
    getMockedResponse,
    getMockedPostCallback,
    getMockedDeleteCallback,
    renewMocks
  } = useMocks(numbers);

  function start(status: BackendStatus = "up", delay?: number): void {
    cy.server();
    mockRoutes(getResponseStatus(status), delay);
  }

  function reload(request: Request, id: string, type: "POST" | "DELETE"): void {
    if (type == "POST") getMockedPostCallback(request)(id);
    if (type == "DELETE") getMockedDeleteCallback(request)(id);
    mockRoutes();
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
      "**/monitor/system",
      getGetAlias("system"),
      getMockedResponse("system"),
      true
    );
    mock(
      "**/monitor/storage",
      getGetAlias("storage"),
      getMockedResponse("storage"),
      true
    );
    mock(
      "**/monitor/throughput",
      getGetAlias("throughput"),
      getMockedResponse("throughput"),
      true
    );
    mock(
      "**/monitor/latency",
      getGetAlias("latency"),
      getMockedResponse("latency"),
      true
    );
    mock(
      "**/monitor/queue_length",
      getGetAlias("queue_length"),
      getMockedResponse("queue_length"),
      true
    );
    mock(
      "**/monitor/krueger_data",
      getGetAlias("krueger_data"),
      getMockedResponse("krueger_data")
    );
    mock(
      "**/monitor/chunks",
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

  function restart(status: BackendStatus = "up", delay?: number): void {
    renewMocks();
    start(status, delay);
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
