import { getSelectorByConfig, roundNumber } from "../helpers";
import { testDateFormatting } from "../abstractTests";

const selectors: Record<string, { element: string; title: string }> = {
  throughput: { element: "div", title: "throughput" },
  latency: { element: "div", title: "latency" },
  queueLength: { element: "div", title: "queueLength" },
  cpu: { element: "div", title: "cpu" },
  ram: { element: "div", title: "ram" },
  executedQueryTypeProportion: {
    element: "div",
    title: "executedQueryTypeProportion"
  }
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
