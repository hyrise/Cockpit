import { TransformationService, Base, FetchType } from "./services";
import { Ref } from "@vue/composition-api";

export type MetricValueState = "low" | "average" | "high";
export type MetricValueStateOrder = "asc" | "desc";
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
  chartConfiguration: string[];
}

export interface MetricProps {
  metricMeta: MetricMetadata;
  selectedDatabases: string[];
  graphId: string;
  showDetails: boolean;
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
  showDetails: {
    type: Boolean,
    default: null
  },
  graphId: {
    type: String,
    default: null
  }
};
