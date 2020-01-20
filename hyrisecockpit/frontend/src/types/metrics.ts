import { TransformationService, Base, FetchType } from "./services";

export type Metric = "access" | "cpu" | "storage" | "throughput";

export interface MetricMetadata {
  fetchType: FetchType;
  transformationService: TransformationService;
  base: Base;
  endpoint: string;
}

export interface MetricProps {
  metricMeta: MetricMetadata;
  preselectedDatabaseId: string;
}

export const MetricPropsValidation = {
  metricMeta: {
    type: Object,
    default: null
  },
  preselectedDatabaseId: {
    type: String,
    default: null
  }
};
