import { Ref } from "@vue/composition-api";
import { Workload, WorkloadMetaData } from "./workloads";

export interface MetricService {
  data: Ref<any>;
  getDataIfReady: () => void;
  maxValue: Ref<Number>;
  timestamps: Ref<any>;
}

export type TransformationService = (
  data: any,
  primaryKey?: string,
  secondaryKey?: string
) => any;

export interface WorkloadService {
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
  startWorkload: (workload: Workload, frequency: number) => void;
  stopWorkload: () => void;
}

export type FetchType = "read" | "modify";

export type Base =
  | "system"
  | "throughput"
  | "storage"
  | "chunks_data"
  | "latency"
  | "queue_length"
  | "krueger_data";
