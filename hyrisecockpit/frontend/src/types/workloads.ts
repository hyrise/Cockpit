export type Workload = "tpch01" | "tpch1" | "tpcds" | "job";

export interface WorkloadProjectionData {
  transferred: string;
  displayed: string;
}

export const availableWorkloads: Workload[] = [
  "tpch01",
  "tpch1",
  "tpcds",
  "job",
];
