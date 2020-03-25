import { useMocks } from "./mocks";
import { Entity } from "./helpers";

function mockRoute(
  method: string,
  url: string,
  response: any,
  withBody: boolean
): void {
  console.log(url, response);
  cy.route({
    method: method,
    url: url,
    response: withBody ? { body: response } : response
  });
}

/* backend with mocked routes */

//TODO: mock missing routes

export function useBackendMock(
  numbers: Record<Entity, number>
): { restart(): void; start(): void } {
  const { getResponseMock, renewMocks } = useMocks(numbers);

  function start(): void {
    cy.server();
    mockRoute("GET", "**/control/database", getResponseMock("database"), false);
    mockRoute("GET", "**/monitor/system", getResponseMock("system"), true);
    mockRoute("GET", "**/monitor/storage", getResponseMock("storage"), true);
    mockRoute(
      "GET",
      "**/monitor/throughput",
      getResponseMock("throughput"),
      true
    );
    mockRoute("GET", "**/monitor/latency", getResponseMock("latency"), true);
    mockRoute(
      "GET",
      "**/monitor/queue_length",
      getResponseMock("queue_length"),
      true
    );
    mockRoute(
      "GET",
      "**/monitor/krueger_data",
      getResponseMock("krueger_data"),
      false
    );
    mockRoute("GET", "**/monitor/chunks", getResponseMock("chunks"), true);
    mockRoute(
      "GET",
      "**/monitor/detailed_query_information",
      getResponseMock("detailed_query_information"),
      false
    );
    mockRoute("GET", "**/control/data", getResponseMock("data"), false);
    mockRoute(
      "GET",
      "**/control/available_plugins",
      getResponseMock("available_plugins"),
      false
    );
    mockRoute("GET", "**/control/plugin", getResponseMock("plugin"), false);
    mockRoute(
      "GET",
      "**/control/plugin_settings",
      getResponseMock("plugin_settings"),
      true
    );
    mockRoute(
      "GET",
      "**/control/plugin_log",
      getResponseMock("plugin_log"),
      false
    );
  }

  function restart(): void {
    renewMocks();
    start();
  }

  return { restart, start };
}
