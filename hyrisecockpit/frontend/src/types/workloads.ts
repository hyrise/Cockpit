export type Workload = "tpch_0.1" | "tpch_1" | "tpcds" | "job";
type Benchmark = "TPCH" | "TPCDS" | "JOB";

export interface WorkloadData {
  benchmark: Benchmark;
  "scale-factor": number;
  frequency: number;
}

export const availableWorkloads: Workload[] = [
  "tpch_0.1",
  "tpch_1",
  "tpcds",
  "job"
];
