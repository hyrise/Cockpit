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

export function mockBackend(
  numbers: Record<Entity, number>
): { restartBackend(): void } {
  const { getResponseMock, renewMocks } = useMocks(numbers);

  // start mocked backend
  setupBackend();

  function setupBackend(): void {
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
  }

  function restartBackend(): void {
    renewMocks();
    setupBackend();
  }

  return { restartBackend };
}
