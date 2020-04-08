import { useBackendMock } from "../../setup/backendMock";
import { getSelector as getViewSelector, getRoute } from "../views/helpers";
import { testRedirection } from "../abstractTests";
import {
  getSelector,
  getSelectorWithID,
  getDetailsSelectorWithID,
  assertTreeMapData
} from "./helpers";
import { waitForChartRender } from "../helpers";

const backend = useBackendMock();

let databases: any[] = [];
let data: any = {};

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
    cy.get(getSelector("secondStorage")).should("not.exist");
  });

  // test details
  it("will not show metric details", () => {
    databases.forEach((database: any) => {
      cy.get(getDetailsSelectorWithID("secondStorage", database.id)).should(
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
    cy.setupData("storage").then((xhr: any) => {
      data = xhr.response.body.body.storage;
    });
    waitForChartRender();
  });

  // test data
  it("will show the correct metric data", () => {
    databases.forEach((database: any) => {
      cy.get(getSelectorWithID("secondStorage", database.id)).should(
        (elements: any) => {
          assertTreeMapData(
            elements[0].data[0],
            data[database.id],
            database.id
          );
        }
      );
    });
  });

  // test details
  it("will not show metric details", () => {
    databases.forEach((database: any) => {
      cy.get(getDetailsSelectorWithID("secondStorage", database.id)).should(
        "not.exist"
      );
    });
  });

  // test detailed view
  describe("when clicking the detailed view button", () => {
    it("will open a detailed treemap view", () => {
      databases.forEach((database: any) => {
        cy.get(getSelectorWithID("firstStorage", database.id)).should(
          "not.exist"
        );
      });
      databases.forEach((database: any, idx: number) => {
        cy.get(getSelector("openDetailed"))
          .eq(idx * 2)
          .click();
        cy.get(getSelectorWithID("firstStorage", database.id)).should("exist");
        cy.get(getSelectorWithID("firstStorage", database.id)).should(
          (elements: any) => {
            assertTreeMapData(
              elements[0].data[0],
              data[database.id],
              database.id
            );
          }
        );
        cy.get(getSelector("closeDetailed"))
          .eq(idx)
          .click();
        cy.get(getSelectorWithID("firstStorage", database.id)).should(
          "not.be.visible"
        );
      });
    });
  });
});
