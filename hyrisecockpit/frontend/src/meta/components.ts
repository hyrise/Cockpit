import { SetupContext, Ref, ref, computed, watch } from "@vue/composition-api";
import {
  MetricProps,
  LineChartComponentData,
  BasicChartComponentData,
  Metric,
} from "@/types/metrics";
import { useDataEvents } from "@/meta/events";
import { getMetricChartConfiguration, getMetricMetadata } from "@/meta/metrics";
import { useUpdatingDatabases } from "./databases";
import { eventBus } from "@/plugins/eventBus";

/* use line chart specific shared data */
export function useLineChartComponent(
  props: MetricProps,
  context: SetupContext
): LineChartComponentData {
  return {
    data: context.root.$metricController.data[props.metric],
    chartConfiguration: getMetricChartConfiguration(props.metric),
    maxValue: context.root.$metricController.maxValueData[props.metric],
    timestamps: context.root.$metricController.timestamps[props.metric],
    pluginEventData: context.root.$pluginController.pluginEventData,
  };
}

/* modify updating data accordingly before passing to the child chart component */
export function useModifiedChartData<T>(
  props: MetricProps,
  context: SetupContext
): BasicChartComponentData<T> {
  const data = context.root.$metricController.data[props.metric];
  const modifiedData = (ref([]) as unknown) as Ref<T>;
  const metricMeta = getMetricMetadata(props.metric);

  // modify data on base data change
  watch(data, () => {
    if (Object.keys(data.value).length) {
      modifiedData.value = metricMeta.transformationService(
        data.value,
        props.selectedDatabases[0]
      );
    }
  });

  return {
    data: modifiedData,
    chartConfiguration: getMetricChartConfiguration(props.metric),
  };
}

const {
  emitStorageDataChangedEvent,
  emitCPUDataChangedEvent,
} = useDataEvents();

const metricEventMap: Partial<Record<Metric, (data: any) => void>> = {
  cpu: emitCPUDataChangedEvent,
  storage: emitStorageDataChangedEvent,
};

/* emit updated metric data on change, if callback is present */
export function useUpdatingData(data: any, metrics: Metric[]): void {
  if (Object.values(data).length) {
    metrics.forEach((metric) => {
      if (metricEventMap[metric]) metricEventMap[metric]!(data);
    });
  }
}

/* use flex depending on number of selected databases */
export function useDatabaseFlex(
  props: any
): { databaseFlex: Readonly<Ref<Object>> } {
  return {
    databaseFlex: computed(() => {
      return { flex: `1 0 ${100 / props.selectedDatabases.length - 1}%` };
    }),
  };
}

export interface UseDataWithSelection {
  selectionItems: Ref<readonly string[]>;
  selectedItem: Ref<string>;
  selectedType: Ref<string>;
}

export function useDataWithSelection<T>(
  props: MetricProps,
  context: SetupContext,
  initialType: string = "",
  update?: (data: T) => void
): { selection: UseDataWithSelection; transformedData: Ref<T> } {
  const metricMeta = getMetricMetadata(props.metric);
  const data = context.root.$metricController.data[props.metric];
  const { databases } = useUpdatingDatabases(props, context);

  const selectedItem = usePreSelect(props.metric);
  const selectedType = ref(initialType);
  const transformedData = ref<T>({} as T) as Ref<T>;

  /** update data on base data and selection change */
  watch(
    [data, selectedItem, selectedType],
    () => {
      if (!Object.keys(data.value).length) return;

      // transform base data
      transformedData.value = metricMeta.transformationService(
        data.value,
        databases.value[0].id,
        selectedItem.value,
        selectedType.value
      );

      if (update) update(transformedData.value);
    },
    { immediate: true }
  );

  return {
    selection: {
      selectionItems: computed(() => databases.value[0].tables),
      selectedItem,
      selectedType,
    },
    transformedData,
  };
}

/** Use reactive selected item with preselection depending on metric */
function usePreSelect(metric: Metric): Ref<string> {
  const selectedItem = ref("");

  eventBus.$on(`PRESELECT_${metric.toUpperCase()}`, (item: string) => {
    selectedItem.value = item;
  });

  return selectedItem;
}
