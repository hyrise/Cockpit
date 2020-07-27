import { useBackendMock } from "../../setup/backendMock";
import { getDeleteAlias } from "../../setup/helpers";
import { selectors as viewSelectors } from "../views/helpers";
import { assertDeleteRequest, selectors } from "./helpers";

const backend = useBackendMock({ databases: 2 });
let databases: any = [];
let removeDatabase: string = "";

describe("When removing a database", () => {
  beforeEach(() => {
    cy.restartAppState(backend, {
      databases: 2,
    });
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
      removeDatabase = databases[0].id;
    });
  });

  // clear state
  after(() => {
    cy.restartAppState(backend, {});
  });

  // test cancel
  describe("and clicking the cancel button", () => {
    it("will not remove the selected database", () => {
      cy.get(viewSelectors.databaseListButton).click();
      cy.get(selectors.removeDatabaseButton).first().click();

      cy.get(selectors.cancelRemoveDatabaseButton).click();
      cy.numberOfRequests(getDeleteAlias("database")).should("eq", 0);

      cy.get(viewSelectors.databaseListButton).click();
      cy.get(viewSelectors.databaseList).within(() => {
        cy.get(selectors.databaseChip).contains(removeDatabase);
      });
    });
  });

  // test multiple
  describe("and clicking the remove and cancel button multiple times", () => {
    it("will always select the clicked database to be removed", () => {
      const secondRemoveDatabase = databases[1].id;
      cy.get(viewSelectors.databaseListButton).click();

      cy.get(selectors.removeDatabaseButton).first().click();

      cy.get(selectors.removeDatabase).within(() => {
        cy.get(selectors.databaseChip).contains(removeDatabase);
        cy.get(selectors.databaseChip)
          .contains(secondRemoveDatabase)
          .should("not.exist");
      });
      cy.get(selectors.cancelRemoveDatabaseButton).click();

      cy.get(viewSelectors.databaseListButton).click();
      cy.get(selectors.removeDatabaseButton).last().click();

      cy.get(selectors.removeDatabase).within(() => {
        cy.get(selectors.databaseChip).contains(secondRemoveDatabase);
        cy.get(selectors.databaseChip)
          .contains(removeDatabase)
          .should("not.exist");
      });
    });
  });

  // test delete
  describe("and clicking the remove button", () => {
    it("will remove the selected database", () => {
      cy.get(viewSelectors.databaseListButton).click();
      cy.get(selectors.removeDatabaseButton).first().click();
      cy.contains(removeDatabase);

      // update tmp state
      cy.updateAppState(backend, {
        request: "database",
        id: removeDatabase,
        method: "DELETE",
      });

      cy.get(selectors.deleteDatabaseButton).click();

      cy.wait("@" + getDeleteAlias("database"));
      cy.get("@" + getDeleteAlias("database")).should((xhr: any) => {
        assertDeleteRequest(removeDatabase, xhr.request.body);
      });
      cy.numberOfRequests(getDeleteAlias("database")).should("eq", 1);

      cy.get(viewSelectors.databaseListButton).click();
      cy.get(viewSelectors.databaseList).within(() => {
        cy.get(selectors.databaseChip)
          .contains(removeDatabase)
          .should("not.exist");
      });

      // clean tmp state
      cy.cleanAppState(backend, {
        request: "database",
        id: removeDatabase,
        method: "POST",
      });
    });
  });
});
