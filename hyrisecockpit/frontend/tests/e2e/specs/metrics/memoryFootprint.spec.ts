import { useBackendMock } from "../../setup/backendMock";
import { getRoute } from "../views/helpers";
import {
  getSelector,
  getSelectorWithID,
  getDetailsSelectorWithID,
  assertMetricDetails,
  assertLineChartData,
} from "./helpers";
import { waitForChartRender } from "../helpers";
import { getDatabaseMemoryFootprint } from "../databases/helpers";

const backend = useBackendMock();

let databases: any[] = [];
let data: any = {};

// test on overview
describe("visiting the overview page", () => {
  before(() => {
    cy.setupAppState(backend).then((xhr: any) => {
      databases = xhr.response.body;
    });
    cy.visit(getRoute("overview"));
    cy.setupData("storage").then((xhr: any) => {
      data = Object.values(xhr.response.body.body.storage).map((entry) =>
        getDatabaseMemoryFootprint(entry)
      );
    });
    waitForChartRender();
  });

  // test data
  it("will show the correct metric data", () => {
    cy.get(getSelector("memoryFootprint")).should((elements: any) => {
      console.log(elements[0].data, data);
      assertLineChartData(
        elements[0].data,
        data,
        databases.map((db) => db.id),
        true
      );
    });
  });

  // test layout
  it("will show the correct range and title", () => {
    cy.get(getSelector("memoryFootprint")).should((elements: any) => {
      const layout = elements[0].layout;
      expect(layout.yaxis.title.text).to.eq("Memory Footprint in MB");
      expect(layout.yaxis.range[0]).to.eq(0);
    });
  });

  // test details
  it("will not show metric details", () => {
    databases.forEach((database: any) => {
      cy.get(getDetailsSelectorWithID("memoryFootprint", database.id)).should(
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
    cy.visit(getRoute("comparison"));
    cy.setupData("storage").then((xhr: any) => {
      data = Object.values(xhr.response.body.body.storage).map((entry) =>
        getDatabaseMemoryFootprint(entry)
      );
    });
    waitForChartRender();
  });

  // test data
  it("will show the correct metric data", () => {
    databases.forEach((database: any, idx: any) => {
      cy.get(getSelectorWithID("memoryFootprint", database.id)).should(
        (elements: any) => {
          console.log(elements[0].data, data);
          assertLineChartData(
            elements[0].data,
            [data[idx]],
            [database.id],
            true
          );
        }
      );
    });
  });

  // test layout
  it("will show the correct range and title", () => {
    databases.forEach((database: any) => {
      cy.get(getSelectorWithID("memoryFootprint", database.id)).should(
        (elements: any) => {
          const layout = elements[0].layout;
          expect(layout.yaxis.title.text).to.eq("Memory Footprint in MB");
          expect(layout.yaxis.range[0]).to.eq(0);
        }
      );
    });
  });

  // test details
  it("will show the correct metric detail data", () => {
    databases.forEach((database: any, idx) => {
      cy.get(getDetailsSelectorWithID("memoryFootprint", database.id))
        .invoke("text")
        .then((text: any) => {
          assertMetricDetails(text, data[idx]);
        });
    });
  });
});
