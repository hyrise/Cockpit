import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getPostAlias } from "../../setup/helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import {
  getSelector,
  assertDefaultPostValues,
  assertAdvancedPostValues,
  DatabaseData,
} from "./helpers";
import { fakeId, fakeDatabaseData } from "../../setup/factories";
import {
  testElementVisibility,
  testElementNoVisibility,
  testElementNoExistence,
  testButtonIsDisabled,
  testContentNoExistence,
} from "../abstractTests";

const backend = useBackendMock();

let databases: any = [];
const newDatabase: DatabaseData = fakeDatabaseData(
  fakeId("database-", 2)
) as DatabaseData;

describe("When adding a new database", () => {
  beforeEach(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
  });

  // test cancel
  describe("and clicking the cancel button", () => {
    it("will not add a new database", () => {
      clickElement(getViewSelector("databaseListButton"));
      clickElement(getSelector("addDatabaseButton"));

      clickElement(getSelector("cancelAddDatabaseButton"));
      cy.numberOfRequests(getPostAlias("database")).should("eq", 0);

      testElementNoVisibility(getSelector("addDatabase"));

      clickElement(getViewSelector("databaseListButton"));

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
      clickElement(getSelector("addDatabaseButton"));
      testContentNoExistence(newDatabase.host);

      // update tmp state
      cy.updateAppState(backend, {
        request: "database",
        id: newDatabase.host,
        method: "POST",
      });

      cy.get(getSelector("hostInput")).clear().type(newDatabase.host);
      cy.get(getSelector("workerInput"))
        .clear()
        .type(newDatabase.number_workers.toString());

      clickElement(getSelector("saveDatabaseButton"));

      cy.wait("@" + getPostAlias("database"));
      cy.get("@" + getPostAlias("database")).should((xhr: any) => {
        assertDefaultPostValues(newDatabase, xhr.request.body);
      });
      cy.numberOfRequests(getPostAlias("database")).should("eq", 1);

      cy.wait(500);
      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(getSelector("databaseChip"))
          .eq(databases.length)
          .contains(newDatabase.host);
      });

      // clean tmp state
      cy.cleanAppState(backend, {
        request: "database",
        id: newDatabase.host,
        method: "DELETE",
      });
    });
  });

  // test advanced save
  describe("and clicking the save button with advanced data", () => {
    it("will add a new database with the correct data", () => {
      clickElement(getViewSelector("databaseListButton"));
      clickElement(getSelector("addDatabaseButton"));
      testContentNoExistence(newDatabase.id);

      // update tmp state
      cy.updateAppState(backend, {
        request: "database",
        id: newDatabase.id,
        method: "POST",
      });

      cy.get(getSelector("hostInput")).clear().type(newDatabase.host);
      cy.get(getSelector("idInput")).clear().type(newDatabase.id);
      cy.get(getSelector("workerInput"))
        .clear()
        .type(newDatabase.number_workers.toString());

      clickElement(getSelector("advancedInputButton"));

      cy.get(getSelector("portInput")).clear().type(newDatabase.port);
      cy.get(getSelector("dbNameInput")).clear().type(newDatabase.dbname);
      cy.get(getSelector("userInput")).clear().type(newDatabase.port);
      cy.get(getSelector("passwordInput")).clear().type(newDatabase.dbname);

      clickElement(getSelector("saveDatabaseButton"));

      cy.wait("@" + getPostAlias("database"));
      cy.get("@" + getPostAlias("database")).should((xhr: any) => {
        assertAdvancedPostValues(newDatabase, xhr.request.body);
      });
      cy.numberOfRequests(getPostAlias("database")).should("eq", 1);

      cy.wait(500);
      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(getSelector("databaseChip"))
          .eq(databases.length)
          .contains(newDatabase.id);
      });

      // clean tmp state
      cy.cleanAppState(backend, {
        request: "database",
        id: newDatabase.id,
        method: "DELETE",
      });
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
    it("will show an error message", () => {
      clickElement(getViewSelector("databaseListButton"));
      clickElement(getSelector("addDatabaseButton"));

      cy.get(getSelector("hostInput")).clear().type(newDatabase.host);
      cy.get(getSelector("idInput")).clear().type(databases[0].id);
      cy.get(getSelector("workerInput"))
        .clear()
        .type(newDatabase.number_workers.toString());

      cy.contains("ID is already taken.");
      testButtonIsDisabled(getSelector("saveDatabaseButton"));
    });
  });
});
