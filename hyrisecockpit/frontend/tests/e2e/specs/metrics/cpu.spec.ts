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

const backend = useBackendMock();

let databases: any[] = [];
let data: any = {};

describe("Show cpu", () => {
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
      cy.wait("@" + getGetAlias("system"));
      cy.get("@" + getGetAlias("system")).should((xhr: any) => {
        data = {};
        xhr.response.body.forEach((entry: any) => {
          data[entry.id] =
            entry.system_data[0].system_data.cpu.cpu_process_usage;
        });
      });
    });
    describe("observing the chart data", () => {
      it("will show the correct metric data", () => {
        cy.get(getSelector("cpu")).should((elements: any) => {
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
          cy.get(getDetailsSelectorWithID("cpu", database.id)).should(
            "not.exist"
          );
        });
      });
    });
    describe("observing the chart layout", () => {
      it("will show the correct range and title", () => {
        cy.get(getSelector("cpu")).should((elements: any) => {
          const layout = elements[0].layout;
          expect(layout.xaxis.title.text).to.eq("Timestamps");
          expect(layout.yaxis.title.text).to.eq("Workload in %");
          expect(layout.yaxis.range[0]).to.eq(0);
          expect(layout.yaxis.range[1]).to.eq(105);
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
      cy.wait("@" + getGetAlias("system"));
      cy.get("@" + getGetAlias("system")).should((xhr: any) => {
        data = {};
        xhr.response.body.forEach((entry: any) => {
          data[entry.id] =
            entry.system_data[0].system_data.cpu.cpu_process_usage;
        });
      });
    });
    describe("observing the chart data", () => {
      it("will show the correct metric data", () => {
        databases.forEach((database: any) => {
          cy.get(getSelectorWithID("cpu", database.id)).should(
            (elements: any) => {
              assertLineChartData(elements[0].data, data, [database.id]);
            }
          );
        });
      });
    });
    describe("observing the chart layout", () => {
      it("will show the correct range and title", () => {
        databases.forEach((database: any) => {
          cy.get(getSelectorWithID("cpu", database.id)).should(
            (elements: any) => {
              const layout = elements[0].layout;
              expect(layout.xaxis.title.text).to.eq("Timestamps");
              expect(layout.yaxis.title.text).to.eq("Workload in %");
              expect(layout.yaxis.range[0]).to.eq(0);
              expect(layout.yaxis.range[1]).to.eq(105);
            }
          );
        });
      });
    });
    describe("observing the metric details", () => {
      it("will show the correct metric detail data", () => {
        cy.wait(500);
        databases.forEach((database: any) => {
          cy.get(getDetailsSelectorWithID("cpu", database.id))
            .invoke("text")
            .then((text: any) => {
              assertMetricDetails(text, data[database.id]);
            });
        });
      });
    });
  });
});
