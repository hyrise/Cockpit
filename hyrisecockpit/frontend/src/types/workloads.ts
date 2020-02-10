export type Workload = "tpch01" | "tpch1" | "tpcds" | "job";

export interface WorkloadMetaData {
  folder_name: string;
  frequency: number;
}

export const availableWorkloads: Workload[] = [
  "tpch01",
  "tpch1",
  "tpcds",
  "job"
];
