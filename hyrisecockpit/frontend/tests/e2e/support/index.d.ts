declare namespace Cypress {
  interface Chainable {
    numberOfRequests(selector: string): Chainable;
    setupAppState(backend: any): Promise<any>;
    setupData(request: string): Promise<any>;
    cleanAppState(
      backend: any,
      payload: { request: string; id: string; method: "POST" | "DELETE" }
    ): any;
    updateAppState(
      backend: any,
      payload: { request: string; id: string; method: "POST" | "DELETE" }
    ): any;
  }
}
