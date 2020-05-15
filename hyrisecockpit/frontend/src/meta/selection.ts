import { Ref, SetupContext, computed } from "@vue/composition-api";
import { Metric } from "@/types/metrics";
import { PageName } from "@/types/views";
import { useFormatting } from "@/meta/formatting";

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

export interface UseSelectableItem {
  handleSelect: <T>(id: T) => void;
  handleUnSelect: <T>(id: T) => void;
  truncateItemTitle: (title: string) => string;
}

export function useSelectableItem(context: SetupContext): UseSelectableItem {
  const { trimString } = useFormatting();

  function handleUnSelect<T>(id: T): void {
    context.emit("toggleSelected", id, false);
  }
  function handleSelect<T>(id: T): void {
    context.emit("toggleSelected", id, true);
  }

  function truncateItemTitle(title: string): string {
    return trimString(title, 20);
  }

  return { handleSelect, handleUnSelect, truncateItemTitle };
}
