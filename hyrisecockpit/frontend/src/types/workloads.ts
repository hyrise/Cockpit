import { Ref } from "@vue/composition-api";

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

export interface WorkloadAction {
  workload: Ref<Workload>;
  workloadData: Record<string, { loaded: boolean; loading: boolean }>;
  actions: Record<string, { active: boolean; loading: boolean }>;
  runningWorkload: Ref<boolean>;
  disabled: Ref<boolean>;
  databases: Ref<readonly string[]>;
  startingWorkload: () => void;
  pausingWorkload: () => void;
  stoppingWorkload: () => void;
  handleFrequencyChange: (frequency: number) => void;
  handleWorkloadChange: (workload: Workload) => void;
  handleWorkloadDataChange: (workload: Workload) => void;
}
