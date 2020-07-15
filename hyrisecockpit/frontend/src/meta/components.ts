import { SetupContext, Ref, ref, computed, watch } from "@vue/composition-api";
import {
  MetricProps,
  LineChartComponentData,
  BasicChartComponentData,
  Metric,
} from "@/types/metrics";
import { useDataEvents } from "@/meta/events";
import { getMetricChartConfiguration, getMetricMetadata } from "@/meta/metrics";

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
