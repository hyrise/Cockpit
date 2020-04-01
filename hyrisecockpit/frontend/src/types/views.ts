import { Ref } from "@vue/composition-api";
import { Metric } from "./metrics";

export type PageName = "WORKLOAD" | "COMPARISON" | "OVERVIEW";

const pageNames: Record<string, PageName> = {
  workload: "WORKLOAD",
  comparison: "COMPARISON",
  overview: "OVERVIEW"
};

export function getPageName(route: string): PageName {
  return pageNames[route];
}

export interface MetricViewData {
  watchedMetrics: Metric[];
  selectedMetrics: Ref<Metric[]>;
  selectedDatabases: Ref<string[]>;
}

export interface ContainerProps {
  selectedDatabases: string[];
  selectedMetrics: Metric[];
  showDetails: boolean;
}

export const ContainerPropsValidation = {
  selectedDatabases: {
    type: Array,
    default: null
  },
  selectedMetrics: {
    type: Array,
    default: null
  },
  showDetails: {
    type: Boolean,
    default: false
  }
};
