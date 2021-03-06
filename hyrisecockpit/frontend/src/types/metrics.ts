import { TransformationService, FetchType } from "./services";
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
  | "queryTypeProportion"
  | "memoryFootprint"
  | "operatorProportion"
  | "segmentConfiguration"
  | "negativeThroughput"
  | "queryInformation";

export const availableMetrics: Metric[] = [
  "access",
  "cpu",
  "storage",
  "throughput",
  "latency",
  "ram",
  "queueLength",
  "queryTypeProportion",
  "memoryFootprint",
  "operatorProportion",
  "segmentConfiguration",
  "negativeThroughput",
  "queryInformation",
];

export const comparisonMetrics: Metric[] = [
  "throughput",
  "latency",
  "negativeThroughput",
  "queueLength",
  "cpu",
  "ram",
  "memoryFootprint",
  "storage",
  "access",
  "segmentConfiguration",
  "operatorProportion",
];
export const overviewMetrics: Metric[] = [
  "throughput",
  "latency",
  "negativeThroughput",
  "queueLength",
  "cpu",
  "ram",
  "memoryFootprint",
];

export const workloadMetrics: Metric[] = [
  "queryInformation",
  "queryTypeProportion",
  "operatorProportion",
];

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
  base?: string;
  endpoint: string;
  component: string;
  requestTime: number;
  dataType: DataType;
  staticAxesRange?: AxesRange;
  historic: boolean;
}

export interface LineChartComponentData {
  data: Ref<any>;
  chartConfiguration: ChartConfiguration;
  maxValue: Ref<number>;
  timestamps: Ref<Date[]>;
  pluginEventData: any;
}

export interface BasicChartComponentData<T> {
  data: Ref<T>;
  chartConfiguration: ChartConfiguration;
}

export interface MetricProps {
  metric: Metric;
  selectedDatabases: string[];
  graphId: string;
  showDetails: boolean;
  maxChartWidth: number;
  totalNumberOfDatabases: number;
  activatePluginEventClick: (graphId: string, database: any) => void;
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
  totalNumberOfDatabases: {
    type: Number,
    default: null,
  },
  activatePluginEventClick: {
    type: Function,
    default: () => {},
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
  descriptions: any[][];
  text: any[][];
};

export type SegmentData = AccessData & {
  valueToId: string[];
};

export type MetricDetailsConfiguration = {
  border: number;
  unit: string;
  stateOrder: MetricValueState[];
};
