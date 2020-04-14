import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getPostAlias } from "../../setup/helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import {
  getSelector,
  assertDefaultPostValues,
  assertAdvancedPostValues,
  DatabaseData
} from "./helpers";
import { fakeId, fakeDatabaseData } from "../../setup/factories";
import {
  testContentExistence,
  testContentNoExistence,
  testElementExistence,
  testElementVisibility,
  testElementNoVisibility,
  testElementNoExistence,
  testButtonIsDisabled
} from "../abstractTests";

const backend = useBackendMock();

const newDatabase: DatabaseData = fakeDatabaseData(
  fakeId("database-")
) as DatabaseData;

describe("When adding a new database", () => {
  beforeEach(() => {
    backend.start();
    cy.visit("/");
  });

  // test cancel
  describe("and clicking the cancel button", () => {
    it("will not add a new database", () => {
      clickElement(getViewSelector("databaseListButton"));
      testContentNoExistence(newDatabase.id);

      clickElement(getSelector("addDatabaseButton"));
      testElementExistence(getSelector("addDatabase"));
      testElementVisibility(getSelector("addDatabase"));

      clickElement(getSelector("cancelAddDatabaseButton"));
      cy.numberOfRequests(getPostAlias("database")).should("eq", 0);

      testElementNoVisibility(getSelector("addDatabase"));

      clickElement(getViewSelector("databaseListButton"));
      testContentNoExistence(newDatabase.id);
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(getSelector("databaseChip"))
          .contains(newDatabase.id)
          .should("not.exist");
      });
    });
  });

  // test default save
  describe("and clicking the save button with default data", () => {
    it("will add a new database with the correct data", () => {
      clickElement(getViewSelector("databaseListButton"));
      testContentNoExistence(newDatabase.host);

      clickElement(getSelector("addDatabaseButton"));
      testElementExistence(getSelector("addDatabase"));
      testElementVisibility(getSelector("addDatabase"));

      backend.reload("database", newDatabase.host, "POST");

      cy.get(getSelector("hostInput"))
        .clear()
        .type(newDatabase.host);
      cy.get(getSelector("workerInput"))
        .clear()
        .type(newDatabase.number_workers.toString());

      clickElement(getSelector("saveDatabaseButton"));

      cy.wait("@" + getPostAlias("database"));
      cy.get("@" + getPostAlias("database")).should((xhr: any) => {
        assertDefaultPostValues(newDatabase, xhr.request.body);
      });
      cy.numberOfRequests(getPostAlias("database")).should("eq", 1);
      testElementNoVisibility(getSelector("addDatabase"));

      clickElement(getViewSelector("databaseListButton"));
      testContentExistence(newDatabase.host);
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(getSelector("databaseChip"))
          .eq(1)
          .contains(newDatabase.host);
      });
      backend.reload("database", newDatabase.host, "DELETE");
    });
  });

  // test advanced save
  describe("and clicking the save button with advanced data", () => {
    it("will add a new database with the correct data", () => {
      clickElement(getViewSelector("databaseListButton"));
      testContentNoExistence(newDatabase.id);

      clickElement(getSelector("addDatabaseButton"));
      testElementExistence(getSelector("addDatabase"));
      testElementVisibility(getSelector("addDatabase"));

      backend.reload("database", newDatabase.id, "POST");

      cy.get(getSelector("hostInput"))
        .clear()
        .type(newDatabase.host);
      cy.get(getSelector("idInput"))
        .clear()
        .type(newDatabase.id);
      cy.get(getSelector("workerInput"))
        .clear()
        .type(newDatabase.number_workers.toString());

      clickElement(getSelector("advancedInputButton"));

      cy.get(getSelector("portInput"))
        .clear()
        .type(newDatabase.port);
      cy.get(getSelector("dbNameInput"))
        .clear()
        .type(newDatabase.dbname);
      cy.get(getSelector("userInput"))
        .clear()
        .type(newDatabase.port);
      cy.get(getSelector("passwordInput"))
        .clear()
        .type(newDatabase.dbname);

      clickElement(getSelector("saveDatabaseButton"));

      cy.wait("@" + getPostAlias("database"));
      cy.get("@" + getPostAlias("database")).should((xhr: any) => {
        assertAdvancedPostValues(newDatabase, xhr.request.body);
      });
      cy.numberOfRequests(getPostAlias("database")).should("eq", 1);
      testElementNoVisibility(getSelector("addDatabase"));

      clickElement(getViewSelector("databaseListButton"));
      testContentExistence(newDatabase.id);
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(getSelector("databaseChip"))
          .eq(1)
          .contains(newDatabase.id);
      });
      backend.reload("database", newDatabase.host, "DELETE");
    });
  });

  // test toggling advanced input button
  describe("and clicking the advanced input button multipe times", () => {
    it("will toggle the advanced input fields", () => {
      clickElement(getViewSelector("databaseListButton"));
      clickElement(getSelector("addDatabaseButton"));

      testElementNoExistence(getSelector("portInput"));
      testElementNoExistence(getSelector("dbNameInput"));
      testElementNoExistence(getSelector("userInput"));
      testElementNoExistence(getSelector("passwordInput"));

      clickElement(getSelector("advancedInputButton"));

      testElementVisibility(getSelector("portInput"));
      testElementVisibility(getSelector("dbNameInput"));
      testElementVisibility(getSelector("userInput"));
      testElementVisibility(getSelector("passwordInput"));

      clickElement(getSelector("advancedInputButton"));

      testElementNoVisibility(getSelector("portInput"));
      testElementNoVisibility(getSelector("dbNameInput"));
      testElementNoVisibility(getSelector("userInput"));
      testElementNoVisibility(getSelector("passwordInput"));
    });
  });

  // test non-unique ID
  describe("and trying to add a database with already used ID", () => {
    it("will add an error message", () => {
      backend.reload("database", newDatabase.id, "POST");
      cy.reload();

      clickElement(getViewSelector("databaseListButton"));
      clickElement(getSelector("addDatabaseButton"));
      testElementExistence(getSelector("addDatabase"));
      testElementVisibility(getSelector("addDatabase"));

      cy.get(getSelector("hostInput"))
        .clear()
        .type(newDatabase.host);
      cy.get(getSelector("idInput"))
        .clear()
        .type(newDatabase.id);
      cy.get(getSelector("workerInput"))
        .clear()
        .type(newDatabase.number_workers.toString());

      cy.contains("ID is already taken.");
      testButtonIsDisabled(getSelector("saveDatabaseButton"));

      backend.reload("database", newDatabase.host, "DELETE");
    });
  });
});
