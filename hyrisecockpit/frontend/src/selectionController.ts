import Vue from "vue";
import { eventBus } from "@/plugins/eventBus";
import { PageName } from "@/types/views";
import { SelectionController } from "@/types/controller";
import { pages } from "@/meta/views";
import { reactive, watch } from "@vue/composition-api";
import {
  Metric,
  comparisonMetrics,
  overviewMetrics,
  workloadMetrics
} from "@/types/metrics";
import { useMetricEvents } from "@/meta/events";

export function useSelectionController(): SelectionController {
  const { emitWatchedMetricsChangedEvent } = useMetricEvents();
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
    () => Vue.prototype.$databaseController.databasesUpdated.value,
    () => {
      const databases = Vue.prototype.$databaseController.availableDatabasesById
        .value as string[];
      selectedDatabases.comparison = databases;
      selectedDatabases.overview = databases;
      selectedDatabases.workload = databases;
    }
  );

  pages.forEach(page => {
    // database events
    eventBus.$on(
      `SELECTED_DATABASES_CHANGED_ON_${page.toUpperCase()}`,
      (payload: { database: string; value: boolean }) => {
        if (payload.value) {
          selectedDatabases[page].push(payload.database);
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
