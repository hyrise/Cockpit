import { SetupContext, Ref, computed } from "@vue/composition-api";
import { MetricProps, ComparisonMetricData, Metric } from "@/types/metrics";
import { useDataEvents } from "@/meta/events";
import { getMetricChartConfiguration } from "@/meta/metrics";

export function useLineChartComponent(
  props: MetricProps,
  context: SetupContext
): ComparisonMetricData {
  return {
    data: context.root.$metricController.data[props.metric],
    chartConfiguration: getMetricChartConfiguration(props.metric),
    maxValue: context.root.$metricController.maxValueData[props.metric],
    timestamps: context.root.$metricController.timestamps[props.metric],
    pluginEventData: context.root.$pluginService.pluginEventData,
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

export function useUpdatingData(data: any, metrics: Metric[]): void {
  if (Object.values(data).length) {
    metrics.forEach((metric) => {
      if (metricEventMap[metric]) metricEventMap[metric]!(data);
    });
  }
}

export function useDatabaseFlex(
  props: any
): { databaseFlex: Readonly<Ref<Object>> } {
  return {
    databaseFlex: computed(() => {
      return { flex: `1 0 ${100 / props.selectedDatabases.length - 1}%` };
    }),
  };
}
