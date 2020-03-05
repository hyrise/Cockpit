<template>
  <div>
    <metric-details
      v-if="showDetails"
      :data="data"
      :databases="selectedDatabases"
      :border="12000"
      state-order="desc"
      unit="q/sec"
    />
    <Linechart
      :selected-databases="selectedDatabases"
      :data="data"
      :graph-id="graphId || 'throughput'"
      :chart-configuration="chartConfiguration"
      :max-value="maxValue"
      :timestamps="timestamps"
    />
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch
} from "@vue/composition-api";
import Linechart from "../charts/Linechart.vue";
import {
  MetricProps,
  MetricPropsValidation,
  ComparisonMetricData
} from "../../types/metrics";
import MetricDetails from "../details/MetricDetails.vue";
import { useLineChartComponent } from "../../meta/components";

export default defineComponent({
  name: "Throughput",
  props: MetricPropsValidation,
  components: { Linechart, MetricDetails },
  setup(props: MetricProps, context: SetupContext): ComparisonMetricData {
    return {
      ...useLineChartComponent(props, context)
    };
  }
});
</script>
