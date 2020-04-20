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
    cy.setupData("krueger_data").then((xhr: any) => {
      data = {};
      xhr.response.body.forEach((database: any) => {
        const entry: any = {};
        entry[database.id] = database.generated;
        data = { ...data, ...entry };
      });
    });
    waitForChartRender();
  });

  // test data
  it("will show the correct metric data", () => {
    cy.get(getSelector("generatedQueryTypeProportion")).should(
      (elements: any) => {
        assertBarChartData(elements[0].data, data[database.id], "generated");
      }
    );
  });

  // test layout
  it("will show the correct range and title", () => {
    cy.wait(1000);
    cy.get(getSelector("generatedQueryTypeProportion")).should(
      (elements: any) => {
        const layout = elements[0].layout;
        expect(layout.xaxis.title.text).to.eq("Workload");
        expect(layout.yaxis.title.text).to.eq("Proportion of queries in %");
        expect(layout.yaxis.range[0]).to.eq(0);
        expect(layout.yaxis.range[1]).to.be.at.least(
          Object.values(data[database.id]).reduce(
            (sum: number, entry: any) => sum + entry,
            0
          )
        );
      }
    );
  });

  // test details
  it("will not show metric details", () => {
    cy.get(
      getDetailsSelectorWithID("executedQueryTypeProportion", database.id)
    ).should("not.exist");
  });
});
