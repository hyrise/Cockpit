import { useBackendMock } from "../../setup/backendMock";
import { getRoute } from "../views/helpers";
import {
  getSelector,
  getSelectorWithID,
  getDetailsSelectorWithID,
  assertBarChartData,
} from "./helpers";
import { waitForChartRender } from "../helpers";

const backend = useBackendMock();

let databases: any[] = [];
let data: any = {};

// test on overview
describe("visiting the overview page", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
    cy.visit(getRoute("overview"));
    waitForChartRender();
  });

  // test chart
  it("will not show a chart", () => {
    cy.get(getSelector("operatorProportion")).should("not.exist");
  });

  // test details
  it("will not show metric details", () => {
    databases.forEach((database: any) => {
      cy.get(
        getDetailsSelectorWithID("operatorProportion", database.id)
      ).should("not.exist");
    });
  });
});

// test comparison
describe("visiting the comparison page", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
    cy.visit(getRoute("comparison"));
    cy.setupData("workload_operator_information").then((xhr: any) => {
      data = {};
      xhr.response.body.forEach((database: any) => {
        const entry: any = {};
        const total = database.workload_operator_information.reduce(
          (sum: number, operator: any) => sum + operator.total_time_ns,
          0
        );
        entry[database.id] = database.workload_operator_information.map(
          (operator: any) => {
            return {
              ...operator,
              relativeTime: (operator.total_time_ns / total) * 100,
            };
          }
        );
        data = { ...data, ...entry };
      });
    });
    waitForChartRender();
  });

  // test data
  it("will show the correct metric data", () => {
    databases.forEach((database: any) => {
      cy.get(getSelectorWithID("operatorProportion", database.id)).should(
        (elements: any) => {
          const transformedData = data[database.id].reduce(
            (obj: any, opData: any) => {
              if (opData.relativeTime < 5) {
                obj.combined.Other = [
                  obj.combined.Other[0] + opData.relativeTime,
                ];
              } else {
                obj.parts[opData.operator] = [opData.relativeTime];
              }
              return obj;
            },
            { parts: {}, combined: { Other: [0] } }
          );
          // assert distinct parts
          assertBarChartData(
            elements[0].data,
            transformedData.parts,
            undefined,
            2
          );
          // assert combined parts
          assertBarChartData(
            elements[0].data,
            transformedData.combined,
            undefined,
            2
          );
        }
      );
    });
  });

  // test layout
  it("will show the correct range and title", () => {
    databases.forEach((database: any) => {
      cy.get(getSelectorWithID("operatorProportion", database.id)).should(
        (elements: any) => {
          const layout = elements[0].layout;
          expect(layout.xaxis.title.text).to.eq("Operator");
          expect(layout.yaxis.title.text).to.eq(
            "Distribution of operator runtimes in %"
          );
          expect(layout.yaxis.range[0]).to.eq(0);
          expect(layout.yaxis.range[1]).to.eq(100);
        }
      );
    });
  });

  // test details
  it("will not show metric details", () => {
    databases.forEach((database: any) => {
      cy.get(
        getDetailsSelectorWithID("operatorProportion", database.id)
      ).should("not.exist");
    });
  });
});
