declare namespace Cypress {
  interface Chainable {
    numberOfRequests(selector: string): Chainable;
  }
}
