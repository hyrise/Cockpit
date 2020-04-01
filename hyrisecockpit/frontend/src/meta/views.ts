import { Ref, ref, watch } from "@vue/composition-api";
import { eventBus } from "../plugins/eventBus";
import { Metric } from "@/types/metrics";
import { PageName } from "@/types/views";

export function useSelectionHandling(
  page: PageName
): {
  selectedMetrics: Ref<Metric[]>;
  selectedDatabases: Ref<string[]>;
} {
  const selectedMetrics = ref<Metric[]>([]);
  const selectedDatabases = ref<string[]>([]);

  eventBus.$on(`SELECTED_METRICS_CHANGED_ON_${page}`, (metrics: Metric[]) => {
    selectedMetrics.value = metrics;
  });

  eventBus.$on(
    `SELECTED_DATABASES_CHANGED_ON_${page}`,
    (databases: string[]) => {
      console.log(page, "fired here");
      selectedDatabases.value = databases;
    }
  );
  return { selectedMetrics, selectedDatabases };
}
