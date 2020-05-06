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
  fetchActivePlugins: () => Promise<string[]>;
  fetchAvailablePlugins: () => Promise<string[]>;
  fetchPluginLogs: () => Promise<Object>;
  fetchPluginSettings: () => Promise<Object>;
  setPluginSetting: (
    databaseId: string,
    settingId: string,
    settingValue: string
  ) => Promise<void>;
  togglePlugin: (
    databaseId: string,
    plugin: string,
    isActivated: boolean
  ) => Promise<void>;
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
