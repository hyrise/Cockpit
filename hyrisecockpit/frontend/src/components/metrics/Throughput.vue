<template>
  <div>
    <metric-details
      v-if="showDetails"
      :data="data"
      :database="selectedDatabases.find(el => true)"
      :border="12000"
      unit="q/sec"
    />
    <Linechart
      :selected-databases="selectedDatabases"
      :data="data"
      graph-id="throughput"
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
  name: "Throughput",
  props: MetricPropsValidation,
  components: { Linechart, MetricDetails },
  setup(props: MetricProps, context: SetupContext): ComparisonMetricData {
    const { checkState, data } = useGenericFetchService(props.metricMeta);

    const chartConfiguration = ["Throughput", "time in sec", "queries per sec"];

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
