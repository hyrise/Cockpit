import { useBackendMock } from "../../setup/backendMock";
import { getGetAlias } from "../../setup/helpers";
import { getSelector as getViewSelector, getRoute } from "../views/helpers";
import { testRedirection } from "../abstractTests";
import {
  getSelector,
  getSelectorWithID,
  getDetailsSelectorWithID,
  assertTreeMapData
} from "./helpers";

const backend = useBackendMock({ databases: 2 });

let databases: any[] = [];
let data: any = {};

describe("Show storage", () => {
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
        cy.get(getSelector("secondStorage")).should("not.exist");
      });
    });
    describe("observing the metric details", () => {
      it("will not show metric details", () => {
        databases.forEach((database: any) => {
          cy.get(getDetailsSelectorWithID("secondStorage", database.id)).should(
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
      cy.wait("@" + getGetAlias("storage"));
      cy.get("@" + getGetAlias("storage")).should((xhr: any) => {
        data = xhr.response.body.body.storage;
      });
    });
    describe("observing the chart data", () => {
      it("will show the correct metric data", () => {
        cy.wait(5500); // wait for data
        databases.forEach((database: any) => {
          cy.get(getSelectorWithID("secondStorage", database.id)).should(
            (elements: any) => {
              console.log("graph data", elements[0].data[0]);
              assertTreeMapData(
                elements[0].data[0],
                data[database.id],
                database.id
              );
            }
          );
        });
      });
    });
    describe("observing the metric details", () => {
      it("will not show metric details", () => {
        databases.forEach((database: any) => {
          cy.get(getDetailsSelectorWithID("secondStorage", database.id)).should(
            "not.exist"
          );
        });
      });
    });
  });
});
