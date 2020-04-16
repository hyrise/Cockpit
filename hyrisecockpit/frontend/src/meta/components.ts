import { SetupContext, Ref, computed, watch } from "@vue/composition-api";
import { MetricProps, ComparisonMetricData, Metric } from "@/types/metrics";
import { useDataEvents } from "@/meta/events";
import {
  getMetricRequestTime,
  getMetricChartConfiguration,
  getMetricDataType
} from "@/meta/metrics";
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

export function useUpdatingData(data: any, metrics: Metric[]): void {
  if (Object.values(data).length) {
    metrics.forEach(metric => {
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
    let type = "";
    const intervalTime = Math.floor(
      getMetricRequestTime(metric) / Math.pow(10, 3)
    );
    if (timestamps.value.length > 0) {
      currentTimeStamp = timestamps.value[timestamps.value.length - 1];
    }
    if (getMetricDataType(metric) === "interval") {
      type =
        intervalTime > 1
          ? `Interval: last ${intervalTime} seconds`
          : "Interval: last second";
    } else {
      type = `Snapshot: ${formatDateToHHMMSS(currentTimeStamp)}`;
    }
    return type;
  });
}
