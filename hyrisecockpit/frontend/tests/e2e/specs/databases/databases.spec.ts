import { useBackendMock } from "../../setup/backendMock";
import { routes, selectors as viewSelectors } from "../views/helpers";
import {
  getDatabaseMainMemoryCapacity,
  getDatabaseMemoryFootprint,
  selectors,
} from "./helpers";
import { testMaxDecimalDigits } from "../helpers";

const backend = useBackendMock({
  databases: 2,
});

let databases: any = [];
let databasesSystemData: any[];
let databasesStorageData: any[];

describe("when observing the database data and details", () => {
  beforeEach(() => {
    cy.restartAppState(backend, {
      databases: 2,
    });
    cy.wait(500);
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
      cy.setupData("system").then((xhr: any) => {
        databasesSystemData = xhr.response.body.map(
          (entry: any) => entry.system_data[0]
        );
        cy.setupData("storage").then((xhr: any) => {
          databasesStorageData = Object.values(xhr.response.body.body.storage);
        });
      });
    });
    cy.visit(routes.overview);
  });

  // clear state
  after(() => {
    cy.restartAppState(backend, {});
  });

  // test showing details on visit
  it("will directly show the details panel", () => {
    cy.get(selectors.databaseSystemDetails).should("be.visible");
  });

  // test correct number of databases
  describe("when clicking the database list button", () => {
    it("will show the correct number of databases", () => {
      cy.get(selectors.numberOfDatabases).contains(databases.length.toString());
      cy.get(viewSelectors.databaseListButton).click();
      cy.get(viewSelectors.databaseList).within(() => {
        databases.forEach((database: any, idx: number) => {
          cy.get(selectors.databaseChip).eq(idx).contains(database.id);
        });
      });
    });
  });

  // test showing correct data
  it("will show the correct system details for every database", () => {
    // test correct data existence
    databases.forEach((database: any, idx: number) => {
      cy.get(selectors.hostDetails).eq(idx).contains(database.host);
      cy.get(selectors.workerDetails).eq(idx).contains(database.number_workers);
      cy.get(selectors.cpuDetails)
        .eq(idx)
        .contains(
          databasesSystemData[idx].system_data.cpu.cpu_count.toString()
        );
      cy.get(selectors.memoryCapacityDetails)
        .eq(idx)
        .contains(
          getDatabaseMainMemoryCapacity(databasesSystemData[idx].system_data)
        );
      cy.get(selectors.memoryFootprintDetails)
        .eq(idx)
        .contains(getDatabaseMemoryFootprint(databasesStorageData[idx]));
    });

    // test correct rounding
    databases.forEach((database: any, idx: number) => {
      cy.get(selectors.memoryCapacityDetails)
        .eq(idx)
        .invoke("text")
        .then((text: any) => {
          testMaxDecimalDigits(text, 3);
        });
      cy.get(selectors.memoryFootprintDetails)
        .eq(idx)
        .invoke("text")
        .then((text: any) => {
          testMaxDecimalDigits(text, 3);
        });
    });
  });

  // test correct database colors
  describe("when changing routes", () => {
    it("will show the same database colors", () => {
      const colors: string[] = [];
      cy.get(viewSelectors.databaseListButton).click();
      cy.get(viewSelectors.databaseList).within(() => {
        databases.forEach((database: any, idx: number) => {
          cy.get(selectors.databaseChip)
            .eq(idx)
            .then((elem: any) => {
              colors.push(elem[0].style.backgroundColor);
            });
        });
      });
      cy.visit(routes.overview);
      cy.get(viewSelectors.databaseListButton).click();
      cy.get(viewSelectors.databaseList).within(() => {
        databases.forEach((database: any, idx: number) => {
          cy.get(selectors.databaseChip)
            .eq(idx)
            .then((elem: any) => {
              expect(colors[idx]).to.eq(elem[0].style.backgroundColor);
            });
        });
      });
    });
  });

  // test empty databases
  describe("when no database has been added", () => {
    it("will show empty database list and details", () => {
      cy.restartAppState(backend, {
        databases: 0,
      });
      cy.visit("/");

      cy.get(selectors.numberOfDatabases).contains("0");

      cy.get(viewSelectors.databaseListButton).click();
      cy.get(viewSelectors.databaseList).within(() => {
        cy.get(selectors.databaseChip).should("not.exist");
      });

      cy.visit(routes.overview);
      cy.get(selectors.databaseSystemDetails).should("not.exist");

      cy.restartAppState(backend, {});
    });
  });
});
