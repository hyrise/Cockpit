<template>
  <Barchart
    :data="transformedData"
    :graph-id="graphId || 'queryTypeProportion'"
    :chart-configuration="chartConfiguration"
    :selected-databases="selectedDatabases"
    :max-chart-width="maxChartWidth"
    class="query-type-chart"
  />
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
import Barchart from "../charts/Barchart.vue";
import {
  MetricProps,
  MetricPropsValidation,
  ChartConfiguration,
} from "../../types/metrics";
import {
  getMetricChartConfiguration,
  getMetricMetadata,
} from "../../meta/metrics";

interface Data {
  transformedData: Ref<any>;
  chartConfiguration: ChartConfiguration;
}

export default defineComponent({
  name: "QueryTypeProportion",
  components: { Barchart },
  props: MetricPropsValidation,
  setup(props: MetricProps, context: SetupContext): Data {
    const data = context.root.$metricController.data[props.metric];
    const transformedData = ref<any>([]);
    const metricMeta = getMetricMetadata(props.metric);

    watch(data, () => {
      if (Object.keys(data.value).length) {
        transformedData.value = metricMeta.transformationService(
          data.value,
          props.selectedDatabases[0]
        );
      }
    });

    return {
      transformedData,
      chartConfiguration: getMetricChartConfiguration(props.metric),
    };
  },
});
</script>
<style scoped>
.query-type-chart {
  margin-top: -40px;
}
</style>
