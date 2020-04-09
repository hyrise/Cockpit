import { useBackendMock } from "../../setup/backendMock";
import { getGetAlias } from "../../setup/helpers";
import { getSelector as getViewSelector, getRoute } from "../views/helpers";
import { testRedirection } from "../abstractTests";
import {
  getSelector,
  getSelectorWithID,
  getDetailsSelectorWithID,
  assertMetricDetails,
  assertLineChartData
} from "./helpers";
import { assignToObject } from "../helpers";

const backend = useBackendMock();

let databases: any[] = [];
let data: any = {};

describe("Show queue length", () => {
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
      cy.wait("@" + getGetAlias("queue_length"));
      cy.get("@" + getGetAlias("queue_length")).should((xhr: any) => {
        data = assignToObject(xhr.response.body, "queue_length");
      });
    });
    describe("observing the chart data", () => {
      it("will show the correct metric data", () => {
        cy.get(getSelector("queueLength")).should((elements: any) => {
          assertLineChartData(
            elements[0].data,
            data,
            databases.map(db => db.id)
          );
        });
      });
    });
    describe("observing the metric details", () => {
      it("will not show metric details", () => {
        databases.forEach((database: any) => {
          cy.get(getDetailsSelectorWithID("queueLength", database.id)).should(
            "not.exist"
          );
        });
      });
    });
    describe("observing the chart layout", () => {
      it("will show the correct range and title", () => {
        cy.get(getSelector("queueLength")).should((elements: any) => {
          const layout = elements[0].layout;
          expect(layout.xaxis.title.text).to.eq("Timestamps");
          expect(layout.yaxis.title.text).to.eq("Number of queries");
          expect(layout.yaxis.range[0]).to.eq(0);
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
      cy.wait("@" + getGetAlias("queue_length"));
      cy.get("@" + getGetAlias("queue_length")).should((xhr: any) => {
        data = assignToObject(xhr.response.body, "queue_length");
      });
    });
    describe("observing the chart data", () => {
      it("will show the correct metric data", () => {
        databases.forEach((database: any) => {
          cy.get(getSelectorWithID("queueLength", database.id)).should(
            (elements: any) => {
              assertLineChartData(elements[0].data, data, [database.id]);
            }
          );
        });
      });
    });
    describe("observing the chart layout", () => {
      it("will show the correct range and title", () => {
        let maxValue: number | undefined = undefined;
        databases.forEach((database: any) => {
          cy.get(getSelectorWithID("queueLength", database.id)).should(
            (elements: any) => {
              const layout = elements[0].layout;
              expect(layout.xaxis.title.text).to.eq("Timestamps");
              expect(layout.yaxis.title.text).to.eq("Number of queries");
              expect(layout.yaxis.range[0]).to.eq(0);

              if (maxValue) expect(maxValue).to.eq(layout.yaxis.range[1]);
              maxValue = layout.yaxis.range[1];
            }
          );
        });
      });
    });
    describe("observing the metric details", () => {
      it("will show the correct metric detail data", () => {
        cy.wait(500);
        databases.forEach((database: any) => {
          cy.get(getDetailsSelectorWithID("queueLength", database.id))
            .invoke("text")
            .then((text: any) => {
              assertMetricDetails(text, data[database.id]);
            });
        });
      });
    });
  });
});
