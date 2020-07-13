import { routes } from "../views/helpers";
import { useBackendMock } from "../../setup/backendMock";
import { waitForChartRender } from "../helpers";
import { Request } from "../../setup/helpers";
import {
  assertLineChartData,
  getSelector,
  getDetailsSelectorWithID,
  getSelectorWithID,
  assertMetricDetails,
} from "./helpers";

/** Test data, layout and details panel for a specific linechart metric by config on overview page */
export function testLinechartOnOverview(
  metric: string,
  request: Request,
  layoutData: {
    title: string;
    min?: number;
    max?: number;
  },
  transformData: (xhr: any) => any
): void {
  const backend = useBackendMock();
  let databases: any[] = [];
  let data: any = {};

  describe("visiting the overview page", () => {
    before(() => {
      cy.setupAppState(backend).then((xhr: any) => {
        databases = xhr.response.body;
      });
      cy.visit(routes.overview);
      cy.setupData(request).then((xhr: any) => {
        data = transformData(xhr);
      });
      waitForChartRender();
    });

    // test data
    it("will show the correct metric data", () => {
      cy.get(getSelector(metric)).should((elements: any) => {
        assertLineChartData(
          elements[0].data,
          data,
          databases.map((db) => db.id)
        );
      });
    });

    // test layout
    it("will show the correct range and title", () => {
      cy.get(getSelector(metric)).should((elements: any) => {
        const layout = elements[0].layout;
        expect(layout.yaxis.title.text).to.eq(layoutData.title);
        if (layoutData.min) expect(layout.yaxis.range[0]).to.eq(layoutData.min);
        if (layoutData.max) expect(layout.yaxis.range[1]).to.eq(layoutData.max);
      });
    });

    // test details
    it("will not show metric details", () => {
      databases.forEach((database: any) => {
        cy.get(getDetailsSelectorWithID(metric, database.id)).should(
          "not.exist"
        );
      });
    });
  });
}

/** Test data, layout and details panel for a specific linechart metric by config on comparison page */
export function testLinechartOnComparison(
  metric: string,
  request: Request,
  layoutData: {
    title: string;
    min?: number;
    max?: number;
  },
  transformData: (xhr: any) => any
): void {
  const backend = useBackendMock();
  let databases: any[] = [];
  let data: any = {};

  describe("visiting the comparison page", () => {
    before(() => {
      cy.setupAppState(backend).then((xhr: any) => {
        databases = xhr.response.body;
      });
      cy.visit(routes.comparison);
      cy.setupData(request).then((xhr: any) => {
        data = transformData(xhr);
      });
      waitForChartRender();
    });

    // test data
    it("will show the correct metric data", () => {
      databases.forEach((database: any) => {
        cy.get(getSelectorWithID(metric, database.id)).should(
          (elements: any) => {
            assertLineChartData(elements[0].data, data, [database.id]);
          }
        );
      });
    });

    // test layout
    it("will show the correct range and title", () => {
      databases.forEach((database: any) => {
        cy.get(getSelectorWithID(metric, database.id)).should(
          (elements: any) => {
            const layout = elements[0].layout;
            expect(layout.yaxis.title.text).to.eq(layoutData.title);
            if (layoutData.min)
              expect(layout.yaxis.range[0]).to.eq(layoutData.min);
            if (layoutData.max)
              expect(layout.yaxis.range[1]).to.eq(layoutData.max);
          }
        );
      });
    });

    // test details
    it("will not show metric details", () => {
      databases.forEach((database: any) => {
        cy.get(getDetailsSelectorWithID(metric, database.id))
          .invoke("text")
          .then((text: any) => {
            assertMetricDetails(text, data[database.id]);
          });
      });
    });
  });
}

/* Test no existence and visibility of chart and metric details on overview page */
export function testNoVisibilityOnOverview(metric: string): void {
  let databases: any[] = [];
  const backend = useBackendMock();

  describe("visiting the overview page", () => {
    before(() => {
      cy.setupAppState(backend).then((xhr: any) => {
        databases = xhr.response.body;
      });
      cy.visit(routes.overview);
      waitForChartRender();
    });

    // test chart
    it("will not show a chart", () => {
      cy.get(getSelector(metric)).should("not.exist");
    });

    // test details
    it("will not show metric details", () => {
      databases.forEach((database: any) => {
        cy.get(getDetailsSelectorWithID(metric, database.id)).should(
          "not.exist"
        );
      });
    });
  });
}

/* Test generic charts on workload or comparison page with custom hooks */
export function testGenericChartsOnPage(
  {
    metric,
    request,
    page = "comparison",
  }: {
    metric: string;
    request: Request;
    page?: "comparison" | "workloadMonitoring";
  },
  layoutData: {
    xtitle?: string;
    ytitle?: string;
    ymin?: number;
    ymax?: number;
  },
  transformData: (xhr: any) => any,
  customTests: (getData: () => { data: any; databases: any[] }) => void
): void {
  let databases: any[] = [];
  let data: any = {};
  const backend = useBackendMock();

  describe(`visiting the ${page} page`, () => {
    before(() => {
      cy.setupAppState(backend).then((xhr: any) => {
        databases = xhr.response.body;
      });
      cy.visit(routes[page]);
      cy.setupData(request).then((xhr: any) => {
        data = transformData(xhr);
      });
      waitForChartRender();
    });

    // test layout
    it("will show the correct titles", () => {
      databases.forEach((database: any) => {
        cy.get(getSelectorWithID(metric, database.id)).should(
          (elements: any) => {
            const layout = elements[0].layout;
            if (layoutData.xtitle)
              expect(layout.xaxis.title.text).to.eq(layoutData.xtitle);
            if (layoutData.ytitle)
              expect(layout.yaxis.title.text).to.eq(layoutData.ytitle);
            if (layoutData.ymin)
              expect(layout.yaxis.range[0]).to.eq(layoutData.ymin);
            if (layoutData.ymax)
              expect(layout.yaxis.range[1]).to.eq(layoutData.ymax);
          }
        );
      });
    });

    // test details
    it("will not show metric details", () => {
      databases.forEach((database: any) => {
        cy.get(getDetailsSelectorWithID(metric, database.id)).should(
          "not.exist"
        );
      });
    });

    customTests(() => ({
      data,
      databases,
    }));
  });
}
