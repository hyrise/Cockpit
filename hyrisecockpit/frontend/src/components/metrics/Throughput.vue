<template>
  <div>
    <metric-details
      v-if="showDetails"
      :metric="metric"
      :databases="selectedDatabases"
      :total-number-of-databases="totalNumberOfDatabases"
    />
    <Linechart
      :selected-databases="selectedDatabases"
      :data="data"
      :graph-id="graphId || 'throughput'"
      :chart-configuration="chartConfiguration"
      :max-value="maxValue"
      :timestamps="timestamps"
      :max-chart-width="maxChartWidth"
      :pluginEventData="pluginEventData"
    />
  </div>
</template>

<script lang="ts">
import { defineComponent, SetupContext } from "@vue/composition-api";
import Linechart from "@/components/charts/Linechart.vue";
import {
  MetricProps,
  MetricPropsValidation,
  LineChartComponentData,
} from "@/types/metrics";
import MetricDetails from "@/components/details/MetricDetails.vue";
import { useLineChartComponent } from "@/meta/components";

export default defineComponent({
  name: "Throughput",
  props: MetricPropsValidation,
  components: { Linechart, MetricDetails },
  setup(props: MetricProps, context: SetupContext): LineChartComponentData {
    return {
      ...useLineChartComponent(props, context),
    };
  },
});
</script>
