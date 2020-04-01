import { Ref, SetupContext, computed } from "@vue/composition-api";
import { Metric } from "@/types/metrics";
import { PageName } from "@/types/views";

export function useSelectionHandling(
  context: SetupContext,
  page: PageName
): {
  selectedMetrics: Ref<readonly Metric[]>;
  selectedDatabases: Ref<readonly string[]>;
} {
  const selectedMetrics = computed(
    () => context.root.$selectionController.selectedMetrics[page]
  );
  const selectedDatabases = computed(
    () => context.root.$selectionController.selectedDatabases[page]
  );

  return { selectedMetrics, selectedDatabases };
}
