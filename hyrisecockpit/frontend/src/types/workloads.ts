export type Workload = "TPCH01" | "TPCH1" | "TPCDS" | "JOB";

export interface WorkloadMetaData {
  folder_name: string;
  frequency: number;
}

export const availableWorkloads: Workload[] = [
  "TPCH01",
  "TPCH1",
  "TPCDS",
  "JOB"
];
