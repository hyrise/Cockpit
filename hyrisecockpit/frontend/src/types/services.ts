import { Ref } from "@vue/composition-api";
import { Metric } from "./metrics";

export interface MetricService {
  data: any;
  getDataIfReady: (
    historicRangeFetch?: boolean,
    staticRangeFetch?: boolean
  ) => void;
  maxValues: Record<Metric, number>;
  timestamps: Ref<any>;
}

export type TransformationService = (
  data: any,
  primaryKey?: string,
  secondaryKey?: string
) => any;

export interface PluginService {
  fetchActivePlugins: () => Promise<Object>;
  fetchAvailablePlugins: () => Promise<string[]>;
  fetchPluginLogs: () => Promise<Object>;
  setPluginSetting: (
    databaseId: string,
    pluginId: string,
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
  getLoadedWorkloads: () => Promise<string[]>;
  getDatabaseStatus: () => Promise<string[]>;
  getAllAvailableWorkloads: () => Promise<void>;
  loadWorkload: (workload: string) => Promise<void>;
  deleteWorkload: (workload: string) => Promise<void>;
  startWorkers: () => Promise<void>;
  stopWorkers: () => Promise<void>;
  getWorkload: (workload: string) => Promise<void>;
  getWorkloads: () => Promise<void>;
  startWorkload: (
    workload: string,
    frequency: number,
    weights: Object
  ) => Promise<void>;
  stopWorkload: (workload: string) => Promise<void>;
}

export type FetchType = "read" | "modify";
