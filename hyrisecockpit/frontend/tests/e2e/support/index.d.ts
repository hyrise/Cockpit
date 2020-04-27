declare namespace Cypress {
  interface Chainable {
    numberOfRequests(selector: string): Chainable;
    setupData(request: string): Promise<any>;
    setupAppState(backend: any): Promise<any>;
    cleanAppState(
      backend: any,
      payload: { request: string; id: string; method: "POST" | "DELETE" }
    ): any;
    updateAppState(
      backend: any,
      payload: { request: string; id: string; method: "POST" | "DELETE" }
    ): any;
    restartAppState(backend: any, payload: any): any;
  }
}
