<template>
  <div class="details" v-bind:style="{ color: valueColor, fontSize: '18px' }">
    {{ currentValue }} in {{ unit }}
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
import { getMetricDetailColor } from "../meta/metrics";
import { MetricValueState } from "../../types/metrics";

interface Props {
  data: any;
  database: string;
  unit: string;
  border: number;
}
interface Data {
  currentValue: Ref<number>;
  valueColor: Ref<string>;
}

export default createComponent({
  name: "MetricDetails",
  props: {
    data: {
      type: Object,
      default: null
    },
    database: {
      type: String,
      default: null
    },
    unit: {
      type: String,
      default: null
    },
    border: {
      type: Number,
      default: 0
    }
  },
  setup(props: Props, context: SetupContext): Data {
    function getValueState(value: number): MetricValueState {
      return value > 0.66 * props.border
        ? "high"
        : value > 0.33 * props.border
        ? "average"
        : "low";
    }
    const currentValue = computed(() =>
      Object.keys(props.data).length
        ? Math.floor(
            props.data[props.database][props.data[props.database].length - 1]
          )
        : 0
    );
    const valueColor = computed(() => {
      return getMetricDetailColor(getValueState(currentValue.value));
    });
    return { currentValue, valueColor };
  }
});
</script>
<style>
.details {
  z-index: 10;
  position: absolute;
  top: 15%;
  width: 100%;
  text-align: center;
}
</style>
