import { Workload, WorkloadProjectionData } from "../types/workloads";
import { isInTestMode } from "../../config";

const workloadProjectionData: Record<Workload, WorkloadProjectionData> = {
  tpch01: {
    transferred: "tpch_0_1",
    displayed: "TPC-H SF 0.1",
  },
  tpch1: {
    transferred: "tpch_1",
    displayed: "TPC-H SF 1",
  },
  tpcds: {
    transferred: "tpcds_1",
    displayed: "TPC-DS",
  },
  job: {
    transferred: "job_1",
    displayed: "Join Order Benchmark",
  },
};

export function getTransferredWorkload(workload: Workload): string {
  return workloadProjectionData[workload].transferred;
}
export function getDisplayedWorkload(workload: Workload): string {
  return workloadProjectionData[workload].displayed;
}
export function getWorkloadFromTransferred(transferred: string): Workload {
  return Object.keys(workloadProjectionData).find(
    (workload) => getTransferredWorkload(workload as Workload) === transferred
  )! as Workload;
}
export function getDisplayedFromTransferred(transferred: string): string {
  return Object.values(workloadProjectionData).find(
    (workload) => workload.transferred === transferred
  )!.displayed;
}

export function getTableName(table: string): string {
  const index: number = Math.max(
    table.indexOf("tpch"),
    table.indexOf("tpcds"),
    table.indexOf("tpcc"),
    table.indexOf("job")
  );

  if (isInTestMode || index === -1) return table;

  const words: string[] = table.slice(index).split("_");
  if (words.length === 3) {
    return `${table.slice(0, index - 1)} (${words[0].toUpperCase()} SF ${
      words[1]
    }.${words[2]})`;
  }
  return `${table.slice(0, index - 1)} (${words[0].toUpperCase()} SF ${
    words[1]
  })`;
}
