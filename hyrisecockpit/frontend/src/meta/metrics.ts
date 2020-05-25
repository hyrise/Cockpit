import { monitorBackend } from "../../config";
import {
  Metric,
  MetricMetadata,
  MetricValueState,
  MetricValueStateOrder,
  MetricDetailsConfiguration,
  ChartConfiguration,
  DataType,
} from "@/types/metrics";
import { useDataTransformation } from "@/services/transformationService";
import { colorValueDefinition } from "./colors";
import { FetchType } from "@/types/services";

/** store metric specific static data */
const metricsMetadata: Record<Metric, MetricMetadata> = {
  access: {
    fetchType: "read",
    transformationService: useDataTransformation("access"),
    base: "chunks_data",
    endpoint: monitorBackend + "chunks",
    component: "Access",
    requestTime: 5000,
    dataType: "interval",
    historic: false,
  },
  cpu: {
    fetchType: "modify",
    transformationService: useDataTransformation("cpu"),
    base: "system_data",
    endpoint: monitorBackend + "system",
    component: "CPU",
    requestTime: 1000,
    dataType: "interval",
    historic: true,
    staticAxesRange: {
      y: { max: 100 },
    },
  },
  queryTypeProportion: {
    fetchType: "read",
    transformationService: useDataTransformation("queryTypeProportion"),
    endpoint: monitorBackend + "krueger_data",
    component: "QueryTypeProportion",
    requestTime: 5000,
    dataType: "interval",
    historic: false,
  },
  latency: {
    fetchType: "modify",
    transformationService: useDataTransformation("latency"),
    base: "latency",
    endpoint: monitorBackend + "latency",
    component: "Latency",
    requestTime: 1000,
    dataType: "interval",
    historic: true,
  },
  memoryFootprint: {
    fetchType: "modify",
    transformationService: useDataTransformation("memoryFootprint"),
    base: "storage",
    endpoint: monitorBackend + "storage",
    component: "MemoryFootprint",
    requestTime: 1000,
    dataType: "interval",
    historic: true,
  },
  operatorProportion: {
    fetchType: "read",
    transformationService: useDataTransformation("operatorProportion"),
    endpoint: monitorBackend + "operator",
    component: "OperatorProportion",
    requestTime: 5000,
    dataType: "interval",
    historic: false,
  },
  queueLength: {
    fetchType: "modify",
    transformationService: useDataTransformation("queueLength"),
    base: "queue_length",
    endpoint: monitorBackend + "queue_length",
    component: "QueueLength",
    requestTime: 1000,
    dataType: "interval",
    historic: true,
  },
  ram: {
    fetchType: "modify",
    transformationService: useDataTransformation("ram"),
    base: "system_data",
    endpoint: monitorBackend + "system",
    component: "RAM",
    requestTime: 1000,
    dataType: "interval",
    historic: true,
    staticAxesRange: {
      y: { max: 100 },
    },
  },
  storage: {
    fetchType: "read",
    transformationService: useDataTransformation("storage"),
    base: "storage",
    endpoint: monitorBackend + "storage",
    component: "Storage",
    requestTime: 5000,
    dataType: "snapshot",
    historic: false,
  },
  throughput: {
    fetchType: "modify",
    transformationService: useDataTransformation("throughput"),
    base: "throughput",
    endpoint: monitorBackend + "throughput",
    component: "Throughput",
    requestTime: 1000,
    dataType: "interval",
    historic: true,
  },
};

const metricDetailColor: Record<MetricValueState, string> = {
  average: colorValueDefinition.orange,
  high: colorValueDefinition.green,
  low: colorValueDefinition.red,
};

const metricValueStateOrder: Record<
  MetricValueStateOrder,
  MetricValueState[]
> = {
  asc: ["low", "average", "high"],
  desc: ["high", "average", "low"],
};

const timeLabel = "Timestamps";
const queryLabel = "Number of queries";

const metricsChartConfiguration: Record<Metric, ChartConfiguration> = {
  access: {
    title: "Segment Access Frequencies", //Access Frequency
    xaxis: "Columns",
    yaxis: "Chunks",
  },
  cpu: {
    title: "CPU Utilization", //CPU (from hyrise utilization table)
    xaxis: timeLabel,
    yaxis: "Workload in %",
  },
  queryTypeProportion: {
    title: "Query Type Proportion",
    xaxis: "Query Type",
    yaxis: "Proportion of query types in %",
  },
  latency: {
    title: "Latency",
    xaxis: timeLabel,
    yaxis: "Latency in ms",
  },
  memoryFootprint: {
    title: "Data Size", //Memory Footprint (Sum of all tables)
    xaxis: timeLabel,
    yaxis: "Memory Footprint in MB",
  },
  operatorProportion: {
    title: "Operator Runtime Overview",
    xaxis: "Operator",
    yaxis: "Distribution of operator runtimes in %",
  },
  queueLength: {
    title: "Queue Length",
    xaxis: timeLabel,
    yaxis: queryLabel,
  },
  ram: {
    title: "Process Memory (RSS)", //RAM
    xaxis: timeLabel,
    yaxis: "Memory usage in %",
  },
  storage: {
    title: "Data Size - Overview", //Storage
  },
  throughput: {
    title: "Throughput",
    xaxis: timeLabel,
    yaxis: `${queryLabel} / s`,
  },
};

const metricDetailsConfiguration: Partial<Record<
  Metric,
  MetricDetailsConfiguration
>> = {
  cpu: {
    border: 100,
    unit: "%",
    stateOrder: getMetricValueStateOrder("asc"),
  },
  latency: {
    border: 100,
    unit: "ms",
    stateOrder: getMetricValueStateOrder("asc"),
  },
  memoryFootprint: {
    border: 1,
    unit: "MB",
    stateOrder: getMetricValueStateOrder("desc"),
  },
  queueLength: {
    border: 20000,
    unit: "q",
    stateOrder: getMetricValueStateOrder("asc"),
  },
  ram: {
    border: 100,
    unit: "%",
    stateOrder: getMetricValueStateOrder("asc"),
  },
  throughput: {
    border: 10000,
    unit: "q/s",
    stateOrder: getMetricValueStateOrder("desc"),
  },
};

export function getMetricMetadata(metric: Metric): MetricMetadata {
  return metricsMetadata[metric];
}

export function getMetricComponent(metric: Metric): string {
  return metricsMetadata[metric].component;
}

export function getMetricTitle(metric: Metric): string {
  return metricsChartConfiguration[metric].title;
}

export function getMetricRequestTime(metric: Metric): number {
  return metricsMetadata[metric].requestTime;
}

export function getMetricFetchType(metric: Metric): FetchType {
  return metricsMetadata[metric].fetchType;
}

export function getMetricDataType(metric: Metric): DataType {
  return metricsMetadata[metric].dataType;
}

export function getMetricValueStateOrder(
  order: MetricValueStateOrder
): MetricValueState[] {
  return metricValueStateOrder[order];
}

export function getMetricDetailColor(value: MetricValueState): string {
  return metricDetailColor[value];
}

export function getMetricChartConfiguration(
  metric: Metric
): ChartConfiguration {
  return metricsChartConfiguration[metric];
}

export function getMetricDetailsConfiguration(
  metric: Metric
): MetricDetailsConfiguration | undefined {
  return metricDetailsConfiguration[metric];
}
