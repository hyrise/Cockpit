import { useBackendMock } from "../../setup/backendMock";
import { clickElement } from "../helpers";
import { getGetAlias } from "../../setup/helpers";
import { getSelector as getViewSelector, getRoute } from "../views/helpers";
import {
  getSelector,
  getDatabaseMainMemoryCapacity,
  getDatabaseMemoryFootprint
} from "./helpers";
import {
  testElementExistence,
  testElementVisibility,
  testElementNoVisibility,
  testRedirection,
  testMaxDecimalDigits
} from "../abstractTests";

const backend = useBackendMock({
  databases: 2,
  tables: 2,
  columns: 2,
  chunks: 2,
  queries: 10,
  plugins: 2,
  activated_plugins: 1
});

let databases: any = [];
let databasesSystemData: any[];
let databasesStorageData: any[];

describe("Show database data", () => {
  beforeEach(() => {
    backend.start();
    cy.visit("/");
    cy.wait("@" + getGetAlias("database"));
    cy.get("@" + getGetAlias("database")).should((xhr: any) => {
      databases = xhr.response.body;
    });
    cy.wait("@" + getGetAlias("system"));
    cy.get("@" + getGetAlias("system")).should((xhr: any) => {
      databasesSystemData = Object.values(xhr.response.body.body.system_data);
    });
    cy.wait("@" + getGetAlias("storage"));
    cy.get("@" + getGetAlias("storage")).should((xhr: any) => {
      databasesStorageData = Object.values(xhr.response.body.body.storage);
    });
    testRedirection(getViewSelector("overviewButton"), getRoute("overview"));
  });

  // test database system details
  describe("when opening a page with database system details ", () => {
    // test panel opening
    describe("and just visiting the view", () => {
      it("will directly show the details panel", () => {
        testElementExistence(getSelector("databaseSystemDetails"));
        testElementVisibility(getSelector("databaseSystemDetails"));
      });
    });
    // test panel closing
    describe("and clicking the panel two times", () => {
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

    // test correct number of databases
    describe("and clicking the databaslist button", () => {
      it("will show the correct number of databases", () => {
        cy.get(getSelector("numberOfDatabases")).contains(
          databases.length.toString()
        );
        clickElement(getViewSelector("databaseListButton"));
        cy.get(getViewSelector("databaseList")).within(() => {
          for (let i = 0; i < databases.length; i++) {
            cy.contains(databases[i].id);
          }
        });
      });
    });

    // test showing correct data
    describe("and just visiting the view", () => {
      it("will show the correct system details for every database", () => {
        // test correct data existence
        for (let i = 0; i < databases.length; i++) {
          cy.get(getSelector("idDetails"))
            .eq(i)
            .contains(databases[i].id);
          cy.get(getSelector("hostDetails"))
            .eq(i)
            .contains(databases[i].host);
          cy.get(getSelector("workerDetails"))
            .eq(i)
            .contains(databases[i].number_workers);
          cy.get(getSelector("cpuDetails"))
            .eq(i)
            .contains(databasesSystemData[i].cpu.cpu_count.toString());
          cy.get(getSelector("memoryCapacityDetails"))
            .eq(i)
            .contains(getDatabaseMainMemoryCapacity(databasesSystemData[i]));
          cy.get(getSelector("memoryFootprintDetails"))
            .eq(i)
            .contains(getDatabaseMemoryFootprint(databasesStorageData[i]));
        }

        // test correct rounding
        for (let i = 0; i < databases.length; i++) {
          cy.get(getSelector("memoryCapacityDetails"))
            .eq(i)
            .invoke("text")
            .then((text: any) => {
              testMaxDecimalDigits(text, 3);
            });

          cy.get(getSelector("memoryFootprintDetails"))
            .eq(i)
            .invoke("text")
            .then((text: any) => {
              testMaxDecimalDigits(text, 3);
            });
        }
      });
    });
  });
});
