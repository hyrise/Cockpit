import { Workload, WorkloadMetaData } from "../../types/workloads";

const workloadMetaData: Record<Workload, WorkloadMetaData> = {
  "tpch_0.1": {
    benchmark: "TPCH",
    "scale-factor": 0.1,
    frequency: getFrequency()
  },
  tpch_1: {
    benchmark: "TPCH",
    "scale-factor": 1,
    frequency: getFrequency()
  },
  tpcds: {
    benchmark: "TPCDS",
    "scale-factor": 1,
    frequency: getFrequency()
  },
  job: {
    benchmark: "JOB",
    "scale-factor": 0,
    frequency: getFrequency()
  }
};

export function getFrequency(): number {
  return 200;
}
export function getWorkloadMetaData(workload: Workload): WorkloadMetaData {
  return workloadMetaData[workload];
}
