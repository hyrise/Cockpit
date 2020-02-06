<template>
  <Barchart
    :data="transformedData"
    :graph-id="graphId || 'queryTypeProportion'"
    :chart-configuration="chartConfiguration"
  />
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

import { useGenericFetchService } from "../../services/genericFetchService";
import * as Plotly from "plotly.js";
import Vue from "vue";
import Barchart from "../charts/Barchart.vue";
import { MetricProps, MetricPropsValidation } from "../../types/metrics";

interface Data {
  transformedData: Ref<any>;
  chartConfiguration: string[];
}

export default createComponent({
  name: "QueryTypeProportion",
  components: { Barchart },
  props: MetricPropsValidation,
  setup(props: MetricProps, context: SetupContext): Data {
    const { databases } = context.root.$databaseData;
    const data = context.root.$metricController.data[props.metric];
    const transformedData = ref<any>([]);

    const chartConfiguration = [
      "Query Type Proportion",
      "workload",
      "amount of queries"
    ];

    watch(data, () => {
      if (Object.keys(data.value).length) {
        transformedData.value = props.metricMeta.transformationService(
          data.value,
          props.selectedDatabases[0]
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
