import { Workload, WorkloadMetaData } from "../types/workloads";

const transferredWorkload: Record<Workload, string> = {
  tpch01: "tpch_0.1",
  tpch1: "tpch_1",
  tpcds: "tpcds",
  job: "job"
};
const displayedWorkload: Record<Workload, string> = {
  tpch01: "TPC-H SF 0.1",
  tpch1: "TPC-H SF 1",
  tpcds: "TPCDS",
  job: "JOB"
};
const workloadMetaData: Record<Workload, WorkloadMetaData> = {
  tpch01: {
    folder_name: getTransferredWorkload("tpch01"),
    frequency: getFrequency()
  },
  tpch1: {
    folder_name: getTransferredWorkload("tpch1"),
    frequency: getFrequency()
  },
  tpcds: {
    folder_name: getTransferredWorkload("tpcds"),
    frequency: getFrequency()
  },
  job: {
    folder_name: getTransferredWorkload("job"),
    frequency: getFrequency()
  }
};

export function getFrequency(): number {
  return 200;
}
export function getTransferredWorkload(workload: Workload): string {
  return transferredWorkload[workload];
}
export function getDisplayedWorkload(workload: Workload): string {
  return displayedWorkload[workload];
}
export function getWorkloadMetaData(workload: Workload): WorkloadMetaData {
  return workloadMetaData[workload];
}
