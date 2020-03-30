import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getPostAlias } from "../../setup/helpers";
import { getSelector as getViewSelector } from "../views/helpers";
import { getSelector, assertPostValues, DatabaseData } from "./helpers";
import { fakeId, fakeDatabaseData } from "../../setup/factories";
import {
  testContentExistence,
  testContentNoExistence,
  testElementExistence,
  testElementVisibility,
  testElementNoVisibility
} from "../abstractTests";

const backend = useBackendMock();

const newDatabase: DatabaseData = fakeDatabaseData(
  fakeId("database-")
) as DatabaseData;

describe("Add database", () => {
  beforeEach(() => {
    backend.start();
    cy.visit("/");
  });

  // test add database
  describe("when adding a new database", () => {
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

    // test save
    describe("and clicking the save button", () => {
      it("will add a new database with the correct data", () => {
        clickElement(getViewSelector("databaseListButton"));
        testContentNoExistence(newDatabase.id);

        clickElement(getSelector("addDatabaseButton"));
        testElementExistence(getSelector("addDatabase"));
        testElementVisibility(getSelector("addDatabase"));

        backend.reload("database", newDatabase.id, "POST");

        cy.get(getSelector("idInput"))
          .clear()
          .type(newDatabase.id);
        cy.get(getSelector("hostInput"))
          .clear()
          .type(newDatabase.host);
        cy.get(getSelector("portInput"))
          .clear()
          .type(newDatabase.port);
        cy.get(getSelector("workerInput"))
          .clear()
          .type(newDatabase.number_workers.toString());
        cy.get(getSelector("dbNameInput"))
          .clear()
          .type(newDatabase.dbname);

        clickElement(getSelector("saveDatabaseButton"));

        cy.wait("@" + getPostAlias("database"));
        cy.get("@" + getPostAlias("database")).should((xhr: any) => {
          assertPostValues(newDatabase, xhr.request.body);
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
      });
    });
  });
});
