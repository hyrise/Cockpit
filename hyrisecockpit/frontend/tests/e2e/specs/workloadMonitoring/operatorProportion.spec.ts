import { useBackendMock } from "../../setup/backendMock";
import { getRoute } from "../views/helpers";
import { getSelector } from "./helpers";
import {
  assertBarChartData,
  getDetailsSelectorWithID,
} from "../metrics/helpers";
import { waitForChartRender } from "../helpers";

const backend = useBackendMock();

let database: any = {};
let data: any = {};

// test on workload monitoring
describe("visiting the workload monitoring page", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      database = xhr.response.body[0];
    });
    cy.visit(getRoute("workloadMonitoring"));
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
    cy.get(getSelector("operatorProportion")).should((elements: any) => {
      const transformedData = data[database.id].reduce(
        (obj: any, opData: any) => {
          if (opData.relativeTime < 5) {
            obj.combined.rest = obj.combined.rest + opData.relativeTime;
          } else {
            obj.parts[opData.operator] = opData.relativeTime;
          }
          return obj;
        },
        { parts: {}, combined: { rest: 0 } }
      );
      // assert distinct parts
      assertBarChartData(elements[0].data, transformedData.parts);
      // assert combined parts
      assertBarChartData(elements[0].data, transformedData.combined);
    });
  });

  // test layout
  it("will show the correct range and title", () => {
    cy.get(getSelector("operatorProportion")).should((elements: any) => {
      const layout = elements[0].layout;
      expect(layout.xaxis.title.text).to.eq("Operator");
      expect(layout.yaxis.title.text).to.eq("Proportion of operators in %");
      expect(layout.yaxis.range[0]).to.eq(0);
      expect(layout.yaxis.range[1]).to.eq(100);
    });
  });

  // test details
  it("will not show metric details", () => {
    cy.get(getDetailsSelectorWithID("operatorProportion", database.id)).should(
      "not.exist"
    );
  });
});
