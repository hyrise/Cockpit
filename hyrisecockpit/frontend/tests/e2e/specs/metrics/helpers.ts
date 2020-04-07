import { getSelectorByConfig, roundNumber } from "../helpers";
import { testDateFormatting, testMaxDecimalDigits } from "../abstractTests";

const selectors: Record<string, { element: string; title: string }> = {
  throughput: { element: "div", title: "throughput" },
  latency: { element: "div", title: "latency" },
  queueLength: { element: "div", title: "queueLength" },
  cpu: { element: "div", title: "cpu" },
  ram: { element: "div", title: "ram" },
  executedQueryTypeProportion: {
    element: "div",
    title: "executedQueryTypeProportion"
  },
  firstStorage: { element: "div", title: "1storage" },
  secondStorage: { element: "div", title: "2storage" },
  firstAccess: { element: "div", title: "1access" },
  secondAccess: { element: "div", title: "2access" },
  firstAccessSelect: { element: "input", title: "1access-select" },
  secondAccessSelect: { element: "input", title: "2access-select" },
  openDetailed: { element: "button", title: "open-metric-detailed-view" },
  closeDetailed: { element: "button", title: "close-metric-detailed-view" }
};

export function getSelector(component: string): string {
  return getSelectorByConfig(
    selectors[component].element,
    selectors[component].title
  );
}

export function getSelectorWithID(component: string, id: string): string {
  return getSelectorByConfig(
    selectors[component].element,
    `${selectors[component].title}-${id}`
  );
}

export function getDetailsSelectorWithID(
  component: string,
  id: string
): string {
  return getSelectorByConfig(
    selectors[component].element,
    `${selectors[component].title}-${id}-details`
  );
}

export function assertLineChartData(
  chartDatasets: any[],
  requestData: any,
  databases: any[]
): void {
  databases.forEach((database: any) => {
    const chartData: any = chartDatasets.find(
      (data: any) => data.name === database
    );
    expect(chartData).to.exist;
    expect(chartData.x).to.exist;
    expect(chartData.y).to.exist;

    chartData.x.forEach((item: any) => {
      testDateFormatting(item, "HHMMSS");
    });

    chartData.y.forEach((item: any) => {
      expect(item).to.eq(requestData[database]);
    });
  });
}

export function assertBarChartData(
  chartDatasets: any[],
  requestData: any,
  xaxis: string
): void {
  Object.keys(requestData).forEach((label: string) => {
    const chartData: any = chartDatasets.find(
      (data: any) => data.name === label
    );
    expect(chartData).to.exist;
    expect(chartData.x).to.exist;
    expect(chartData.y).to.exist;
    expect(chartData.y).to.eql([requestData[label]]);
    expect(chartData.x).to.eql([xaxis]);
  });
}

export function assertHeatMapData(
  chartDatasets: any,
  database: string,
  requestData?: any
): void {
  if (!requestData) {
    expect(chartDatasets.x).to.eql([]);
    expect(chartDatasets.y).to.eql([]);
    expect(chartDatasets.z).to.eql([]);
  } else {
    Object.entries(requestData).forEach(
      ([column, data]: [any, any], idx: number) => {
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
      // TODO: enable this if encoding was updated
      // expect(chartDatasets.text[i].encoding).to.eq(
      //   "encoding: " + data.encoding
      // );
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
  const expected = roundNumber(
    value,
    Math.pow(10, digits),
    Math.pow(10, digits),
    false
  ).toString();
  let j = 0;
  for (let i = 0; i < expected.length; i++) {
    if (text[j] === "´" || text[j] === " ") j++;
    expect(text[j]).to.eq(expected[i]);
    j++;
  }
}

// DATA
function getRoundedData(value: number): number {
  return roundNumber(value, 1000, 1 / Math.pow(10, 3), false);
}
