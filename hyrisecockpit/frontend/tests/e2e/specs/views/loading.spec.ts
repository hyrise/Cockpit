import { routes, selectors } from "./helpers";
import { mockBackend } from "../../setup/backendMock";

// use cypress mock to change response status code manually
const backend = mockBackend();

// test running backend
describe("when backend is up", () => {
  beforeEach(() => {
    backend.start();
    cy.visit("/");
  });

  // test on workload monitoring
  describe("visiting the workload monitoring page", () => {
    it("will not show a loading animation", () => {
      cy.visit(routes.workloadMonitoring);
      cy.get(selectors.loadingAnimation).should("not.be.visible");
    });
  });

  // test on overview
  describe("visiting the overview page", () => {
    it("will not show a loading animation", () => {
      cy.visit(routes.overview);
      cy.get(selectors.loadingAnimation).should("not.be.visible");
    });
  });

  // test on comparison
  describe("visiting the comparison page", () => {
    it("will not show a loading animation", () => {
      cy.visit(routes.comparison);
      cy.get(selectors.loadingAnimation).should("not.be.visible");
    });
  });
});

// test not running backend
describe("when backend is down", () => {
  beforeEach(() => {
    backend.start("down");
    cy.visit("/");
  });

  // test on workload monitoring
  describe("visiting the workload monitoring page", () => {
    it("will show a loading animation", () => {
      cy.visit(routes.workloadMonitoring);
      cy.get(selectors.loadingAnimation).should("be.visible");
    });
  });

  // test on overview
  describe("visiting the overview page", () => {
    it("will show a loading animation", () => {
      cy.visit(routes.overview);
      cy.get(selectors.loadingAnimation).should("be.visible");
    });
  });

  // test on comparison
  describe("visiting the comparison page", () => {
    it("will show a loading animation", () => {
      cy.visit(routes.comparison);
      cy.get(selectors.loadingAnimation).should("be.visible");
    });
  });
});
