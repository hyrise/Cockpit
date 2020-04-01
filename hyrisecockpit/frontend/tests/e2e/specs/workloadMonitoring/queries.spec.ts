import { testRedirection } from "../abstractTests";
import { useBackendMock } from "../../setup/backendMock";
import { getGetAlias, generateRandomInt } from "../../setup/helpers";
import { getSelector as getViewSelector, getRoute } from "../views/helpers";
import { getSelector, assertQueryData } from "./helpers";

const backend = useBackendMock({ databases: 2 });

let databases: any[] = [];
let data: any = {};

describe("Show detailed query information", () => {
  beforeEach(() => {
    backend.start();
    cy.visit("/");
    cy.wait("@" + getGetAlias("database"));
    cy.get("@" + getGetAlias("database")).should((xhr: any) => {
      databases = xhr.response.body;
    });
    testRedirection(
      getViewSelector("workloadMonitoringButton"),
      getRoute("workloadMonitoring")
    );
    cy.wait("@" + getGetAlias("detailed_query_information"));
    cy.get("@" + getGetAlias("detailed_query_information")).should(
      (xhr: any) => {
        data = xhr.response.body;
      }
    );
  });

  describe("observe query information", () => {
    it("will show correct query information for every database", () => {
      databases.forEach((database: any, idx: number) => {
        cy.get(getSelector("queryTable"))
          .eq(idx)
          .within(() => {
            cy.get("table").should((table: any) => {
              table[0].rows.forEach((row: any, rowIdx: number) => {
                if (rowIdx !== 0)
                  assertQueryData(
                    row.textContent,
                    data[idx].query_information[rowIdx - 1]
                  );
              });
            });
          });
      });
    });
  });
  describe("searching for a specific query", () => {
    it("will show only the matching queries", () => {
      const index = generateRandomInt(0, data[0].query_information.length);
      databases.forEach((database: any, idx: number) => {
        cy.get("input")
          .eq(idx * 3)
          .click({ force: true })
          .type(data[idx].query_information[index].query_number);

        cy.get(getSelector("queryTable"))
          .eq(idx)
          .within(() => {
            cy.get("table").should((table: any) => {
              table[0].rows.forEach((row: any, rowIdx: number) => {
                if (rowIdx !== 0)
                  assertQueryData(
                    row.textContent,
                    data[idx].query_information[index]
                  );
              });
              expect(table[0].rows.length).to.eq(2);
            });
          });
      });
    });
  });
});
