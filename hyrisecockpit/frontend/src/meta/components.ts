import { SetupContext, Ref, computed } from "@vue/composition-api";
import { MetricProps, ComparisonMetricData, Metric } from "../types/metrics";
import { getMetricChartConfiguration } from "./metrics";
import { useDataEvents } from "../meta/events";
import { getMetricRequestTime, getMetricFetchType } from "@/meta/metrics";
import { useFormatting } from "@/meta/formatting";

export function useLineChartComponent(
  props: MetricProps,
  context: SetupContext
): ComparisonMetricData {
  return {
    data: context.root.$metricController.data[props.metric],
    chartConfiguration: getMetricChartConfiguration(props.metric),
    maxValue: context.root.$metricController.maxValueData[props.metric],
    timestamps: context.root.$metricController.timestamps[props.metric]
  };
}

const {
  emitStorageDataChangedEvent,
  emitCPUDataChangedEvent
} = useDataEvents();

const metricEventMap: Partial<Record<Metric, (data: any) => void>> = {
  cpu: emitCPUDataChangedEvent,
  storage: emitStorageDataChangedEvent
};

export function useUpdatingData(data: any, metric: Metric): void {
  if (Object.keys(data).length) {
    if (metricEventMap[metric]) metricEventMap[metric]!(data);
  }
}

export function useDatabaseFlex(
  props: any
): { databaseFlex: Readonly<Ref<Object>> } {
  return {
    databaseFlex: computed(() => {
      return { flex: `1 0 ${100 / props.selectedDatabases.length - 1}%` };
    })
  };
}

export function useUpdatingInterval(
  context: SetupContext,
  metric: Metric
): Ref<string> {
  const timestamps = context.root.$metricController.timestamps[metric];
  const { formatDateWithoutMilliSec, formatDateToHHMMSS } = useFormatting();
  return computed(() => {
    let currentTimeStamp = formatDateWithoutMilliSec(new Date());
    let previousTimeStamp = new Date(
      currentTimeStamp.getTime() - getMetricRequestTime(metric)
    );
    if (timestamps.value.length == 1) {
      currentTimeStamp = timestamps.value[0];
      previousTimeStamp = new Date(
        timestamps.value[0].getTime() - getMetricRequestTime(metric)
      );
    }
    if (timestamps.value.length > 1) {
      currentTimeStamp = timestamps.value[timestamps.value.length - 1];
      previousTimeStamp =
        getMetricFetchType(metric) === "modify"
          ? timestamps.value[0]
          : timestamps.value[timestamps.value.length - 2];
    }
    return `${formatDateToHHMMSS(previousTimeStamp)} - ${formatDateToHHMMSS(
      currentTimeStamp
    )}`;
  });
}
