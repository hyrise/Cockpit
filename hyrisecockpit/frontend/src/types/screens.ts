import { Ref } from "@vue/composition-api";

export interface ScreenData {
  watchedInstances: Ref<string[]>;
}

export interface ContainerProps {
  selectedDatabases: string[];
  selectedMetrics: string[];
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
