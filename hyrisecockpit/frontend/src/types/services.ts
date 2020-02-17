import { Ref } from "@vue/composition-api";
import { Workload } from "./workloads";

export interface FetchService {
  data: Ref<any>;
  getDataIfReady: () => void;
}

export type TransformationService = (
  data: any,
  primaryKey?: string,
  secondaryKey?: string
) => any;

export interface WorkloadService {
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
  startWorkload: (workload: Workload, frequency: Ref<number>) => void;
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
