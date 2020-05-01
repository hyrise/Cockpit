import { Workload, WorkloadProjectionData } from "../types/workloads";

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
