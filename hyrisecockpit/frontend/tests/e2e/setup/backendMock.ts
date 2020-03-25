import { useMocks } from "./mocks";
import { Entity } from "./helpers";

function mockRoute(
  method: string,
  url: string,
  response: any,
  withBody: boolean
): void {
  console.log(url, method, response); //TODO: remove when finished
  cy.route({
    method: method,
    url: url,
    response: withBody ? { body: response } : response
  });
}

function mockGetRoute(url: string, response: any, withBody: boolean): void {
  mockRoute("GET", url, response, withBody);
}

/* backend with mocked routes */

//TODO: mock missing routes

export function useBackendMock(
  numbers: Record<Entity, number>
): { restart(): void; start(): void } {
  const { getMockedResponse, renewMocks } = useMocks(numbers);

  function start(): void {
    cy.server();
    mockGetRoutes();
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

  function restart(): void {
    renewMocks();
    start();
  }

  return {
    restart,
    start
  };
}
