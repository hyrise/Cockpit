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
    cy.setupData("operator").then((xhr: any) => {
      data = {};
      xhr.response.body.forEach((database: any) => {
        const entry: any = {};
        const total = database.operator_data.reduce(
          (sum: number, operator: any) => sum + operator.total_time_ns,
          0
        );
        entry[database.id] = database.operator_data.map((operator: any) => {
          return {
            ...operator,
            relativeTime: (operator.total_time_ns / total) * 100,
          };
        });
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
          assertBarChartData(
            elements[0].data,
            data[database.id].reduce((obj: any, opData: any) => {
              obj[opData.operator] = opData.relativeTime;
              return obj;
            }, {})
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
          expect(layout.yaxis.title.text).to.eq("Proportion of operators in %");
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
