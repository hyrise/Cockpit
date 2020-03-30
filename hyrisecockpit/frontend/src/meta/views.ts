import { Ref, ref } from "@vue/composition-api";
import { eventBus } from "../plugins/eventBus";
import { Metric } from "@/types/metrics";

export function useSelectionHandling(): {
  selectedMetrics: Ref<Metric[]>;
  selectedDatabases: Ref<string[]>;
} {
  const selectedMetrics = ref<Metric[]>([]);
  const selectedDatabases = ref<string[]>([]);

  eventBus.$on("SELECTED_METRICS_CHANGED", (metrics: Metric[]) => {
    selectedMetrics.value = metrics;
  });

  eventBus.$on("SELECTED_DATABASES_CHANGED", (databases: string[]) => {
    selectedDatabases.value = databases;
  });
  return { selectedMetrics, selectedDatabases };
}
