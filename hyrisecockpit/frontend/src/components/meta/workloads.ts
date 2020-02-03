import { Workload, WorkloadData } from "../../types/workloads";

const workloadData: Record<Workload, WorkloadData> = {
  "tpch_0.1": {
    benchmark: "TPCH",
    "scale-factor": 0.1,
    frequency: 200
  },
  tpch_1: {
    benchmark: "TPCH",
    "scale-factor": 1,
    frequency: 200
  },
  tpcds: {
    benchmark: "TPCDS",
    "scale-factor": 1,
    frequency: 200
  },
  job: {
    benchmark: "JOB",
    "scale-factor": 0,
    frequency: 200
  }
};

export function getWorkloadData(workload: Workload): WorkloadData {
  return workloadData[workload];
}
