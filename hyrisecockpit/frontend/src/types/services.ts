import { Ref } from "@vue/composition-api";
import { Workload } from "./workloads";

export interface FetchService {
  data: Ref<any>;
  checkState: () => void;
}

export type TransformationService = (
  data: any,
  primaryKey?: string,
  secondaryKey?: string
) => any;

export interface WorkloadService {
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
  registerWorkload: () => void;
  startWorkload: () => void;
  stopWorkload: () => void;
}

export type FetchType = "read" | "modify";

export type Base =
  | "system_data"
  | "throughput"
  | "storage"
  | "chunks_data"
  | "latency"
  | "queue_length"
  | "krueger_data";



