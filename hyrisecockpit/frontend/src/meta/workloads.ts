import {
  Workload,
  WorkloadMetaData,
  WorkloadProjectionData
} from "../types/workloads";

const workloadProjectionData: Record<Workload, WorkloadProjectionData> = {
  tpch01: {
    transferred: "tpch_0.1",
    displayed: "TPC-H SF 0.1"
  },
  tpch1: {
    transferred: "tpch_1",
    displayed: "TPC-H SF 1"
  },
  tpcds: {
    transferred: "tpcds_1",
    displayed: "TPC-DS"
  },
  job: {
    transferred: "job",
    displayed: "JOB"
  }
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
  return workloadProjectionData[workload].transferred;
}
export function getDisplayedWorkload(workload: Workload): string {
  return workloadProjectionData[workload].displayed;
}
export function getWorkloadMetaData(workload: Workload): WorkloadMetaData {
  return workloadMetaData[workload];
}
