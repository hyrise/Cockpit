import { useMocks, Entity } from "./mocks";

function mockRoute(
  method: string,
  url: string,
  response: any,
  withBody: boolean
): void {
  console.log(response);
  cy.route({
    method: method,
    url: url,
    response: withBody ? { body: response } : response
  });
}

//TODO: mock missing routes

export function mockBackend(
  numbers: Record<Entity, number>
): { restartBackend(): void } {
  const { getMockedResponse, renewMocks } = useMocks(numbers);

  // start mocked backend
  setupBackend();

  function setupBackend(): void {
    cy.server();
    mockRoute(
      "GET",
      "**/control/database",
      getMockedResponse("database"),
      false
    );
    mockRoute("GET", "**/monitor/system", getMockedResponse("system"), true);
    mockRoute("GET", "**/monitor/storage", getMockedResponse("storage"), true);
  }

  function restartBackend(): void {
    renewMocks();
    setupBackend();
  }

  return { restartBackend };
}
