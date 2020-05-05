import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import { getSelector, assertSQLRequest } from "./helpers";
import { getPostAlias } from "../../setup/helpers";
import * as faker from "faker";

let backend = useBackendMock();

let databases: any = [];

describe("when opening the sql input", () => {
  beforeEach(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
  });

  it("opens the sql dialog", () => {
    databases.forEach((database: any, idx: number) => {
      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(getSelector("openSQLDialog")).eq(idx).click();
      });
      cy.get(getSelector("sqlInput")).should("exist");
      cy.reload();
    });
  });

  describe("when clicking the cancel button", () => {
    it("closes the sql dialog", () => {
      databases.forEach((database: any, idx: number) => {
        clickElement(getViewSelector("databaseListButton"));
        cy.get(getViewSelector("databaseList")).within(() => {
          cy.get(getSelector("openSQLDialog")).eq(idx).click();
        });
        cy.get(getSelector("sqlInput")).should("exist");
        cy.get(getSelector("closeSQLInput")).click();
        cy.get(getSelector("sqlInput")).should("not.be.visible");
        cy.numberOfRequests(getPostAlias("sql")).should("eq", 0);
        cy.reload();
      });
    });
  });

  describe("when clicking the send button", () => {
    it("sends a query with the correct data", () => {
      const query = faker.random.words();
      databases.forEach((database: any, idx: number) => {
        clickElement(getViewSelector("databaseListButton"));
        cy.get(getViewSelector("databaseList")).within(() => {
          cy.get(getSelector("openSQLDialog")).eq(idx).click();
        });
        cy.get(getSelector("sqlInput")).clear().type(query);
        cy.get(getSelector("sendSQLInput")).click();
        cy.wait("@" + getPostAlias("sql"));
        cy.get("@" + getPostAlias("sql")).should((xhr: any) => {
          assertSQLRequest(database.id, query, xhr.request.body);
        });
        cy.get(getSelector("sqlInput")).should("be.visible");
        cy.numberOfRequests(getPostAlias("sql")).should("eq", idx + 1);
        cy.reload();
      });
    });
  });
});
