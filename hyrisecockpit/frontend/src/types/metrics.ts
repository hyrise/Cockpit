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
  | "generatedQueryTypeProportion"
  | "memoryFootprint";

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
  "generatedQueryTypeProportion",
  "memoryFootprint",
];

export const instanceMetrics: Metric[] = ["storage", "access"];

export const comparisonMetrics: Metric[] = [
  "throughput",
  "latency",
  "queueLength",
  "cpu",
  "ram",
  "memoryFootprint",
  "storage",
  "access",
  "executedQueryTypeProportion",
];
export const overviewMetrics: Metric[] = [
  "throughput",
  "latency",
  "queueLength",
  "cpu",
  "ram",
  "memoryFootprint",
];

export const workloadMetrics: Metric[] = ["generatedQueryTypeProportion"];

interface AxesRange {
  x?: {
    min?: number;
    max?: number;
  };
  y?: {
    min?: number;
    max?: number;
  };
}

export type DataType = "interval" | "snapshot";

export interface MetricMetadata {
  fetchType: FetchType;
  transformationService: TransformationService;
  base: Base;
  endpoint: string;
  component: string;
  requestTime: number;
  dataType: DataType;
  staticAxesRange?: AxesRange;
  historic: boolean;
}

export interface ComparisonMetricData {
  data: Ref<any>;
  chartConfiguration: ChartConfiguration;
  maxValue: Ref<number>;
  timestamps: Ref<Date[]>;
}

export interface MetricProps {
  metric: Metric;
  selectedDatabases: string[];
  graphId: string;
  showDetails: boolean;
  maxChartWidth: number;
}

export const MetricPropsValidation = {
  metric: {
    type: String,
    default: null,
  },
  selectedDatabases: {
    type: Array,
    default: null,
  },
  showDetails: {
    type: Boolean,
    default: null,
  },
  graphId: {
    type: String,
    default: null,
  },
  maxChartWidth: {
    type: Number,
    default: 0,
  },
};

export type ChartConfiguration = {
  title: string;
  xaxis?: string;
  yaxis?: string;
};

export type TreemapDescription = {
  size: string;
  encoding: string;
  dataType: string;
  percentOfDatabase: string;
  percentOfTable: string;
};

export type StorageData = {
  parents: string[];
  labels: string[];
  sizes: number[];
  descriptions: TreemapDescription[];
};

export type AccessData = {
  dataByChunks: number[][];
  chunks: string[];
  columns: string[];
  descriptions: string[][];
};

export type MetricDetailsConfiguration = {
  border: number;
  unit: string;
  stateOrder: MetricValueState[];
};
