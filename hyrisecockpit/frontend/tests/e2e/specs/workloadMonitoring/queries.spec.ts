import { useBackendMock } from "../../setup/backendMock";
import { generateRandomInt } from "../../setup/helpers";
import { routes } from "../views/helpers";
import { assertQueryData, selectors } from "./helpers";

const backend = useBackendMock();

let databases: any[] = [];
let data: any = [];

// test on workload monitoring
describe("visiting workload monitoring page", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
    cy.visit(routes.workloadMonitoring);
    cy.setupData("detailed_query_information").then((xhr: any) => {
      data = [];
      xhr.response.body.forEach((database: any) => {
        database.detailed_query_information = database.detailed_query_information.sort(
          (query1: any, query2: any) => query2.latency - query1.latency
        );
        data.push(database);
      });
    });
  });

  // test data
  it("will show correct query information for every database sorted by latency", () => {
    databases.forEach((database: any, idx: number) => {
      cy.get(selectors.queryTable)
        .eq(idx)
        .within(() => {
          cy.get("table").should((table: any) => {
            table[0].rows.forEach((row: any, rowIdx: number) => {
              if (rowIdx !== 0)
                assertQueryData(
                  row.textContent,
                  data[idx].detailed_query_information[rowIdx - 1]
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
            cy.get("tr").contains("latency (in ms)").click();
          });

        cy.get(selectors.queryTable)
          .eq(idx)
          .within(() => {
            cy.get("table").should((table: any) => {
              table[0].rows.forEach((row: any, rowIdx: number) => {
                const requestData = data[idx].detailed_query_information;
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
            cy.get("tr").contains("latency (in ms)").click();
          });
      });
    });
  });

  // test searching
  describe("when searching for a specific query", () => {
    it("will show only the matching queries", () => {
      const index = generateRandomInt(
        0,
        data[0].detailed_query_information.length
      );
      databases.forEach((database: any, idx: number) => {
        cy.get(selectors.querySearch)
          .eq(idx)
          .click()
          .type(data[idx].detailed_query_information[index].query_number);
        cy.wait(500);

        cy.get(selectors.queryTable)
          .eq(idx)
          .within(() => {
            cy.get("table").should((table: any) => {
              table[0].rows.forEach((row: any, rowIdx: number) => {
                if (rowIdx !== 0)
                  assertQueryData(
                    row.textContent,
                    data[idx].detailed_query_information[index]
                  );
              });
              expect(table[0].rows.length).to.eq(2);
            });
          });
      });
    });
  });
});
