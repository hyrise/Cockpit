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
      {{ currentValue[database] }} {{ unit }}
    </div>
  </div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch
} from "@vue/composition-api";
import {
  getMetricDetailColor,
  getMetricValueStateOrder,
  getMetricComponent
} from "../meta/metrics";
import { MetricValueState, MetricValueStateOrder } from "../../types/metrics";

interface Props {
  data: any;
  databases: string[];
  unit: string;
  border: number;
  stateOrder: MetricValueStateOrder;
}
interface Data {
  currentValue: Ref<Record<string, number>>;
  valueColor: Ref<Record<string, string>>;
}

export default createComponent({
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
    }
  },
  setup(props: Props, context: SetupContext): Data {
    const valueStateOrder = getMetricValueStateOrder(props.stateOrder);

    function getValueState(value: number): MetricValueState {
      return value > 0.66 * props.border
        ? valueStateOrder[0]
        : value > 0.33 * props.border
        ? valueStateOrder[1]
        : valueStateOrder[2];
    }
    const currentValue = computed(() => {
      const databaseValueMap: Record<string, number> = {};
      if (!props.databases.length) return databaseValueMap;
      props.databases.forEach(
        database =>
          (databaseValueMap[database] = Object.keys(props.data).length
            ? Math.floor(props.data[database][props.data[database].length - 1])
            : 0)
      );
      return databaseValueMap;
    });
    const valueColor = computed(() => {
      const databaseValueColorMap: Record<string, string> = {};
      Object.keys(currentValue.value).forEach(
        database =>
          (databaseValueColorMap[database] = getMetricDetailColor(
            getValueState(currentValue.value[database])
          ))
      );
      return databaseValueColorMap;
    });
    return { currentValue, valueColor };
  }
});
</script>
<style>
.details {
  z-index: 1;
  position: absolute;
  width: 100%;
  text-align: center;
}
</style>
