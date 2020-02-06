import { Workload, WorkloadMetaData } from "../types/workloads";

export const workloadNamingForBackend: Record<Workload, string> = {
  TPCH01: "tpch_0.1",
  TPCH1: "tpch_1",
  TPCDS: "tpcds",
  JOB: "job"
};

const workloadMetaData: Record<Workload, WorkloadMetaData> = {
  TPCH01: {
    folder_name: workloadNamingForBackend["TPCH01"],
    frequency: getFrequency()
  },
  TPCH1: {
    folder_name: workloadNamingForBackend["TPCH1"],
    frequency: getFrequency()
  },
  TPCDS: {
    folder_name: workloadNamingForBackend["TPCDS"],
    frequency: getFrequency()
  },
  JOB: {
    folder_name: workloadNamingForBackend["JOB"],
    frequency: getFrequency()
  }
};

export function getFrequency(): number {
  return 200;
}
export function getWorkloadMetaData(workload: Workload): WorkloadMetaData {
  return workloadMetaData[workload];
}
