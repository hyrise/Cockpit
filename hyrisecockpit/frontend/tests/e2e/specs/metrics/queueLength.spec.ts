import { useBackendMock } from "../../setup/backendMock";
import { getRoute } from "../views/helpers";
import {
  getSelector,
  getSelectorWithID,
  getDetailsSelectorWithID,
  assertMetricDetails,
  assertLineChartData
} from "./helpers";
import { assignToObject, waitForChartRender } from "../helpers";

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
    cy.setupData("queue_length").then((xhr: any) => {
      data = assignToObject(xhr.response.body, "queue_length");
    });
    waitForChartRender();
  });

  // test data
  it("will show the correct metric data", () => {
    cy.get(getSelector("queueLength")).should((elements: any) => {
      assertLineChartData(
        elements[0].data,
        data,
        databases.map(db => db.id)
      );
    });
  });

  // test layout
  it("will show the correct range and title", () => {
    cy.get(getSelector("queueLength")).should((elements: any) => {
      const layout = elements[0].layout;
      expect(layout.yaxis.title.text).to.eq("Number of queries");
      expect(layout.yaxis.range[0]).to.eq(0);
    });
  });

  // test details
  it("will not show metric details", () => {
    databases.forEach((database: any) => {
      cy.get(getDetailsSelectorWithID("queueLength", database.id)).should(
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
    cy.setupData("queue_length").then((xhr: any) => {
      data = assignToObject(xhr.response.body, "queue_length");
    });
    waitForChartRender();
  });

  // test data
  it("will show the correct metric data", () => {
    databases.forEach((database: any) => {
      cy.get(getSelectorWithID("queueLength", database.id)).should(
        (elements: any) => {
          assertLineChartData(elements[0].data, data, [database.id]);
        }
      );
    });
  });

  // test layout
  it("will show the correct range and title", () => {
    let maxValue: number | undefined = undefined;
    databases.forEach((database: any) => {
      cy.get(getSelectorWithID("queueLength", database.id)).should(
        (elements: any) => {
          const layout = elements[0].layout;
          expect(layout.yaxis.title.text).to.eq("Number of queries");
          expect(layout.yaxis.range[0]).to.eq(0);

          if (maxValue) expect(maxValue).to.eq(layout.yaxis.range[1]);
          maxValue = layout.yaxis.range[1];
        }
      );
    });
  });

  // test details
  it("will show the correct metric detail data", () => {
    databases.forEach((database: any) => {
      cy.get(getDetailsSelectorWithID("queueLength", database.id))
        .invoke("text")
        .then((text: any) => {
          assertMetricDetails(text, data[database.id]);
        });
    });
  });
});
