import { useBackendMock } from "../../setup/backendMock";
import { getGetAlias } from "../../setup/helpers";
import { getSelector as getViewSelector, getRoute } from "../views/helpers";
import { testRedirection } from "../abstractTests";
import {
  getSelector,
  getSelectorWithID,
  getDetailsSelectorWithID,
  assertMetricDetails,
  assertChartData
} from "./helpers";
import { roundNumber } from "../helpers";

const backend = useBackendMock({ databases: 2 });

let databases: any[] = [];
let data: any = {};

describe("Show latency", () => {
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
      cy.wait("@" + getGetAlias("latency"));
      cy.get("@" + getGetAlias("latency")).should((xhr: any) => {
        data = {};
        Object.entries(Object.values(xhr.response.body.body)[0] as any).forEach(
          ([database, value]: [any, any]) => {
            const entry: any = {};
            entry[database] = roundNumber(value, Math.pow(10, 6));
            data = { ...data, ...entry };
          }
        );
      });
    });
    describe("observing the chart data", () => {
      it("will show the correct metric data", () => {
        cy.wait(1000); // wait for data
        cy.get(getSelector("latency")).should((elements: any) => {
          assertChartData(
            elements[0].data,
            data,
            databases.map(db => db.id)
          );
        });
      });
    });
    describe("observing the metric details", () => {
      it("will not show metric details", () => {
        cy.wait(1000); // wait for data
        databases.forEach((database: any) => {
          cy.get(getDetailsSelectorWithID("latency", database.id)).should(
            "not.exist"
          );
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
      cy.wait("@" + getGetAlias("latency"));
      cy.get("@" + getGetAlias("latency")).should((xhr: any) => {
        data = {};
        Object.entries(Object.values(xhr.response.body.body)[0] as any).forEach(
          ([database, value]: [any, any]) => {
            const entry: any = {};
            entry[database] = roundNumber(value, Math.pow(10, 6));
            data = { ...data, ...entry };
          }
        );
      });
    });
    describe("observing the chart data", () => {
      it("will show the correct metric data", () => {
        cy.wait(1000); // wait for data
        databases.forEach((database: any) => {
          cy.get(getSelectorWithID("latency", database.id)).should(
            (elements: any) => {
              assertChartData(elements[0].data, data, [database.id]);
            }
          );
        });
      });
    });
    describe("observing the metric details", () => {
      it("will show the correct metric detail data", () => {
        cy.wait(1000); // wait for data
        databases.forEach((database: any) => {
          cy.get(getDetailsSelectorWithID("latency", database.id))
            .invoke("text")
            .then((text: any) => {
              assertMetricDetails(text, data[database.id]);
            });
        });
      });
    });
  });
});
