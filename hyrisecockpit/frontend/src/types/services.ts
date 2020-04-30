import { Ref } from "@vue/composition-api";
import { Workload } from "./workloads";
import { Metric } from "./metrics";

export interface MetricService {
  data: any;
  getDataIfReady: (refetch?: boolean) => void;
  maxValues: Record<Metric, number>;
  timestamps: Ref<any>;
}

export type TransformationService = (
  data: any,
  primaryKey?: string,
  secondaryKey?: string
) => any;

export interface PluginService {
  plugins: Ref<string[]>;
  activePlugins: Ref<string[]>;
  updatePlugins: (databaseId: string, plugin: string) => Promise<void>;
  pluginLogs: Ref<any>;
  pluginSettings: Ref<any>;
  updatePluginSettings: (
    databaseId: string,
    settingId: string,
    settingValue: string
  ) => void;
}

export interface WorkloadService {
  getLoadedWorkloadData: () => Promise<string[]>;
  loadWorkloadData: (workload: Workload) => Promise<void>;
  deleteWorkloadData: (workload: Workload) => Promise<void>;
  getWorkload: (workload: Workload) => Promise<void>;
  getWorkloads: () => Promise<void>;
  startWorkload: (workload: Workload, frequency: number) => Promise<void>;
  updateWorkload: (workload: Workload, frequency: number) => Promise<void>;
  stopWorkload: (workload: Workload) => Promise<void>;
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
