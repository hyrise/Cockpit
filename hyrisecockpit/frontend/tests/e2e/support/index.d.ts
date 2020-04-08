declare namespace Cypress {
  interface Chainable {
    numberOfRequests(selector: string): Chainable;
    setupAppState(backend: any): Promise<any[]>;
  }
}
