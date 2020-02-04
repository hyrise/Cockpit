import { Workload, WorkloadData } from "../../types/workloads";

const workloadData: Record<Workload, WorkloadData> = {
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
export function getWorkloadData(workload: Workload): WorkloadData {
  return workloadData[workload];
}
