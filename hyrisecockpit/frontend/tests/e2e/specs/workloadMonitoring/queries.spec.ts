import { testRedirection } from "../abstractTests";
import { useBackendMock } from "../../setup/backendMock";
import { generateRandomInt } from "../../setup/helpers";
import { getSelector as getViewSelector, getRoute } from "../views/helpers";
import { getSelector, assertQueryData } from "./helpers";

const backend = useBackendMock();

let databases: any[] = [];
let data: any = [];

// test on workload monitoring
describe("visiting workload monitoring page", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
    testRedirection(
      getViewSelector("workloadMonitoringButton"),
      getRoute("workloadMonitoring")
    );
    cy.setupData("detailed_query_information").then((xhr: any) => {
      data = [];
      xhr.response.body.forEach((database: any) => {
        database.query_information = database.query_information.sort(
          (query1: any, query2: any) => query2.latency - query1.latency
        );
        data.push(database);
      });
    });
  });

  // test data
  it("will show correct query information for every database sorted by latency", () => {
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

  // test sorting
  describe("when changing the sorting order of latency", () => {
    it("will sort the queries otherwise", () => {
      databases.forEach((database: any, idx: number) => {
        cy.get("table")
          .eq(idx)
          .within(() => {
            cy.get("tr")
              .contains("latency (in ms)")
              .click({ force: true });
          });

        cy.get(getSelector("queryTable"))
          .eq(idx)
          .within(() => {
            cy.get("table").should((table: any) => {
              table[0].rows.forEach((row: any, rowIdx: number) => {
                const requestData = data[idx].query_information;
                if (rowIdx !== 0)
                  assertQueryData(
                    row.textContent,
                    requestData[requestData.length - rowIdx]
                  );
              });
            });
          });

        cy.get("table")
          .eq(idx)
          .within(() => {
            cy.get("tr")
              .contains("latency (in ms)")
              .click({ force: true });
          });
      });
    });
  });

  // test searching
  describe("when searching for a specific query", () => {
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
