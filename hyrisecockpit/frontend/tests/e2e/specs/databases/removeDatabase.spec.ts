import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getDeleteAlias } from "../../setup/helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import { assertDeleteValues, selectors } from "./helpers";
import { testContentExistence } from "../abstractTests";

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
      clickElement(getViewSelector("databaseListButton"));
      cy.get(selectors.removeDatabaseButton).first().click();

      clickElement(selectors.cancelRemoveDatabaseButton);
      cy.numberOfRequests(getDeleteAlias("database")).should("eq", 0);

      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(selectors.databaseChip).contains(removeDatabase);
      });
    });
  });

  // test multiple
  describe("and clicking the remove and cancel button multiple times", () => {
    it("will always select the clicked database to be removed", () => {
      const secondRemoveDatabase = databases[1].id;
      clickElement(getViewSelector("databaseListButton"));

      cy.get(selectors.removeDatabaseButton).first().click();

      cy.get(selectors.removeDatabase).within(() => {
        cy.get(selectors.databaseChip).contains(removeDatabase);
        cy.get(selectors.databaseChip)
          .contains(secondRemoveDatabase)
          .should("not.exist");
      });
      clickElement(selectors.cancelRemoveDatabaseButton);

      clickElement(getViewSelector("databaseListButton"));
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
      clickElement(getViewSelector("databaseListButton"));
      cy.get(selectors.removeDatabaseButton).first().click();
      testContentExistence(removeDatabase);

      // update tmp state
      cy.updateAppState(backend, {
        request: "database",
        id: removeDatabase,
        method: "DELETE",
      });

      clickElement(selectors.deleteDatabaseButton);

      cy.wait("@" + getDeleteAlias("database"));
      cy.get("@" + getDeleteAlias("database")).should((xhr: any) => {
        assertDeleteValues(removeDatabase, xhr.request.body);
      });
      cy.numberOfRequests(getDeleteAlias("database")).should("eq", 1);

      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
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
