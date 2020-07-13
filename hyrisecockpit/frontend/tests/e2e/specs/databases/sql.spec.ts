import { useBackendMock } from "../../setup/backendMock";
import { selectors as viewSelectors } from "../views/helpers";
import { assertSQLRequest, selectors } from "./helpers";
import { getPostAlias } from "../../setup/helpers";
import * as faker from "faker";

const backend = useBackendMock();

let databases: any = [];

describe("when opening the sql input", () => {
  beforeEach(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
  });

  describe("when clicking the cancel button", () => {
    it("closes the sql dialog", () => {
      databases.forEach((database: any, idx: number) => {
        cy.get(viewSelectors.databaseListButton).click();
        cy.get(viewSelectors.databaseList).within(() => {
          cy.get(selectors.openSQLDialog).eq(idx).click();
        });
        cy.get(selectors.sqlInput).should("exist");
        cy.get(selectors.closeSQLInput).click();
        cy.get(selectors.sqlInput).should("not.be.visible");
        cy.numberOfRequests(getPostAlias("sql")).should("eq", 0);
        cy.reload();
      });
    });
  });

  describe("when clicking the send button", () => {
    it("sends a query with the correct data", () => {
      const query = faker.random.words();
      databases.forEach((database: any, idx: number) => {
        cy.get(viewSelectors.databaseListButton).click();
        cy.get(viewSelectors.databaseList).within(() => {
          cy.get(selectors.openSQLDialog).eq(idx).click();
        });
        cy.get(selectors.sqlInput).clear().type(query);
        cy.get(selectors.sendSQLInput).click();
        cy.wait("@" + getPostAlias("sql"));
        cy.get("@" + getPostAlias("sql")).should((xhr: any) => {
          assertSQLRequest(database.id, query, xhr.request.body);
        });
        cy.get(selectors.sqlInput).should("be.visible");
        cy.numberOfRequests(getPostAlias("sql")).should("eq", idx + 1);
        cy.reload();
      });
    });
  });
});
