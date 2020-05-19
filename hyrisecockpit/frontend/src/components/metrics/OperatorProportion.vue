<template>
  <Barchart
    :data="transformedData"
    :graph-id="graphId || 'operatorProportion'"
    :chart-configuration="chartConfiguration"
    :selected-databases="selectedDatabases"
    :max-chart-width="maxChartWidth"
  />
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
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
  name: "OperatorProportion",
  components: { Barchart },
  props: MetricPropsValidation,
  setup(props: MetricProps, context: SetupContext): Data {
    const data = context.root.$metricController.data[props.metric];
    console.log(data);
    const transformedData = ref<any>([]);
    const metricMeta = getMetricMetadata(props.metric);

    watch(
      () => data.value,
      () => {
        if (Object.keys(data.value).length) {
          transformedData.value = metricMeta.transformationService(
            data.value,
            props.selectedDatabases[0]
          );
        }
      }
    );

    return {
      transformedData,
      chartConfiguration: getMetricChartConfiguration(props.metric),
    };
  },
});
</script>
