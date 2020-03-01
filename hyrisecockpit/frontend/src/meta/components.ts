import { SetupContext } from "@vue/composition-api";
import { MetricProps, ComparisonMetricData } from "../types/metrics";
import { getMetricChartConfiguration } from "./metrics";

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
