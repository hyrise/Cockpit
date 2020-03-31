import { getSelectorByConfig, roundNumber } from "../helpers";

const selectors: Record<string, string> = {
  queryTable: getSelectorByConfig("div", "query-table"),
  queryDataTable: getSelectorByConfig("div", "query-data-table")
};

export function getSelector(component: string): string {
  return selectors[component];
}

const displayedBenchmark: Record<string, string> = {
  "tpch_0.1": "TPC-H SF 0.1",
  tpch_1: "TPC-H SF 1",
  tpcds_1: "TPC-DS",
  job: "Join Order Benchmark"
};

function getDisplayedBenchmark(benchmark: string): string {
  return displayedBenchmark[benchmark];
}

export function assertQueryData(rowData: string, data: any): void {
  expect(rowData.includes(data.query_number)).to.eq(true);
  expect(rowData.includes(data.throughput.toString())).to.eq(true);
  expect(
    rowData.includes(roundNumber(data.latency, Math.pow(10, 6)).toString())
  ).to.eq(true);
  expect(rowData.includes(getDisplayedBenchmark(data.benchmark))).to.eq(true);
}
