import { Ref } from "@vue/composition-api";
import { Metric } from "./metrics";
import { Database } from "./database";

export interface ScreenData {
  watchedInstances: Ref<Database[]>;
}

export interface ContainerProps {
  selectedDatabases: Database[];
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
