import { backendUrl } from "../../types/services";
import {
  Metric,
  MetricMetadata,
  MetricValueState,
  MetricValueStateOrder
} from "../../types/metrics";
import { useDataTransformation } from "../../services/transformationService";

const metricsMetadata: Record<Metric, MetricMetadata> = {
  access: {
    fetchType: "read",
    transformationService: useDataTransformation("access"),
    base: "chunks_data",
    endpoint: backendUrl + "chunks_data",
    titel: "Access Frequency",
    component: "Access"
  },
  cpu: {
    fetchType: "modify",
    transformationService: useDataTransformation("cpu"),
    base: "system_data",
    endpoint: backendUrl + "system_data",
    titel: "CPU",
    component: "CPU"
  },
  latency: {
    fetchType: "modify",
    transformationService: useDataTransformation("latency"),
    base: "latency",
    endpoint: backendUrl + "latency",
    titel: "Latency",
    component: "Latency"
  },
  queryTypeProportion: {
    fetchType: "read",
    transformationService: useDataTransformation("queryTypeProportion"),
    base: "krueger_data",
    endpoint: backendUrl + "krueger_data",
    titel: "Query Type Proportion",
    component: "QueryTypeProportion"
  },
  queueLength: {
    fetchType: "modify",
    transformationService: useDataTransformation("queueLength"),
    base: "queue_length",
    endpoint: backendUrl + "queue_length",
    titel: "Queue Length",
    component: "QueueLength"
  },
  ram: {
    fetchType: "modify",
    transformationService: useDataTransformation("ram"),
    base: "system_data",
    endpoint: backendUrl + "system_data",
    titel: "RAM",
    component: "RAM"
  },
  storage: {
    fetchType: "read",
    transformationService: useDataTransformation("storage"),
    base: "storage",
    endpoint: backendUrl + "storage",
    titel: "Storage",
    component: "Storage"
  },
  throughput: {
    fetchType: "modify",
    transformationService: useDataTransformation("throughput"),
    base: "throughput",
    endpoint: backendUrl + "throughput",
    titel: "Throughput",
    component: "Throughput"
  }
};

const metricDetailColor: Record<MetricValueState, string> = {
  average: "#fb8c00",
  high: "#4caf50",
  low: "#ff5252"
};

const metricValueStateOrder: Record<
  MetricValueStateOrder,
  MetricValueState[]
> = {
  asc: ["low", "average", "high"],
  desc: ["high", "average", "low"]
};

export function getMetadata(metric: Metric): MetricMetadata {
  return metricsMetadata[metric];
}

export function getMetricComponent(metric: Metric): string {
  return metricsMetadata[metric].component;
}

export function getMetricTitle(metric: Metric): string {
  return metricsMetadata[metric].titel;
}

export function getMetricValueStateOrder(
  order: MetricValueStateOrder
): MetricValueState[] {
  return metricValueStateOrder[order];
}

export function getMetricDetailColor(value: MetricValueState): string {
  return metricDetailColor[value];
}
