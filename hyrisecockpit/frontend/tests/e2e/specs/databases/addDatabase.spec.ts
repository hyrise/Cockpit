import { useBackendMock } from "../../setup/backendMock";
import { selectors as viewSelectors } from "../views/helpers";
import { assertPostRequest, DatabaseData, selectors } from "./helpers";
import { fakeId, fakeDatabaseData } from "../../setup/factories";
import { getPostAlias } from "../../setup/helpers";

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
      cy.get(viewSelectors.databaseListButton).click();
      cy.get(selectors.addDatabaseButton).click();

      cy.get(selectors.cancelAddDatabaseButton).click();
      cy.numberOfRequests(getPostAlias("database")).should("eq", 0);

      cy.get(selectors.addDatabase).should("not.be.visible");

      cy.get(viewSelectors.databaseListButton).click();

      cy.get(viewSelectors.databaseList).within(() => {
        cy.get(selectors.databaseChip)
          .contains(newDatabase.id)
          .should("not.exist");
      });
    });
  });

  // test cancel
  describe("and not filling out all input fields", () => {
    it("will not add a new database", () => {
      cy.get(viewSelectors.databaseListButton).click();
      cy.get(selectors.addDatabaseButton).click();

      cy.get(selectors.hostInput).clear().type(newDatabase.host);
      cy.get(selectors.workerInput)
        .clear()
        .type(newDatabase.number_workers.toString());
      cy.get(selectors.portInput).clear().type(newDatabase.port);

      // dont add an ID
      cy.get(selectors.idInput).clear();

      cy.get(selectors.saveDatabaseButton).should("be.disabled");

      cy.numberOfRequests(getPostAlias("database")).should("eq", 0);
    });
  });

  // test  save
  describe("and clicking the save button", () => {
    it("will add a new database with the correct data", () => {
      cy.get(viewSelectors.databaseListButton).click();
      cy.get(selectors.addDatabaseButton).click();

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
      cy.get(selectors.portInput).clear().type(newDatabase.port);

      cy.get(selectors.saveDatabaseButton).click();

      cy.wait("@" + getPostAlias("database"));
      cy.get("@" + getPostAlias("database")).should((xhr: any) => {
        assertPostRequest(newDatabase, xhr.request.body);
      });
      cy.numberOfRequests(getPostAlias("database")).should("eq", 1);

      cy.get(selectors.cancelAddDatabaseButton).click();
      cy.get(viewSelectors.databaseListButton).click();
      cy.get(viewSelectors.databaseList).within(() => {
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
      cy.get(viewSelectors.databaseListButton).click();
      cy.get(selectors.addDatabaseButton).click();

      cy.get(selectors.hostInput).clear().type(newDatabase.host);
      cy.get(selectors.idInput).clear().type(databases[0].id);
      cy.get(selectors.workerInput)
        .clear()
        .type(newDatabase.number_workers.toString());

      cy.contains("ID is already taken.");
      cy.get(selectors.saveDatabaseButton).should("be.disabled");
    });
  });
});
