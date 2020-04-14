<template>
  <div>
    <div
      :id="`${metric}-${database}-details`"
      class="details"
      v-for="(database, idx) in databases"
      :key="database"
      :style="{
        color: valueColor[database],
        fontSize: '20px',
        fontWeight: 'bold',
        top: idx * 5 + 12.5 + '%'
      }"
    >
      {{ formatNumberWithCommas(currentValue[database]) }} {{ unit }}
    </div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref
} from "@vue/composition-api";
import {
  getMetricDetailColor,
  getMetricDetailsConfiguration
} from "@/meta/metrics";
import {
  MetricValueState,
  MetricValueStateOrder,
  Metric,
  MetricDetailsConfiguration
} from "@/types/metrics";
import { useFormatting } from "@/meta/formatting";

interface Props {
  metric: Metric;
  databases: string[];
  decimalDigits: number;
}
interface Data {
  currentValue: Ref<Record<string, number>>;
  valueColor: Ref<Record<string, string>>;
  formatNumberWithCommas: (data: number) => string;
  unit: string;
}

export default defineComponent({
  name: "MetricDetails",
  props: {
    metric: {
      type: String,
      default: null
    },
    databases: {
      type: Array,
      default: null
    },
    decimalDigits: {
      type: Number,
      default: 2
    }
  },
  setup(props: Props, context: SetupContext): Data {
    const metricDetailsConfig = getMetricDetailsConfiguration(props.metric)!;
    const { currentValue } = useMetricValues(props, context);

    return {
      currentValue,
      ...useMetricColors(currentValue, metricDetailsConfig),
      formatNumberWithCommas: useFormatting().formatNumberWithCommas,
      unit: metricDetailsConfig.unit
    };
  }
});

interface MetricValueData {
  currentValue: Ref<Record<string, number>>;
}

function useMetricValues(props: Props, context: SetupContext): MetricValueData {
  const { roundNumber } = useFormatting();
  const data = context.root.$metricController.data[props.metric];
  return {
    currentValue: computed(() => {
      if (!props.databases.length) return {};
      return props.databases.reduce(
        (valueMap: Record<string, number>, database: string) => {
          valueMap[database] = Object.keys(data.value).length
            ? roundNumber(
                data.value[database][data.value[database].length - 1],
                Math.pow(10, props.decimalDigits),
                Math.pow(10, props.decimalDigits),
                false
              )
            : 0;
          return valueMap;
        },
        {} as Record<string, number>
      );
    })
  };
}

interface MetricColorData {
  valueColor: Ref<Record<string, string>>;
}

function useMetricColors(
  currentValue: Ref<Record<string, number>>,
  metricDetailsConfig: MetricDetailsConfiguration
): MetricColorData {
  function getValueState(value: number): MetricValueState {
    return value > 0.66 * metricDetailsConfig.border
      ? metricDetailsConfig.stateOrder[0]
      : value > 0.33 * metricDetailsConfig.border
      ? metricDetailsConfig.stateOrder[1]
      : metricDetailsConfig.stateOrder[2];
  }

  return {
    valueColor: computed(() => {
      return Object.keys(currentValue.value).reduce(
        (colorMap: Record<string, string>, database: string) => {
          colorMap[database] = getMetricDetailColor(
            getValueState(currentValue.value[database])
          );
          return colorMap;
        },
        {} as Record<string, string>
      );
    })
  };
}
</script>
<style>
.details {
  z-index: 1;
  position: absolute;
  width: 100%;
  text-align: center;
}
</style>
