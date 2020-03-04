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
  | "ram"
  | "queueLength"
  | "executedQueryTypeProportion"
  | "generatedQueryTypeProportion";

export interface MetricController {
  data: Record<Metric, Ref<any>>;
  maxValueData: Record<Metric, Ref<number>>;
  timestamps: Record<Metric, Ref<Date[]>>;
}

//TODO: refactor
export const availableMetrics: Metric[] = [
  "access",
  "cpu",
  "storage",
  "throughput",
  "latency",
  "ram",
  "queueLength",
  "executedQueryTypeProportion",
  "generatedQueryTypeProportion"
];

export const instanceMetrics: Metric[] = ["storage", "access"];

export const comparisonMetrics: Metric[] = [
  "throughput",
  "latency",
  "queueLength",
  "cpu",
  "ram",
  "storage",
  "access",
  "executedQueryTypeProportion"
];
export const overviewMetrics: Metric[] = [
  "throughput",
  "latency",
  "queueLength",
  "cpu",
  "ram"
];

export const workloadMetrics: Metric[] = ["generatedQueryTypeProportion"];

export interface MetricMetadata {
  fetchType: FetchType;
  transformationService: TransformationService;
  base: Base;
  endpoint: string;
  component: string;
  requestTime: number;
}

export interface ComparisonMetricData {
  data: Ref<any>;
  chartConfiguration: ChartConfiguration;
  maxValue: Ref<number>;
  timestamps: Ref<Date[]>;
}

export interface MetricProps {
  metric: Metric;
  metricMeta: MetricMetadata;
  selectedDatabases: string[];
  graphId: string;
  showDetails: boolean;
}

export const MetricPropsValidation = {
  metric: {
    type: String,
    default: null
  },
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

export type ChartConfiguration = {
  title: string;
  xaxis?: string;
  yaxis?: string;
};
