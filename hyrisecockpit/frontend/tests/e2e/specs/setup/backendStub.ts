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

export function mockBackend(numbers: Record<Entity, number>): void {
  const { getMockedResponse, mockQueries } = useMocks(numbers);

  mockQueries();
  cy.server();
  mockRoute("GET", "**/control/database", getMockedResponse("database"), false);
  mockRoute("GET", "**/monitor/system", getMockedResponse("system"), true);
  mockRoute("GET", "**/monitor/storage", getMockedResponse("storage"), true);
}
