import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getGetAlias, getDeleteAlias } from "../../setup/helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import { getSelector, assertDeleteValues } from "./helpers";
import { fakeId } from "../../setup/factories";
import {
  testContentExistence,
  testContentNoExistence,
  testElementExistence,
  testElementVisibility,
  testElementNoVisibility
} from "../abstractTests";

const backend = useBackendMock();

let databaseId: string = "";

describe("Remove database", () => {
  beforeEach(() => {
    backend.start();
    cy.visit("/");
    cy.wait("@" + getGetAlias("database"));
    cy.get("@" + getGetAlias("database")).should((xhr: any) => {
      databaseId = xhr.response.body[0].id;
    });
  });

  // test remove database
  describe("when removing a new database", () => {
    // test cancel
    describe("and clicking the cancel button", () => {
      it("will not remove the selected database", () => {
        clickElement(getViewSelector("databaseListButton"));
        testContentExistence(databaseId);

        clickElement(getSelector("removeDatabaseButton"));
        testContentExistence(databaseId);
        testElementExistence(getSelector("removeDatabase"));
        testElementVisibility(getSelector("removeDatabase"));

        clickElement(getSelector("cancelRemoveDatabaseButton"));
        cy.numberOfRequests(getDeleteAlias("database")).should("eq", 0);

        testElementNoVisibility(getSelector("removeDatabase"));

        clickElement(getViewSelector("databaseListButton"));
        testContentExistence(databaseId);
      });
    });

    // test multiple
    describe("and clicking the remove and cancel button multiple times", () => {
      it("will always select the clicked database to be removed", () => {
        const secondDatabaseId = fakeId("database-");
        backend.reload("database", secondDatabaseId, "POST");
        cy.visit("/");

        clickElement(getViewSelector("databaseListButton"));
        testContentExistence(databaseId);
        testContentExistence(secondDatabaseId);

        cy.get(getSelector("removeDatabaseButton"))
          .first()
          .click();

        cy.get(getSelector("removeDatabase")).within(() => {
          cy.get("span").contains(databaseId);
          cy.get("span")
            .contains(secondDatabaseId)
            .should("not.exist");
        });
        clickElement(getSelector("cancelRemoveDatabaseButton"));

        clickElement(getViewSelector("databaseListButton"));
        cy.get(getSelector("removeDatabaseButton"))
          .last()
          .click();

        cy.get(getSelector("removeDatabase")).within(() => {
          cy.get("span").contains(secondDatabaseId);
          cy.get("span")
            .contains(databaseId)
            .should("not.exist");
        });

        backend.reload("database", secondDatabaseId, "DELETE");
      });
    });

    // test delete
    describe("and clicking the remove button", () => {
      it("will remove the selected database", () => {
        clickElement(getViewSelector("databaseListButton"));
        testContentExistence(databaseId);

        clickElement(getSelector("removeDatabaseButton"));
        testContentExistence(databaseId);
        testElementExistence(getSelector("removeDatabase"));
        testElementVisibility(getSelector("removeDatabase"));

        backend.reload("database", databaseId, "DELETE");

        clickElement(getSelector("deleteDatabaseButton"));

        cy.wait("@" + getDeleteAlias("database"));
        cy.get("@" + getDeleteAlias("database")).should((xhr: any) => {
          assertDeleteValues(databaseId, xhr.request.body);
        });
        cy.numberOfRequests(getDeleteAlias("database")).should("eq", 1);
        testElementNoVisibility(getSelector("removeDatabase"));

        clickElement(getViewSelector("databaseListButton"));
        testContentNoExistence(databaseId);
      });
    });
  });
});
