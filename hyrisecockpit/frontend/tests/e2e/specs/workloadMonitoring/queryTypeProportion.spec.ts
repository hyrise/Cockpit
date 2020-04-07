import { useBackendMock } from "../../setup/backendMock";
import { getGetAlias } from "../../setup/helpers";
import { getSelector as getViewSelector, getRoute } from "../views/helpers";
import { testRedirection } from "../abstractTests";
import { getSelector } from "./helpers";
import {
  assertBarChartData,
  getDetailsSelectorWithID
} from "../metrics/helpers";

const backend = useBackendMock();

let database: any = {};
let data: any = {};

describe("Show query type proportion", () => {
  beforeEach(() => {
    backend.start();
    cy.visit("/");
    cy.wait("@" + getGetAlias("database"));
    cy.get("@" + getGetAlias("database")).should((xhr: any) => {
      database = xhr.response.body[0];
    });
    testRedirection(
      getViewSelector("workloadMonitoringButton"),
      getRoute("workloadMonitoring")
    );
    cy.wait("@" + getGetAlias("krueger_data"));
    cy.get("@" + getGetAlias("krueger_data")).should((xhr: any) => {
      data = {};
      xhr.response.body.forEach((database: any) => {
        const entry: any = {};
        entry[database.id] = database.generated;
        data = { ...data, ...entry };
      });
    });
  });

  describe("observing the chart data", () => {
    it("will show the correct metric data", () => {
      cy.wait(1000); // wait for data
      cy.get(getSelector("generatedQueryTypeProportion")).should(
        (elements: any) => {
          assertBarChartData(elements[0].data, data[database.id], "generated");
        }
      );
    });
  });
  describe("observing the chart layout", () => {
    it("will show the correct range and title", () => {
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
  });
  describe("observing the metric details", () => {
    it("will not show metric details", () => {
      cy.get(
        getDetailsSelectorWithID("executedQueryTypeProportion", database.id)
      ).should("not.exist");
    });
  });
});
