import { Ref } from "@vue/composition-api";
import { Metric } from "./metrics";

export type PageName = "workload" | "comparison" | "overview";

export const pages: PageName[] = ["comparison", "workload", "overview"];

export interface MetricViewData {
  selectedMetrics: Ref<readonly Metric[]>;
  selectedDatabases: Ref<readonly string[]>;
}

export interface ContainerProps {
  selectedDatabases: string[];
  selectedMetrics: Metric[];
  showDetails: boolean;
  showHeader: boolean;
}

export const ContainerPropsValidation = {
  selectedDatabases: {
    type: Array,
    default: null,
  },
  selectedMetrics: {
    type: Array,
    default: null,
  },
  showDetails: {
    type: Boolean,
    default: false,
  },
  showHeader: {
    type: Boolean,
    default: false,
  },
};
