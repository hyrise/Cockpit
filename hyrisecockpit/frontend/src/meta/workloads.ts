import { Workload, WorkloadMetaData } from "../types/workloads";

const workloadMetaData: Record<Workload, WorkloadMetaData> = {
  "tpch_0.1": {
    folder_name: "tpch_0.1",
    frequency: getFrequency()
  },
  tpch_1: {
    folder_name: "tpch_1",
    frequency: getFrequency()
  },
  tpcds: {
    folder_name: "tpcds",
    frequency: getFrequency()
  },
  job: {
    folder_name: "job",
    frequency: getFrequency()
  }
};

export function getFrequency(): number {
  return 200;
}
export function getWorkloadMetaData(workload: Workload): WorkloadMetaData {
  return workloadMetaData[workload];
}
