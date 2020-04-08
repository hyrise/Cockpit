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
    cy.wait("@" + getGetAlias("system"));
    cy.get("@" + getGetAlias("system")).should((xhr: any) => {
      data = {};
      xhr.response.body.forEach((entry: any) => {
        data[entry.id] = entry.system_data[0].system_data.memory.percent;
      });
    });
    waitForChartRender();
  });

  // test data
  it("will show the correct metric data", () => {
    cy.get(getSelector("ram")).should((elements: any) => {
      assertLineChartData(
        elements[0].data,
        data,
        databases.map(db => db.id)
      );
    });
  });

  // test layout
  it("will show the correct range and title", () => {
    cy.get(getSelector("ram")).should((elements: any) => {
      const layout = elements[0].layout;
      expect(layout.xaxis.title.text).to.eq("Timestamps");
      expect(layout.yaxis.title.text).to.eq("Memory usage in %");
      expect(layout.yaxis.range[0]).to.eq(0);
      expect(layout.yaxis.range[1]).to.eq(105);
    });
  });

  // test details
  it("will not show metric details", () => {
    databases.forEach((database: any) => {
      cy.get(getDetailsSelectorWithID("ram", database.id)).should("not.exist");
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
    cy.wait("@" + getGetAlias("system"));
    cy.get("@" + getGetAlias("system")).should((xhr: any) => {
      data = {};
      xhr.response.body.forEach((entry: any) => {
        data[entry.id] = entry.system_data[0].system_data.memory.percent;
      });
    });
    waitForChartRender();
  });

  // test data
  it("will show the correct metric data", () => {
    databases.forEach((database: any) => {
      cy.get(getSelectorWithID("ram", database.id)).should((elements: any) => {
        assertLineChartData(elements[0].data, data, [database.id]);
      });
    });
  });

  // test layout
  it("will show the correct range and title", () => {
    databases.forEach((database: any) => {
      cy.get(getSelectorWithID("ram", database.id)).should((elements: any) => {
        const layout = elements[0].layout;
        expect(layout.xaxis.title.text).to.eq("Timestamps");
        expect(layout.yaxis.title.text).to.eq("Memory usage in %");
        expect(layout.yaxis.range[0]).to.eq(0);
        expect(layout.yaxis.range[1]).to.eq(105);
      });
    });
  });

  // test details
  it("will show the correct metric detail data", () => {
    databases.forEach((database: any) => {
      cy.get(getDetailsSelectorWithID("ram", database.id))
        .invoke("text")
        .then((text: any) => {
          assertMetricDetails(text, data[database.id]);
        });
    });
  });
});
