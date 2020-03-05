import { Ref } from "@vue/composition-api";
import { Workload } from "./workloads";

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
  getWorkloadData: () => Promise<string[]>;
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
  startWorkload: (workload: Workload, frequency: number) => void;
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
