<template>
  <div>
    <metric-details
      v-if="showDetails"
      :data="data"
      :databases="selectedDatabases"
      :border="1200"
      state-order="desc"
      unit="%"
    />
    <Linechart
      :selected-databases="selectedDatabases"
      :data="data"
      :graph-id="graphId || 'cpu'"
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
  name: "CPU",
  props: MetricPropsValidation,
  components: { Linechart, MetricDetails },
  setup(props: MetricProps, context: SetupContext): ComparisonMetricData {
    return {
      ...useLineChartComponent(props, context)
    };
  }
});
</script>
