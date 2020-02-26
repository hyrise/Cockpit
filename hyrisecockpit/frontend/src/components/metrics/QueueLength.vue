<template>
  <div>
    <metric-details
      v-if="showDetails"
      :data="data"
      :databases="selectedDatabases"
      :border="1000000"
      state-order="asc"
      unit="q"
    />
    <Linechart
      :selected-databases="selectedDatabases"
      :data="data"
      :graph-id="graphId || 'queueLength'"
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

import Linechart from "../charts/Linechart.vue";
import {
  MetricProps,
  MetricPropsValidation,
  ComparisonMetricData
} from "../../types/metrics";
import MetricDetails from "../details/MetricDetails.vue";

export default createComponent({
  name: "QueueLength",
  props: MetricPropsValidation,
  components: { Linechart, MetricDetails },
  setup(props: MetricProps, context: SetupContext): ComparisonMetricData {
    const data = context.root.$metricController.data[props.metric];

    const chartConfiguration = [
      "Queue Length",
      "time in sec",
      "number of queries"
    ];

    return {
      data,
      chartConfiguration
    };
  }
});
</script>
