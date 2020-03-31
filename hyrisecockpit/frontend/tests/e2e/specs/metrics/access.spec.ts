import { useBackendMock } from "../../setup/backendMock";
import { getGetAlias, generateRandomInt } from "../../setup/helpers";
import { getSelector as getViewSelector, getRoute } from "../views/helpers";
import { testRedirection } from "../abstractTests";
import {
  getSelector,
  getSelectorWithID,
  getDetailsSelectorWithID,
  assertHeatMapData
} from "./helpers";
import { clickContentOfSelect } from "../helpers";

const backend = useBackendMock({ databases: 2 });

let databases: any[] = [];
let data: any = {};

describe("Show access", () => {
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
        cy.get(getSelector("secondAccess")).should("not.exist");
      });
    });
    describe("observing the metric details", () => {
      it("will not show metric details", () => {
        databases.forEach((database: any) => {
          cy.get(getDetailsSelectorWithID("secondAccess", database.id)).should(
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
      cy.wait(1000);
      cy.wait("@" + getGetAlias("chunks"));
      cy.get("@" + getGetAlias("chunks")).should((xhr: any) => {
        data = xhr.response.body.body.chunks_data;
      });
    });
    describe("observing the chart data with no selected table", () => {
      it("will show the correct empty metric data", () => {
        databases.forEach((database: any) => {
          cy.get(getSelectorWithID("secondAccess", database.id)).should(
            (elements: any) => {
              assertHeatMapData(elements[0].data[0], database.id);
            }
          );
        });
      });
    });
    describe("observing the chart data with changing selected table", () => {
      it("will show the correct metric data", () => {
        const items = Object.keys(data[databases[0].id]);
        const index = generateRandomInt(0, items.length);

        databases.forEach((database: any, idx: number) => {
          cy.get(getSelector("secondAccessSelect"))
            .eq(idx)
            .click({ force: true });
          cy.wait(500);

          clickContentOfSelect(idx, items[index].toString());

          cy.get(getSelectorWithID("secondAccess", database.id)).should(
            (elements: any) => {
              assertHeatMapData(
                elements[0].data[0],
                database.id,
                data[database.id][items[index]]
              );
            }
          );
        });
      });
    });
    describe("observing the metric details", () => {
      it("will not show metric details", () => {
        databases.forEach((database: any) => {
          cy.get(getDetailsSelectorWithID("secondAccess", database.id)).should(
            "not.exist"
          );
        });
      });
    });
    describe("clicking the detailed view button", () => {
      it("will open a detailed heatmap view", () => {
        databases.forEach((database: any) => {
          cy.get(getSelectorWithID("firstAccess", database.id)).should(
            "not.exist"
          );
        });
        databases.forEach((database: any, idx: number) => {
          cy.get(getSelector("openDetailed"))
            .eq(idx * 2 + 1)
            .click();
          cy.wait(500);
          cy.get(getSelectorWithID("firstAccess", database.id)).should("exist");
          cy.wait(500);

          const items = Object.keys(data[databases[0].id]);
          const index = generateRandomInt(0, items.length);

          cy.get(getSelectorWithID("firstAccess", database.id)).should(
            (elements: any) => {
              assertHeatMapData(elements[0].data[0], database.id);
            }
          );

          cy.get(getSelector("firstAccessSelect"))
            .eq(idx)
            .click({ force: true });
          cy.wait(500);
          clickContentOfSelect(idx, items[index].toString());

          cy.get(getSelectorWithID("firstAccess", database.id)).should(
            (elements: any) => {
              assertHeatMapData(
                elements[0].data[0],
                database.id,
                data[database.id][items[index]]
              );
            }
          );

          cy.get(getSelector("closeDetailed"))
            .eq(idx)
            .click();
          cy.get(getSelectorWithID("firstAccess", database.id)).should(
            "not.be.visible"
          );
        });
      });
    });
  });
});
