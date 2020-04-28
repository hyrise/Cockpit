import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getDeleteAlias } from "../../setup/helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import { getSelector, assertDeleteValues } from "./helpers";
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
      cy.get(getSelector("removeDatabaseButton")).first().click();

      clickElement(getSelector("cancelRemoveDatabaseButton"));
      cy.numberOfRequests(getDeleteAlias("database")).should("eq", 0);

      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(getSelector("databaseChip")).contains(removeDatabase);
      });
    });
  });

  // test multiple
  describe("and clicking the remove and cancel button multiple times", () => {
    it("will always select the clicked database to be removed", () => {
      const secondRemoveDatabase = databases[1].id;
      clickElement(getViewSelector("databaseListButton"));

      cy.get(getSelector("removeDatabaseButton")).first().click();

      cy.get(getSelector("removeDatabase")).within(() => {
        cy.get("span").contains(removeDatabase);
        cy.get("span").contains(secondRemoveDatabase).should("not.exist");
      });
      clickElement(getSelector("cancelRemoveDatabaseButton"));

      clickElement(getViewSelector("databaseListButton"));
      cy.get(getSelector("removeDatabaseButton")).last().click();

      cy.get(getSelector("removeDatabase")).within(() => {
        cy.get("span").contains(secondRemoveDatabase);
        cy.get("span").contains(removeDatabase).should("not.exist");
      });
    });
  });

  // test delete
  describe("and clicking the remove button", () => {
    it("will remove the selected database", () => {
      clickElement(getViewSelector("databaseListButton"));
      cy.get(getSelector("removeDatabaseButton")).first().click();
      testContentExistence(removeDatabase);

      // update tmp state
      cy.updateAppState(backend, {
        request: "database",
        id: removeDatabase,
        method: "DELETE",
      });

      clickElement(getSelector("deleteDatabaseButton"));

      cy.wait("@" + getDeleteAlias("database"));
      cy.get("@" + getDeleteAlias("database")).should((xhr: any) => {
        assertDeleteValues(removeDatabase, xhr.request.body);
      });
      cy.numberOfRequests(getDeleteAlias("database")).should("eq", 1);

      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(getSelector("databaseChip"))
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
