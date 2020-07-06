import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getPostAlias } from "../../setup/helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import {
  assertDefaultPostValues,
  assertAdvancedPostValues,
  DatabaseData,
  selectors,
} from "./helpers";
import { fakeId, fakeDatabaseData } from "../../setup/factories";
import {
  testElementNoVisibility,
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
      clickElement(selectors.addDatabaseButton);

      clickElement(selectors.cancelAddDatabaseButton);
      cy.numberOfRequests(getPostAlias("database")).should("eq", 0);

      testElementNoVisibility(selectors.addDatabase);

      clickElement(getViewSelector("databaseListButton"));

      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(selectors.databaseChip)
          .contains(newDatabase.id)
          .should("not.exist");
      });
    });
  });

  // test default save
  describe("and clicking the save button with default data", () => {
    it("will add a new database with the correct data", () => {
      clickElement(getViewSelector("databaseListButton"));
      clickElement(selectors.addDatabaseButton);
      testContentNoExistence(newDatabase.host);

      // update tmp state
      cy.updateAppState(backend, {
        request: "database",
        id: newDatabase.host,
        method: "POST",
      });

      cy.get(selectors.hostInput).clear().type(newDatabase.host);
      cy.get(selectors.workerInput)
        .clear()
        .type(newDatabase.number_workers.toString());

      clickElement(selectors.saveDatabaseButton);

      cy.wait("@" + getPostAlias("database"));
      cy.get("@" + getPostAlias("database")).should((xhr: any) => {
        assertDefaultPostValues(newDatabase, xhr.request.body);
      });
      cy.numberOfRequests(getPostAlias("database")).should("eq", 1);

      cy.wait(500);
      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(selectors.databaseChip)
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
      clickElement(selectors.addDatabaseButton);
      testContentNoExistence(newDatabase.id);

      // update tmp state
      cy.updateAppState(backend, {
        request: "database",
        id: newDatabase.id,
        method: "POST",
      });

      cy.get(selectors.hostInput).clear().type(newDatabase.host);
      cy.get(selectors.idInput).clear().type(newDatabase.id);
      cy.get(selectors.workerInput)
        .clear()
        .type(newDatabase.number_workers.toString());

      clickElement(selectors.advancedInputButton);

      cy.get(selectors.portInput).clear().type(newDatabase.port);
      cy.get(selectors.dbNameInput).clear().type(newDatabase.dbname);
      cy.get(selectors.userInput).clear().type(newDatabase.port);
      cy.get(selectors.passwordInput).clear().type(newDatabase.dbname);

      clickElement(selectors.saveDatabaseButton);

      cy.wait("@" + getPostAlias("database"));
      cy.get("@" + getPostAlias("database")).should((xhr: any) => {
        assertAdvancedPostValues(newDatabase, xhr.request.body);
      });
      cy.numberOfRequests(getPostAlias("database")).should("eq", 1);

      cy.wait(500);
      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(selectors.databaseChip)
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

  // test non-unique ID
  describe("and trying to add a database with already used ID", () => {
    it("will show an error message", () => {
      clickElement(getViewSelector("databaseListButton"));
      clickElement(selectors.addDatabaseButton);

      cy.get(selectors.hostInput).clear().type(newDatabase.host);
      cy.get(selectors.idInput).clear().type(databases[0].id);
      cy.get(selectors.workerInput)
        .clear()
        .type(newDatabase.number_workers.toString());

      cy.contains("ID is already taken.");
      testButtonIsDisabled(selectors.saveDatabaseButton);
    });
  });
});
