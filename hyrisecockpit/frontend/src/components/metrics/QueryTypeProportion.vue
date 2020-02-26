<template>
  <Barchart
    :data="transformedData"
    :graph-id="graphId || 'queryTypeProportion'"
    :chart-configuration="chartConfiguration"
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
  watch
} from "@vue/composition-api";

import * as Plotly from "plotly.js";
import Vue from "vue";
import Barchart from "../charts/Barchart.vue";
import { MetricProps, MetricPropsValidation } from "../../types/metrics";

interface Data {
  transformedData: Ref<any>;
  chartConfiguration: string[];
}

export default defineComponent({
  name: "QueryTypeProportion",
  components: { Barchart },
  props: MetricPropsValidation,
  setup(props: MetricProps, context: SetupContext): Data {
    const { databases } = context.root.$databaseService;
    const data = context.root.$metricController.data[props.metric];
    const transformedData = ref<any>([]);

    const chartConfiguration = [
      "Query Type Proportion",
      "workload",
      "number of queries"
    ];

    watch(data, () => {
      if (Object.keys(data.value).length) {
        transformedData.value = props.metricMeta.transformationService(
          data.value,
          props.selectedDatabases.map(database => database.id)[0]
        );
      }
    });

    return {
      transformedData,
      chartConfiguration
    };
  }
});
</script>
