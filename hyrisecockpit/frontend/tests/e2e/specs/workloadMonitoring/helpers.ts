import { roundNumber, getSelectorByCustomConfig } from "../helpers";
import { displayedBenchmark } from "../../setup/helpers";

export const selectors = {
  queryDataTable: getSelectorByCustomConfig("query-data-table"),
  querySearch: getSelectorByCustomConfig("query-search-input"),
  queryTable: getSelectorByCustomConfig("query-table"),
};

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
