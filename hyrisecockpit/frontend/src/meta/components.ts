import { SetupContext, Ref, watch } from "@vue/composition-api";
import { MetricProps, ComparisonMetricData, Metric } from "../types/metrics";
import { getMetricChartConfiguration } from "./metrics";
import { useDataEvents } from "../meta/events";

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
