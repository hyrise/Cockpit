import { getSelectorByConfig } from "../helpers";
import { testDateFormatting } from "../abstractTests";

const selectors: Record<string, string[]> = {
  throughput: ["div", "throughput"],
  latency: ["div", "latency"],
  queueLength: ["div", "queueLength"],
  cpu: ["div", "cpu"],
  ram: ["div", "ram"]
};

export function getSelector(component: string): string {
  return getSelectorByConfig(selectors[component][0], selectors[component][1]);
}

export function getSelectorWithID(component: string, id: string): string {
  return getSelectorByConfig(
    selectors[component][0],
    `${selectors[component][1]}-${id}`
  );
}

export function assertChartData(
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
