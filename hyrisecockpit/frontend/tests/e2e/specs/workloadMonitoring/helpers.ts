import { getSelectorByConfig, roundNumber } from "../helpers";
import { displayedBenchmark } from "../../setup/helpers";

const selectors: Record<string, string> = {
  queryDataTable: getSelectorByConfig("div", "query-data-table"),
  querySearch: getSelectorByConfig("input", "query-search-input"),
  queryTable: getSelectorByConfig("div", "query-table"),
};

export function getSelector(component: string): string {
  return selectors[component];
}

export function assertQueryData(rowData: string, data: any): void {
  expect(rowData.includes(data.query_number)).to.eq(true);
  expect(rowData.includes(data.throughput.toString())).to.eq(true);
  expect(
    rowData.includes(roundNumber(data.latency, Math.pow(10, 6)).toString())
  ).to.eq(true);
  expect(rowData.includes((displayedBenchmark as any)[data.benchmark])).to.eq(
    true
  );
}
