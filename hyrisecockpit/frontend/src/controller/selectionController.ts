import Vue from "vue";
import { eventBus } from "@/plugins/eventBus";
import { PageName } from "@/types/views";
import { SelectionController } from "@/types/controller";
import { pages } from "@/meta/views";
import { reactive, watch, computed, ref } from "@vue/composition-api";
import {
  Metric,
  comparisonMetrics,
  overviewMetrics,
  workloadMetrics,
} from "@/types/metrics";
import { useSorting } from "@/meta/formatting";

export function useSelectionController(): SelectionController {
  const { sortElements } = useSorting();

  const availableDatabases = computed(
    () =>
      Vue.prototype.$databaseController.availableDatabasesById.value as string[]
  );
  const pageDatabases = reactive<Record<PageName, string[]>>({
    comparison: [] as string[],
    overview: [] as string[],
    workload: [] as string[],
  });
  const availableMetrics = reactive<Record<PageName, Metric[]>>({
    comparison: comparisonMetrics,
    overview: overviewMetrics,
    workload: workloadMetrics,
  });
  const pageMetrics = reactive<Record<PageName, Metric[]>>({
    comparison: comparisonMetrics,
    overview: overviewMetrics,
    workload: workloadMetrics,
  });
  const selectedRange = ref(30);
  const selectedPrecision = ref(1);

  const page = ref<PageName>("");

  const selectedMetrics = computed(() => pageMetrics[page.value] || []);
  const selectedDatabases = computed(() => pageDatabases[page.value] || []);

  eventBus.$on("PAGE_CHANGED", (newPage: PageName) => {
    page.value = newPage;
  });

  watch(
    () => availableDatabases.value,
    () => {
      pageDatabases.comparison = availableDatabases.value as string[];
      pageDatabases.overview = availableDatabases.value as string[];
      pageDatabases.workload = availableDatabases.value as string[];
    }
  );

  pages.forEach((page) => {
    // database events
    eventBus.$on(
      `SELECTED_DATABASES_CHANGED_ON_${page.toUpperCase()}`,
      (payload: { database: string; value: boolean }) => {
        if (payload.value) {
          pageDatabases[page].push(payload.database);
          pageDatabases[page] = sortElements(
            pageDatabases[page],
            availableDatabases.value as string[]
          );
        } else {
          pageDatabases[page] = pageDatabases[page].filter(
            (current) => current !== payload.database
          );
        }
      }
    );

    // metric events
    eventBus.$on(
      `SELECTED_METRICS_CHANGED_ON_${page.toUpperCase()}`,
      (payload: { metric: Metric; value: boolean }) => {
        if (payload.value) {
          pageMetrics[page].push(payload.metric);
          pageMetrics[page] = sortElements(
            pageMetrics[page],
            availableMetrics[page]
          );
        } else {
          pageMetrics[page] = pageMetrics[page].filter(
            (current) => current !== payload.metric
          );
        }
      }
    );
  });

  return {
    selectedDatabases,
    availableMetrics,
    selectedMetrics,
    selectedPrecision,
    selectedRange,
    pageDatabases,
    pageMetrics,
  };
}
