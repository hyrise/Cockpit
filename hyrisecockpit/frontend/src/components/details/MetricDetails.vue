<template>
  <div>
    <div
      class="details"
      v-for="(database, idx) in databases"
      :key="database"
      :style="{
        color: valueColor[database],
        fontSize: '18px',
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
  getMetricValueStateOrder
} from "../../meta/metrics";
import { MetricValueState, MetricValueStateOrder } from "../../types/metrics";
import { useFormatting } from "@/meta/formatting";

interface Props {
  data: any;
  databases: string[];
  unit: string;
  border: number;
  stateOrder: MetricValueStateOrder;
  decimalDigits: number;
}
interface Data {
  currentValue: Ref<Record<string, number>>;
  valueColor: Ref<Record<string, string>>;
  formatNumberWithCommas: (data: number) => string;
}

export default defineComponent({
  name: "MetricDetails",
  props: {
    data: {
      type: Object,
      default: null
    },
    databases: {
      type: Array,
      default: null
    },
    unit: {
      type: String,
      default: null
    },
    border: {
      type: Number,
      default: 0
    },
    stateOrder: {
      type: String,
      default: null
    },
    decimalDigits: {
      type: Number,
      default: 2
    }
  },
  setup(props: Props, context: SetupContext): Data {
    const { currentValue } = useMetricValues(props);
    const { formatNumberWithCommas } = useFormatting();

    return {
      currentValue,
      ...useMetricColors(props, currentValue),
      formatNumberWithCommas
    };
  }
});

interface MetricValueData {
  currentValue: Ref<Record<string, number>>;
}

function useMetricValues(props: Props): MetricValueData {
  const { roundNumber } = useFormatting();
  return {
    currentValue: computed(() => {
      if (!props.databases.length) return {};
      return props.databases.reduce(
        (valueMap: Record<string, number>, database: string) => {
          valueMap[database] = Object.keys(props.data).length
            ? roundNumber(
                props.data[database][props.data[database].length - 1],
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
  props: Props,
  currentValue: Ref<Record<string, number>>
): MetricColorData {
  const valueStateOrder = getMetricValueStateOrder(props.stateOrder);

  function getValueState(value: number): MetricValueState {
    return value > 0.66 * props.border
      ? valueStateOrder[0]
      : value > 0.33 * props.border
      ? valueStateOrder[1]
      : valueStateOrder[2];
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
