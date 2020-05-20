<template>
  <Barchart
    :data="data"
    :graph-id="graphId || 'operatorProportion'"
    :chart-configuration="chartConfiguration"
    :selected-databases="selectedDatabases"
    :max-chart-width="maxChartWidth"
  />
</template>

<script lang="ts">
import { defineComponent, SetupContext } from "@vue/composition-api";
import Barchart from "@/components/charts/Barchart.vue";
import {
  MetricProps,
  MetricPropsValidation,
  BasicChartComponentData,
} from "@/types/metrics";
import { useModifiedChartData } from "@/meta/components";

export default defineComponent({
  name: "OperatorProportion",
  components: { Barchart },
  props: MetricPropsValidation,
  setup(
    props: MetricProps,
    context: SetupContext
  ): BasicChartComponentData<any> {
    return {
      ...useModifiedChartData(props, context),
    };
  },
});
</script>
