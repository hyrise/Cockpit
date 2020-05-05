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
    () => context.root.$selectionController.pageMetrics[page]
  );
  const selectedDatabases = computed(
    () => context.root.$selectionController.pageDatabases[page]
  );

  return { selectedMetrics, selectedDatabases };
}

export function useSelectableItem(
  context: SetupContext
): {
  handleSelect: <T>(id: T) => void;
  handleUnSelect: <T>(id: T) => void;
} {
  function handleUnSelect<T>(id: T): void {
    context.emit("toggleSelected", id, false);
  }
  function handleSelect<T>(id: T): void {
    context.emit("toggleSelected", id, true);
  }

  return { handleSelect, handleUnSelect };
}
