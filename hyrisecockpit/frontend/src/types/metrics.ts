import { TransformationService, Base, FetchType } from "./services";
import { Ref } from "@vue/composition-api";

export type Metric =
  | "access"
  | "cpu"
  | "storage"
  | "throughput"
  | "latency"
  | "ram";

export const instanceMetrics = ["Storage", "Access"];
export const comparisonMetrics = ["Throughput", "Latency", "CPU", "RAM"];

export interface MetricMetadata {
  fetchType: FetchType;
  transformationService: TransformationService;
  base: Base;
  endpoint: string;
}

export interface ComparisonMetricData {
  data: Ref<any>;
  selectedDatabaseIds: Ref<string[]>;
  chartConfiguration: string[];
}

export interface MetricProps {
  metricMeta: MetricMetadata;
  selectedDatabases: string[];
  enableComparison: boolean; // can be removed when clear if we only use one select box on comparison screen
}

export const MetricPropsValidation = {
  metricMeta: {
    type: Object,
    default: null
  },
  selectedDatabases: {
    type: Array,
    default: null
  },
  enableComparison: {
    type: Boolean,
    default: null
  }
};
