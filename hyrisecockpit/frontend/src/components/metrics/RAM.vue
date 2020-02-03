<template>
  <div>
    <metric-details
      v-if="showDetails"
      :data="data"
      :databases="selectedDatabases"
      :border="100"
      state-order="asc"
      unit="%"
    />
    <Linechart
      :selected-databases="selectedDatabases"
      :data="data"
      :graph-id="graphId || 'ram'"
      :chart-configuration="chartConfiguration"
    />
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

import { useGenericFetchService } from "../../services/genericFetchService";
import { Database } from "../../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";
import Linechart from "../charts/Linechart.vue";
import {
  MetricProps,
  MetricPropsValidation,
  ComparisonMetricData
} from "../../types/metrics";
import MetricDetails from "../details/MetricDetails.vue";

export default createComponent({
  name: "RAM",
  props: MetricPropsValidation,
  components: { Linechart, MetricDetails },
  setup(props: MetricProps, context: SetupContext): ComparisonMetricData {
    const { checkState, data } = useGenericFetchService(props.metricMeta);

    const chartConfiguration = ["RAM", "time in sec", "memory usage in %"];

    onMounted(() => {
      setInterval(checkState, 1000);
    });

    return {
      data,
      chartConfiguration
    };
  }
});
</script>
