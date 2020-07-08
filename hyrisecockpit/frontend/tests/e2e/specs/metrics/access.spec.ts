import { generateRandomInt } from "../../setup/helpers";
import { assertHeatMapData, getSelector, getSelectorWithID } from "./helpers";
import { clickContentOfSelect } from "../helpers";
import {
  testNoVisibilityOnOverview,
  testGenericChartsOnPage,
} from "./abstractTests";

const metric = "secondAccess";
const request = "chunks";
const layout = { xtitle: "Columns", ytitle: "Chunks" };
const transform = (xhr: any): any => {
  return xhr.response.body.body.chunks_data;
};

/* test no existence on overview */
testNoVisibilityOnOverview(metric);

/* test generic and custom on comparison */
testGenericChartsOnPage({ metric, request }, layout, transform, (getData) => {
  // test data with no selected table
  describe("when no table is selected", () => {
    it("will show the correct empty metric data", () => {
      const { databases } = getData();
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
      const { data, databases } = getData();
      const items = Object.keys(data[databases[0].id]);
      const index = generateRandomInt(0, items.length);

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
      const { data, databases } = getData();
      const items = Object.keys(data[databases[0].id]);
      const index = generateRandomInt(0, items.length);

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

        cy.get(getSelector("closeDetailed")).eq(idx).click();
        cy.get(getSelectorWithID("firstAccess", database.id)).should(
          "not.be.visible"
        );
      });
    });
  });
});
