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
import { clickContentOfSelect, waitForChartRender } from "../helpers";

const backend = useBackendMock();

let databases: any[] = [];
let data: any = {};
let items: any = [];
let index: any = 0;

// test on overview
describe("visiting the overview page", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
    testRedirection(getViewSelector("overviewButton"), getRoute("overview"));
    waitForChartRender();
  });

  // test chart
  it("will not show a chart", () => {
    cy.get(getSelector("secondAccess")).should("not.exist");
  });

  // test details
  it("will not show metric details", () => {
    databases.forEach((database: any) => {
      cy.get(getDetailsSelectorWithID("secondAccess", database.id)).should(
        "not.exist"
      );
    });
  });
});

// test on comparison
describe("visiting the comparison page", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
    testRedirection(
      getViewSelector("comparisonButton"),
      getRoute("comparison")
    );
    cy.wait("@" + getGetAlias("chunks"));
    cy.get("@" + getGetAlias("chunks")).should((xhr: any) => {
      data = xhr.response.body.body.chunks_data;
    });
    waitForChartRender();
  });

  // test layout
  it("will show the correct titles", () => {
    databases.forEach((database: any) => {
      cy.get(getSelectorWithID("secondAccess", database.id)).should(
        (elements: any) => {
          const layout = elements[0].layout;
          expect(layout.xaxis.title.text).to.eq("Columns");
          expect(layout.yaxis.title.text).to.eq("Chunks");
        }
      );
    });
  });

  // test details
  it("will not show metric details", () => {
    databases.forEach((database: any) => {
      cy.get(getDetailsSelectorWithID("secondAccess", database.id)).should(
        "not.exist"
      );
    });
  });

  // test data with no selected table
  describe("when no table is selected", () => {
    it("will show the correct empty metric data", () => {
      databases.forEach((database: any) => {
        cy.get(getSelectorWithID("secondAccess", database.id)).should(
          (elements: any) => {
            assertHeatMapData(elements[0].data[0]);
          }
        );
      });
    });
  });

  // test data with selected table
  describe("when a table is selected", () => {
    it("will show the correct metric data", () => {
      items = Object.keys(data[databases[0].id]);
      index = generateRandomInt(0, items.length);

      databases.forEach((database: any, idx: number) => {
        cy.get(getSelector("secondAccessSelect"))
          .eq(idx)
          .click({ force: true });

        clickContentOfSelect(idx, items[index].toString());

        cy.get(getSelectorWithID("secondAccess", database.id)).should(
          (elements: any) => {
            assertHeatMapData(
              elements[0].data[0],
              data[database.id][items[index]]
            );
          }
        );
      });
    });
  });

  // test detailed view
  describe("when clicking the detailded view button", () => {
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
        cy.get(getSelectorWithID("firstAccess", database.id)).should("exist");

        cy.get(getSelectorWithID("firstAccess", database.id)).should(
          (elements: any) => {
            assertHeatMapData(
              elements[0].data[0],
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
