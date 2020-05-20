<template>
  <div>
    <metric-details
      v-if="showDetails"
      :metric="metric"
      :databases="selectedDatabases"
    />
    <Linechart
      :selected-databases="selectedDatabases"
      :data="data"
      :graph-id="graphId || 'queueLength'"
      :chart-configuration="chartConfiguration"
      :max-value="maxValue"
      :timestamps="timestamps"
      :max-chart-width="maxChartWidth"
      :pluginEventData="pluginEventData"
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
  watch,
} from "@vue/composition-api";
import Linechart from "../charts/Linechart.vue";
import {
  MetricProps,
  MetricPropsValidation,
  LineChartComponentData,
} from "../../types/metrics";
import MetricDetails from "../details/MetricDetails.vue";
import { useLineChartComponent } from "../../meta/components";

export default defineComponent({
  name: "QueueLength",
  props: MetricPropsValidation,
  components: { Linechart, MetricDetails },
  setup(props: MetricProps, context: SetupContext): LineChartComponentData {
    return {
      ...useLineChartComponent(props, context),
    };
  },
});
</script>
