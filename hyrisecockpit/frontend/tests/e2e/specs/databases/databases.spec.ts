import { useBackendMock, mockBackend } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getSelector as getViewSelector, getRoute } from "../views/helpers";
import {
  getSelector,
  getDatabaseMainMemoryCapacity,
  getDatabaseMemoryFootprint,
} from "./helpers";
import {
  testElementExistence,
  testElementVisibility,
  testElementNoVisibility,
  testMaxDecimalDigits,
} from "../abstractTests";

let backend = mockBackend({
  databases: 2,
});

let databases: any = [];
let databasesSystemData: any[];
let databasesStorageData: any[];

describe("when observing the database data and details", () => {
  beforeEach(() => {
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
    cy.visit(getRoute("overview"));
  });

  // test panel opening
  it("will directly show the details panel", () => {
    testElementExistence(getSelector("databaseSystemDetails"));
    testElementVisibility(getSelector("databaseSystemDetails"));
  });

  // test correct number of databases
  describe("when clicking the database list button", () => {
    it("will show the correct number of databases", () => {
      cy.get(getSelector("numberOfDatabases")).contains(
        databases.length.toString()
      );
      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
        databases.forEach((database: any, idx: number) => {
          cy.get(getSelector("databaseChip")).eq(idx).contains(database.id);
        });
      });
    });
  });

  // test showing correct data
  it("will show the correct system details for every database", () => {
    // test correct data existence
    databases.forEach((database: any, idx: number) => {
      cy.get(getSelector("idDetails")).eq(idx).contains(database.id);
      cy.get(getSelector("hostDetails")).eq(idx).contains(database.host);
      cy.get(getSelector("workerDetails"))
        .eq(idx)
        .contains(database.number_workers);
      cy.get(getSelector("cpuDetails"))
        .eq(idx)
        .contains(
          databasesSystemData[idx].system_data.cpu.cpu_count.toString()
        );
      cy.get(getSelector("memoryCapacityDetails"))
        .eq(idx)
        .contains(
          getDatabaseMainMemoryCapacity(databasesSystemData[idx].system_data)
        );
      cy.get(getSelector("memoryFootprintDetails"))
        .eq(idx)
        .contains(getDatabaseMemoryFootprint(databasesStorageData[idx]));
    });

    // test correct rounding
    databases.forEach((database: any, idx: number) => {
      cy.get(getSelector("memoryCapacityDetails"))
        .eq(idx)
        .invoke("text")
        .then((text: any) => {
          testMaxDecimalDigits(text, 3);
        });
      cy.get(getSelector("memoryFootprintDetails"))
        .eq(idx)
        .invoke("text")
        .then((text: any) => {
          testMaxDecimalDigits(text, 3);
        });
    });
  });

  // test panel closing
  describe("when clicking the panel two times", () => {
    it("will close the details and open it again", () => {
      cy.get(getSelector("databaseDetailsPanel")).within(() => {
        cy.get("button").click();
      });
      testElementNoVisibility(getSelector("databaseSystemDetails"));

      cy.get(getSelector("databaseDetailsPanel")).within(() => {
        cy.get("button").click();
      });
      testElementVisibility(getSelector("databaseSystemDetails"));
    });
  });

  // test correct database colors
  describe("when changing routes", () => {
    it("will show the same database colors", () => {
      const colors: string[] = [];
      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
        databases.forEach((database: any, idx: number) => {
          cy.get(getSelector("databaseChip"))
            .eq(idx)
            .then((elem: any) => {
              colors.push(elem[0].style.backgroundColor);
            });
        });
      });
      cy.visit(getRoute("overview"));
      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
        databases.forEach((database: any, idx: number) => {
          cy.get(getSelector("databaseChip"))
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
      backend = mockBackend({
        databases: 0,
      });
      backend.restart();
      cy.visit("/");

      cy.get(getSelector("numberOfDatabases")).contains("0");

      clickElement(getViewSelector("databaseListButton"));
      cy.get(getViewSelector("databaseList")).within(() => {
        cy.get(getSelector("databaseChip")).should("not.exist");
      });

      cy.visit(getRoute("overview"));
      cy.get(getSelector("databaseSystemDetails")).should("not.exist");
    });
  });
});
