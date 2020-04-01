import { Ref, ref, watch, SetupContext, computed } from "@vue/composition-api";
import { eventBus } from "@/plugins/eventBus";
import { Metric } from "@/types/metrics";
import { PageName } from "@/types/views";

export const pages: PageName[] = ["comparison", "workload", "overview"];

export function useSelectionHandling(
  context: SetupContext,
  page: PageName
): {
  selectedMetrics: Ref<Metric[]>;
  selectedDatabases: Ref<readonly string[]>;
} {
  const selectedMetrics = ref<Metric[]>([]);
  const selectedDatabases = computed(
    () => context.root.$selectionController.selectedDatabases[page] as string[]
  );

  eventBus.$on(`SELECTED_METRICS_CHANGED_ON_${page}`, (metrics: Metric[]) => {
    selectedMetrics.value = metrics;
  });

  return { selectedMetrics, selectedDatabases };
}
