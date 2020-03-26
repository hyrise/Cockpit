import { useMocks } from "./mocks";
import { Entity, getPostAlias, getDeleteAlias, empty } from "./helpers";

/* backend with mocked routes */

//NOTE: only used routes are mocked yet

export function useBackendMock(
  numbers: Record<Entity, number>
): { restart(): void; start(): void } {
  const {
    getMockedResponse,
    getMockedPostCallback,
    getMockedDeleteCallback,
    renewMocks
  } = useMocks(numbers);

  function start(): void {
    cy.server();
    mockGetRoutes();
    mockPostRoutes();
    mockDeleteRoutes();
  }

  function mockGetRoutes(): void {
    mockGetRoute("**/control/database", getMockedResponse("database"), false);
    mockGetRoute("**/monitor/system", getMockedResponse("system"), true);
    mockGetRoute("**/monitor/storage", getMockedResponse("storage"), true);
    mockGetRoute(
      "**/monitor/throughput",
      getMockedResponse("throughput"),
      true
    );
    mockGetRoute("**/monitor/latency", getMockedResponse("latency"), true);
    mockGetRoute(
      "**/monitor/queue_length",
      getMockedResponse("queue_length"),
      true
    );
    mockGetRoute(
      "**/monitor/krueger_data",
      getMockedResponse("krueger_data"),
      false
    );
    mockGetRoute("**/monitor/chunks", getMockedResponse("chunks"), true);
    mockGetRoute(
      "**/monitor/detailed_query_information",
      getMockedResponse("detailed_query_information"),
      false
    );
    mockGetRoute("**/control/data", getMockedResponse("data"), false);
    mockGetRoute(
      "**/control/available_plugins",
      getMockedResponse("available_plugins"),
      false
    );
    mockGetRoute("**/control/plugin", getMockedResponse("plugin"), false);
    mockGetRoute(
      "**/control/plugin_settings",
      getMockedResponse("plugin_settings"),
      true
    );
    mockGetRoute(
      "**/control/plugin_log",
      getMockedResponse("plugin_log"),
      false
    );
  }

  function mockPostRoutes(): void {
    mockPostRoute(
      "**/control/database",
      getPostAlias("database"),
      getMockedPostCallback("database")
    );
    mockPostRoute(
      "**/control/data",
      getPostAlias("data"),
      getMockedPostCallback("data")
    );
    mockPostRoute(
      "**/control/plugin",
      getPostAlias("plugin"),
      getMockedPostCallback("plugin")
    );
    mockPostRoute(
      "**/control/plugin_settings",
      getPostAlias("plugin_settings"),
      getMockedPostCallback("plugin_settings")
    );
    mockPostRoute(
      "**/control/workload",
      getPostAlias("workload"),
      getMockedPostCallback("workload")
    );
  }

  function mockDeleteRoutes(): void {
    mockDeleteRoute(
      "**/control/database",
      getDeleteAlias("database"),
      getMockedDeleteCallback("database")
    );
    mockDeleteRoute(
      "**/control/data",
      getDeleteAlias("data"),
      getMockedDeleteCallback("data")
    );
    mockDeleteRoute(
      "**/control/plugin",
      getDeleteAlias("plugin"),
      getMockedDeleteCallback("plugin")
    );
    mockDeleteRoute(
      "**/control/workload",
      getDeleteAlias("workload"),
      getMockedDeleteCallback("workload")
    );
  }

  function restart(): void {
    renewMocks();
    start();
  }

  return {
    restart,
    start
  };
}

function getRouteMock(
  method: string,
  url: string,
  response: any,
  withBody: boolean,
  callback: (payload: any) => void = empty,
  delay: number = 0
): Object {
  return {
    method: method,
    url: url,
    response: withBody ? { body: response } : response,
    delay: delay,
    onRequest: (xhr: any) => {
      // call function on request
      callback(xhr);
    }
  };
}

function mockGetRoute(url: string, response: any, withBody: boolean): void {
  cy.route(getRouteMock("GET", url, response, withBody));
}

function mockPostRoute(
  url: string,
  alias: string,
  callback: (payload: any) => void,
  delay: number = 500,
  withBody: boolean = false,
  response: any = {}
): void {
  cy.route(getRouteMock("POST", url, response, withBody, callback, delay)).as(
    alias
  );
}

function mockDeleteRoute(
  url: string,
  alias: string,
  callback: (payload?: any) => void,
  delay: number = 0,
  withBody: boolean = false,
  response: any = {}
): void {
  cy.route(getRouteMock("DELETE", url, response, withBody, callback, delay)).as(
    alias
  );
}
