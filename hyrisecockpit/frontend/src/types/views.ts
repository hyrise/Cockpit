import { Ref } from "@vue/composition-api";
import { Metric } from "./metrics";
import { Database } from "./database";

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
