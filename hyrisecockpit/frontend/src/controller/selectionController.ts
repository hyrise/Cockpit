import Vue from "vue";
import { eventBus } from "@/plugins/eventBus";
import { PageName } from "@/types/views";
import { SelectionController } from "@/types/controller";
import { pages } from "@/meta/views";
import { reactive, watch, computed } from "@vue/composition-api";
import {
  Metric,
  comparisonMetrics,
  overviewMetrics,
  workloadMetrics
} from "@/types/metrics";
import { useSorting } from "@/meta/formatting";

export function useSelectionController(): SelectionController {
  const { sortElements } = useSorting();

  const availableDatabases = computed(
    () =>
      Vue.prototype.$databaseController.availableDatabasesById.value as string[]
  );
  const selectedDatabases = reactive<Record<PageName, string[]>>({
    comparison: [] as string[],
    overview: [] as string[],
    workload: [] as string[]
  });
  const availableMetrics = reactive<Record<PageName, Metric[]>>({
    comparison: comparisonMetrics,
    overview: overviewMetrics,
    workload: workloadMetrics
  });
  const selectedMetrics = reactive<Record<PageName, Metric[]>>({
    comparison: comparisonMetrics,
    overview: overviewMetrics,
    workload: workloadMetrics
  });

  watch(
    () => availableDatabases.value,
    () => {
      selectedDatabases.comparison = availableDatabases.value as string[];
      selectedDatabases.overview = availableDatabases.value as string[];
      selectedDatabases.workload = availableDatabases.value as string[];
    }
  );

  pages.forEach(page => {
    // database events
    eventBus.$on(
      `SELECTED_DATABASES_CHANGED_ON_${page.toUpperCase()}`,
      (payload: { database: string; value: boolean }) => {
        if (payload.value) {
          selectedDatabases[page].push(payload.database);
          selectedDatabases[page] = sortElements(
            selectedDatabases[page],
            availableDatabases.value as string[]
          );
        } else {
          selectedDatabases[page] = selectedDatabases[page].filter(
            current => current !== payload.database
          );
        }
      }
    );

    // metric events
    eventBus.$on(
      `SELECTED_METRICS_CHANGED_ON_${page.toUpperCase()}`,
      (payload: { metric: Metric; value: boolean }) => {
        if (payload.value) {
          selectedMetrics[page].push(payload.metric);
          selectedMetrics[page] = sortElements(
            selectedMetrics[page],
            availableMetrics[page]
          );
        } else {
          selectedMetrics[page] = selectedMetrics[page].filter(
            current => current !== payload.metric
          );
        }
      }
    );
  });

  return { selectedDatabases, availableMetrics, selectedMetrics };
}
