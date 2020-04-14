import { useBackendMock } from "../../setup/backendMock";
import { getGetAlias } from "../../setup/helpers";
import { getSelector as getViewSelector, getRoute } from "../views/helpers";
import { testRedirection } from "../abstractTests";
import {
  getSelector,
  getSelectorWithID,
  getDetailsSelectorWithID,
  assertBarChartData
} from "./helpers";

const backend = useBackendMock();

let databases: any[] = [];
let data: any = {};

describe("Show query type proportion", () => {
  beforeEach(() => {
    backend.start();
    cy.visit("/");
    cy.wait("@" + getGetAlias("database"));
    cy.get("@" + getGetAlias("database")).should((xhr: any) => {
      databases = xhr.response.body;
    });
  });

  describe("visiting the overview page", () => {
    beforeEach(() => {
      testRedirection(getViewSelector("overviewButton"), getRoute("overview"));
    });
    describe("observing the chart", () => {
      it("will not show a chart", () => {
        cy.get(getSelector("executedQueryTypeProportion")).should("not.exist");
      });
    });
    describe("observing the metric details", () => {
      it("will not show metric details", () => {
        databases.forEach((database: any) => {
          cy.get(
            getDetailsSelectorWithID("executedQueryTypeProportion", database.id)
          ).should("not.exist");
        });
      });
    });
  });

  describe("visiting the comparison page", () => {
    beforeEach(() => {
      testRedirection(
        getViewSelector("comparisonButton"),
        getRoute("comparison")
      );
      cy.wait("@" + getGetAlias("krueger_data"));
      cy.get("@" + getGetAlias("krueger_data")).should((xhr: any) => {
        data = {};
        xhr.response.body.forEach((database: any) => {
          const entry: any = {};
          entry[database.id] = database.executed;
          data = { ...data, ...entry };
        });
      });
    });
    describe("observing the chart data", () => {
      it("will show the correct metric data", () => {
        databases.forEach((database: any) => {
          cy.get(
            getSelectorWithID("executedQueryTypeProportion", database.id)
          ).should((elements: any) => {
            assertBarChartData(elements[0].data, data[database.id], "executed");
          });
        });
      });
    });
    describe("observing the chart layout", () => {
      it("will show the correct range and title", () => {
        databases.forEach((database: any) => {
          cy.get(
            getSelectorWithID("executedQueryTypeProportion", database.id)
          ).should((elements: any) => {
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
          });
        });
      });
    });
    describe("observing the metric details", () => {
      it("will not show metric details", () => {
        databases.forEach((database: any) => {
          cy.get(
            getDetailsSelectorWithID("executedQueryTypeProportion", database.id)
          ).should("not.exist");
        });
      });
    });
  });
});
