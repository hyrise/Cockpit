import Vue from "vue";
import { eventBus } from "@/plugins/eventBus";
import { PageName, pages } from "@/types/views";
import { SelectionController } from "@/types/controller";
import { reactive, watch, computed, ref } from "@vue/composition-api";
import {
  Metric,
  comparisonMetrics,
  overviewMetrics,
  workloadMetrics,
} from "@/types/metrics";
import { useSorting } from "@/meta/formatting";
import { getMetricMetadata } from "@/meta/metrics";

export type StaticRange = {
  startDate: Date;
  endDate: Date;
  precision: number;
};

export function useSelectionController(): SelectionController {
  const { sortElements } = useSorting();

  /* selected data and times */
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
  const selectedStaticRange = ref<StaticRange | null>(null);

  const page = ref<PageName | null>(null);

  const selectedMetrics = computed(() =>
    page.value ? pageMetrics[page.value] : []
  );
  const selectedDatabases = computed(() =>
    page.value ? pageDatabases[page.value] : []
  );

  // initialize databases
  watch(
    () => availableDatabases.value,
    () => {
      pageDatabases.comparison = availableDatabases.value as string[];
      pageDatabases.overview = availableDatabases.value as string[];
      pageDatabases.workload = availableDatabases.value as string[];
    },
    { immediate: true }
  );

  // reset page and range data
  eventBus.$on("PAGE_CHANGED", (newPage: PageName) => {
    page.value = newPage;
  });

  eventBus.$on("STATIC_RANGE_CHANGED", (newRange: StaticRange | null) => {
    selectedStaticRange.value = newRange;
    setMetrics(availableMetrics, !!newRange);
    setMetrics(pageMetrics, !!newRange);
  });

  /* filter historic metrics if static range applied, reset if not */
  function setMetrics(store: Record<PageName, Metric[]>, value: boolean): void {
    if (value) {
      Object.keys(store).forEach((key) => {
        store[key as PageName] = getPageMetrics(key as PageName).filter(
          (metric) => getMetricMetadata(metric).historic
        );
      });
    } else {
      Object.keys(store).forEach((key) => {
        store[key as PageName] = getPageMetrics(key as PageName);
      });
    }
  }

  function getPageMetrics(page: PageName): Metric[] {
    if (page === "comparison") return comparisonMetrics;
    if (page === "overview") return overviewMetrics;
    if (page === "workload") return workloadMetrics;
    return [];
  }

  // reset databases and metric data for selected page
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
    selectedStaticRange,
  };
}
