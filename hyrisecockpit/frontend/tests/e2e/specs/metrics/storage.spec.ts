import {
  assertTreeMapData,
  assertMetricDetails,
  getSelector,
  getSelectorWithID,
  getDetailsSelectorWithID,
} from "./helpers";
import { getDatabaseMemoryFootprint } from "../databases/helpers";
import {
  testNoVisibilityOnOverview,
  testGenericChartsOnPage,
} from "./abstractTests";

const metric = "secondStorage";
const request = "storage";
const layout = {};
const transform = (xhr: any): any => {
  return xhr.response.body.body.storage;
};

/* test no existence on overview */
testNoVisibilityOnOverview(metric);

/* test generic and custom on comparison */
testGenericChartsOnPage({ metric, request }, layout, transform, (getData) => {
  // test data
  it("will show the correct metric data", () => {
    const { data, databases } = getData();

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
  it("will show the correct metric details", () => {
    const { data, databases } = getData();

    databases.forEach((database: any) => {
      cy.get(
        getDetailsSelectorWithID("memoryFootprint", database.id, "storage")
      )
        .invoke("text")
        .then((text: any) => {
          assertMetricDetails(
            text,
            getDatabaseMemoryFootprint(data[database.id]),
            3
          );
        });
    });
  });

  // test detailed view
  describe("when clicking the detailed view button", () => {
    it("will open a detailed treemap view", () => {
      const { data, databases } = getData();

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
        cy.get(getSelector("closeDetailed")).eq(idx).click({ force: true });
        cy.get(getSelectorWithID("firstStorage", database.id)).should(
          "not.be.visible"
        );
      });
    });
  });
});
