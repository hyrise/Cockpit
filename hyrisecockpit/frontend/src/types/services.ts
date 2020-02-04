import { Ref } from "@vue/composition-api";
import { Workload, WorkloadMetaData } from "./workloads";

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
  startWorkload: (workloadMetaData: WorkloadMetaData) => void;
  stopWorkload: () => void;
}

export type FetchType = "read" | "modify";

export type Base =
  | "system"
  | "throughput"
  | "storage"
  | "chunks"
  | "latency"
  | "queue_length";
