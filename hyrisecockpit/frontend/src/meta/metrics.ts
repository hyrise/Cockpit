import { monitorBackend } from "../../config";
import {
  Metric,
  MetricMetadata,
  MetricValueState,
  MetricValueStateOrder,
  ChartConfiguration
} from "../types/metrics";
import { useDataTransformation } from "../services/transformationService";
import { getColor } from "./colors";

const metricsMetadata: Record<Metric, MetricMetadata> = {
  access: {
    fetchType: "read",
    transformationService: useDataTransformation("access"),
    base: "chunks_data",
    endpoint: monitorBackend + "chunks",
    component: "Access",
    requestTime: 5000
  },
  cpu: {
    fetchType: "modify",
    transformationService: useDataTransformation("cpu"),
    base: "system_data",
    endpoint: monitorBackend + "system",
    component: "CPU",
    requestTime: 1000,
    staticAxesRange: {
      y: { max: 100 }
    }
  },
  latency: {
    fetchType: "modify",
    transformationService: useDataTransformation("latency"),
    base: "latency",
    endpoint: monitorBackend + "latency",
    component: "Latency",
    requestTime: 1000
  },
  executedQueryTypeProportion: {
    fetchType: "read",
    transformationService: useDataTransformation("executedQueryTypeProportion"),
    base: "krueger_data",
    endpoint: monitorBackend + "krueger_data",
    component: "QueryTypeProportion",
    requestTime: 2000
  },
  generatedQueryTypeProportion: {
    fetchType: "read",
    transformationService: useDataTransformation(
      "generatedQueryTypeProportion"
    ),
    base: "krueger_data",
    endpoint: monitorBackend + "krueger_data",
    component: "QueryTypeProportion",
    requestTime: 2000
  },
  queueLength: {
    fetchType: "modify",
    transformationService: useDataTransformation("queueLength"),
    base: "queue_length",
    endpoint: monitorBackend + "queue_length",
    component: "QueueLength",
    requestTime: 1000
  },
  ram: {
    fetchType: "modify",
    transformationService: useDataTransformation("ram"),
    base: "system_data",
    endpoint: monitorBackend + "system",
    component: "RAM",
    requestTime: 1000,
    staticAxesRange: {
      y: { max: 100 }
    }
  },
  storage: {
    fetchType: "read",
    transformationService: useDataTransformation("storage"),
    base: "storage",
    endpoint: monitorBackend + "storage",
    component: "Storage",
    requestTime: 5000
  },
  throughput: {
    fetchType: "modify",
    transformationService: useDataTransformation("throughput"),
    base: "throughput",
    endpoint: monitorBackend + "throughput",
    component: "Throughput",
    requestTime: 1000
  }
};

const metricDetailColor: Record<MetricValueState, string> = {
  average: getColor(1),
  high: getColor(3),
  low: getColor(2)
};

const metricValueStateOrder: Record<
  MetricValueStateOrder,
  MetricValueState[]
> = {
  asc: ["low", "average", "high"],
  desc: ["high", "average", "low"]
};

const timeLabel = "Timestamps";
const queryLabel = "Number of queries";

const metricsChartConfiguration: Record<Metric, ChartConfiguration> = {
  access: {
    title: "Access Frequency",
    xaxis: "Columns",
    yaxis: "Chunks"
  },
  cpu: {
    title: "CPU",
    xaxis: timeLabel,
    yaxis: "Workload in %"
  },
  executedQueryTypeProportion: {
    title: "Query Type Proportion",
    xaxis: "Workload",
    yaxis: queryLabel
  },
  generatedQueryTypeProportion: {
    title: "Query Type Proportion",
    xaxis: "Workload",
    yaxis: queryLabel
  },
  latency: {
    title: "Latency",
    xaxis: timeLabel,
    yaxis: "Latency in ms"
  },
  queueLength: {
    title: "Queue Length",
    xaxis: timeLabel,
    yaxis: queryLabel
  },
  ram: {
    title: "RAM",
    xaxis: timeLabel,
    yaxis: "Memory usage in %"
  },
  storage: {
    title: "Storage"
  },
  throughput: {
    title: "Throughput",
    xaxis: timeLabel,
    yaxis: queryLabel
  }
};

const metricDescription: Record<Metric, string> = {
  access:
    "Number of accesses  <br/> separated by chunk and column  <br/> of the selected table.",
  cpu: "Current processor workload.",
  executedQueryTypeProportion:
    "Distribution of types of <br/>  the executed queries.",
  generatedQueryTypeProportion:
    "Distribution of types of <br/>  the generated queries.",
  latency: "Average latency <br/> when processing queries from queue.",
  queueLength:
    "Length of the queue <br/> containing queries which <br/> have to be processed by workers ",
  ram: "Current memory usage of <br/>  the database instance in percent",
  storage: "Sizes of the tables and <br/> columns currently available.",
  throughput: "Number of queries <br/> processed in the last second."
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

export function getMetricDescription(metric: Metric): string {
  return metricDescription[metric];
}
