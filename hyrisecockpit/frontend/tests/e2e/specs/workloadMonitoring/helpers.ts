import { roundNumber, getSelectorByCustomConfig } from "../helpers";
import { displayedBenchmark } from "../../setup/helpers";

export const selectors = {
  queryDataTable: getSelectorByCustomConfig("query-data-table"),
  querySearch: getSelectorByCustomConfig("query-search-input"),
  queryTable: getSelectorByCustomConfig("query-table"),
};

export function assertQueryData(rowData: string, data: any): void {
  expect(rowData).to.include(data.query_number);
  expect(rowData).to.include(data.throughput.toString());
  expect(rowData).to.include(roundNumber(data.latency, Math.pow(10, 6)));
  expect(rowData).to.include((displayedBenchmark as any)[data.benchmark]);
}
