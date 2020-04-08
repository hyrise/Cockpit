export type Workload = "tpch_0_1" | "tpch_1" | "tpcds_1" | "job_1";

export interface WorkloadProjectionData {
  transferred: string;
  displayed: string;
}

export const availableWorkloads: Workload[] = [
  "tpch_0_1",
  "tpch_1",
  "tpcds_1",
  "job_1"
];
