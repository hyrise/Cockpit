import { useBackendMock, mockBackend } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getDeleteAlias } from "../../setup/helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import { getSelector, assertDeleteValues } from "./helpers";
import { fakeId } from "../../setup/factories";
import {
  testContentExistence,
  testContentNoExistence,
  testElementExistence,
  testElementVisibility,
  testElementNoVisibility,
} from "../abstractTests";

const backend = mockBackend();

let databaseId: string = "";

describe("When removing a database", () => {
  beforeEach(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databaseId = xhr.response.body[0].id;
    });
  });

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
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(getSelector("databaseChip")).contains(databaseId);
      });
    });
  });

  // test multiple
  describe("and clicking the remove and cancel button multiple times", () => {
    it("will always select the clicked database to be removed", () => {
      const secondDatabaseId = fakeId("database-", 2);
      backend.reload("database", secondDatabaseId, "POST");
      cy.reload();

      clickElement(getViewSelector("databaseListButton"));
      testContentExistence(databaseId);
      testContentExistence(secondDatabaseId);

      cy.get(getSelector("removeDatabaseButton")).first().click();

      cy.get(getSelector("removeDatabase")).within(() => {
        cy.get("span").contains(databaseId);
        cy.get("span").contains(secondDatabaseId).should("not.exist");
      });
      clickElement(getSelector("cancelRemoveDatabaseButton"));

      clickElement(getViewSelector("databaseListButton"));
      cy.get(getSelector("removeDatabaseButton")).last().click();

      cy.get(getSelector("removeDatabase")).within(() => {
        cy.get("span").contains(secondDatabaseId);
        cy.get("span").contains(databaseId).should("not.exist");
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
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(getSelector("databaseChip")).should("not.exist");
      });
    });
  });
});
