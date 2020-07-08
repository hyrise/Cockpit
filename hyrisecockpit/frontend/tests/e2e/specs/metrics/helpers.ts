import { getSelectorByConfig, cutNumber, roundNumber } from "../helpers";
import { testMaxDecimalDigits } from "../abstractTests";
import { routes } from "../views/helpers";
import { useBackendMock } from "../../setup/backendMock";
import { waitForChartRender } from "../helpers";
import { Request } from "../../setup/helpers";

/* SELECTORS */
const selectors: Record<string, { element: string; title: string }> = {
  throughput: { element: "div", title: "throughput" },
  latency: { element: "div", title: "latency" },
  queueLength: { element: "div", title: "queueLength" },
  cpu: { element: "div", title: "cpu" },
  ram: { element: "div", title: "ram" },
  queryTypeProportion: {
    element: "div",
    title: "queryTypeProportion",
  },
  operatorProportion: {
    element: "div",
    title: "operatorProportion",
  },
  memoryFootprint: { element: "div", title: "memoryFootprint" },
  firstStorage: { element: "div", title: "1storage" },
  secondStorage: { element: "div", title: "2storage" },
  firstAccess: { element: "div", title: "1access" },
  secondAccess: { element: "div", title: "2access" },
  firstAccessSelect: { element: "input", title: "1access-select" },
  secondAccessSelect: { element: "input", title: "2access-select" },
  openDetailed: { element: "button", title: "open-metric-detailed-view" },
  closeDetailed: { element: "button", title: "close-metric-detailed-view" },
};

export function getSelector(component: string): string {
  return getSelectorByConfig(
    selectors[component].element,
    selectors[component].title
  );
}

export function getSelectorWithID(component: string, id?: string): string {
  return getSelectorByConfig(
    selectors[component].element,
    id ? `${selectors[component].title}-${id}` : `${selectors[component].title}`
  );
}

export function getDetailsSelectorWithID(
  component: string,
  id: string,
  prefix: string = ""
): string {
  return getSelectorByConfig(
    selectors[component].element,
    `${prefix}${selectors[component].title}-${id}-details`
  );
}

/* ASSERTIONS */
export function assertLineChartData(
  chartDatasets: any[],
  requestData: any,
  databases: any[]
): void {
  databases.forEach((database: any, idx) => {
    const chartData: any = chartDatasets.find(
      (data: any) => data.name === database
    );
    expect(chartData).to.exist;
    expect(chartData.x).to.exist;
    expect(chartData.y).to.exist;

    chartData.y.forEach((item: any) => {
      expect(item).to.eq(requestData[database]);
    });
  });
}

export function assertBarChartData(
  chartDatasets: any[],
  requestData: any,
  xaxis?: string[],
  digits?: number
): void {
  Object.keys(requestData).forEach((label: string) => {
    const chartData: any = chartDatasets.find(
      (data: any) => data.name === label
    );
    expect(chartData).to.exist;
    expect(chartData.x).to.exist;
    expect(chartData.y).to.exist;

    if (xaxis) expect(chartData.x).to.eql(xaxis);
    if (digits) {
      (requestData[label] as any[]).forEach((entry, idx) => {
        expect(cutNumber(entry, digits)).to.eq(
          cutNumber(chartData.y[idx], digits)
        );
      });
    } else {
      expect(chartData.y).to.eql(requestData[label]);
    }
  });
}

export function assertHeatMapData(chartDatasets: any, requestData?: any): void {
  if (!requestData) {
    expect(chartDatasets.x).to.eql([]);
    expect(chartDatasets.y).to.eql([]);
    expect(chartDatasets.z).to.eql([]);
  } else {
    Object.entries(requestData).forEach(
      ([_, data]: [any, any], idx: number) => {
        data.forEach((chunks: any, secondIdx: number) => {
          expect(chartDatasets.z[secondIdx][idx]).to.eq(chunks);
        });
        expect(chartDatasets.y[idx]).to.eq("Nr. " + idx);
      }
    );
  }
}

export function assertTreeMapData(
  chartDatasets: any,
  requestData: any,
  database: string
): void {
  // assert root element
  expect(chartDatasets.labels[0]).to.eq(database);
  expect(chartDatasets.parents[0]).to.eq("");
  expect(chartDatasets.values[0]).to.eq(0);

  let i = 1;
  // assert table elements
  Object.entries(requestData).forEach(([table, columns]: [any, any]) => {
    expect(chartDatasets.labels[i]).to.eq(table);
    expect(chartDatasets.parents[i]).to.eq(database);
    expect(chartDatasets.values[i]).to.eq(0);
    testMaxDecimalDigits(chartDatasets.text[i].percentOfDatabase, 3);
    testMaxDecimalDigits(chartDatasets.text[i].percentOfTable, 3);
    i++;
    // assert column elements
    Object.entries(columns.data).forEach(([column, data]: [any, any]) => {
      expect(chartDatasets.labels[i]).to.eq(column);
      expect(chartDatasets.parents[i]).to.eq(table);
      expect(chartDatasets.values[i]).to.eq(getRoundedData(data.size));
      expect(chartDatasets.text[i].dataType).to.eq(
        "data type: " + data.data_type
      );
      expect(chartDatasets.text[i].encoding).to.include(data.encoding[0].name);
      expect(chartDatasets.text[i].encoding).to.include(
        data.encoding[0].compression[0]
      );
      expect(chartDatasets.text[i].encoding).to.include("100%");
      testMaxDecimalDigits(chartDatasets.text[i].percentOfDatabase, 3);
      testMaxDecimalDigits(chartDatasets.text[i].percentOfTable, 3);
      i++;
    });
  });

  expect(chartDatasets.labels.length).to.eq(i);
  expect(chartDatasets.parents.length).to.eq(i);
  expect(chartDatasets.values.length).to.eq(i);
  expect(chartDatasets.text.length).to.eq(i);
}

export function assertMetricDetails(
  text: string,
  value: number,
  digits: number = 2
): void {
  const expected = cutNumber(value, digits).toString();
  let j = 0;
  for (let i = 0; i < expected.length; i++) {
    if (text[j] === " ") j++;
    expect(text[j]).to.eq(expected[i]);
    j++;
  }
}

// HELPERS
function getRoundedData(value: number): number {
  return roundNumber(value, 1000, 1 / Math.pow(10, 3), false);
}

/* abstract tests */

/** Test data, layout and details panel for a specific linechart metric by config on overview page */
export function testLinechartOnOverview(
  metric: string,
  request: Request,
  layoutData: {
    title: string;
    min?: number;
    max?: number;
  },
  transformData: (data: any, xhr: any) => any
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
        data = transformData(data, xhr);
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
  transformData: (data: any, xhr: any) => any
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
        data = transformData(data, xhr);
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
