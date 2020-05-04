<template>
  <b class="interval secondary--text">{{ interval }}</b>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  computed,
  Ref,
  ref,
} from "@vue/composition-api";
import { Metric } from "@/types/metrics";
import {
  getMetricRequestTime,
  getMetricChartConfiguration,
  getMetricDataType,
} from "@/meta/metrics";
import { useFormatting } from "@/meta/formatting";

interface Props {
  metric: Metric;
}
interface Data {
  interval: Ref<string>;
}

export default defineComponent({
  name: "TimeInterval",
  props: {
    metric: {
      type: String,
      default: null,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      interval: useUpdatingInterval(context, props.metric),
    };
  },
});

export function useUpdatingInterval(
  context: SetupContext,
  metric: Metric
): Ref<string> {
  const timestamps = context.root.$metricController.timestamps[metric];
  const { formatDateWithoutMilliSec, formatDateToHHMMSS } = useFormatting();
  return computed(() => {
    let currentTimeStamp = formatDateWithoutMilliSec(new Date());
    let type = "";
    const intervalTime = Math.max(
      Math.floor(getMetricRequestTime(metric) / Math.pow(10, 3)),
      context.root.$selectionController.selectedPrecision.value
    );
    if (timestamps.value.length > 0) {
      currentTimeStamp = timestamps.value[timestamps.value.length - 1];
    }
    if (getMetricDataType(metric) === "interval") {
      type =
        intervalTime > 1
          ? `Aggregation: ${intervalTime} seconds`
          : "Aggregation: 1 second";
    } else {
      type = `Snapshot: ${formatDateToHHMMSS(currentTimeStamp)}`;
    }
    return type;
  });
}
</script>
<style scoped>
.interval {
  font-size: 14px;
  word-break: normal;
  line-height: normal;
}
</style>
