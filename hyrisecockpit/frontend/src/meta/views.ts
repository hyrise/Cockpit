import { SetupContext, Ref, ref } from "@vue/composition-api";
import { eventBus } from "../plugins/eventBus";
import { Metric } from "@/types/metrics";
import { Database } from "@/types/database";

export function useSelectionHandling(
  context: SetupContext
): { selectedMetrics: Ref<Metric[]>; selectedDatabases: Ref<Database[]> } {
  const selectedMetrics = ref<Metric[]>([]);
  const selectedDatabases = ref<Database[]>([]);

  eventBus.$on("SELECTED_METRICS_CHANGED", (metrics: Metric[]) => {
    selectedMetrics.value = metrics;
  });

  eventBus.$on("SELECTED_DATABASES_CHANGED", (databases: Database[]) => {
    selectedDatabases.value = databases;
  });
  return { selectedMetrics, selectedDatabases };
}
