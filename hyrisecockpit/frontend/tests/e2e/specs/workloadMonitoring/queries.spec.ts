import { testRedirection } from "../abstractTests";
import { useBackendMock } from "../../setup/backendMock";
import { getGetAlias } from "../../setup/helpers";
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
    it("will show correct queryinformation for every database", () => {
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
});
