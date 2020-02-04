<template>
  <div class="metrics">
    <v-card
      class="metric-chart"
      v-for="metric in comparisonMetrics"
      :key="metric"
    >
      <v-card-title class="metric-title">
        {{ getMetricTitle(metric) }}
      </v-card-title>
      <component
        class="metric"
        :is="getMetricComponent(metric)"
        :selected-databases="selectedDatabases"
        :metric-meta="getMetadata(metric)"
        :graph-id="metric"
        :show-details="showDetails"
      />
    </v-card>
  </div>
</template>

<script lang="ts">
import { createComponent, SetupContext } from "@vue/composition-api";

import Throughput from "../metrics/Throughput.vue";
import CPU from "../metrics/CPU.vue";
import Latency from "../metrics/Latency.vue";
import RAM from "../metrics/RAM.vue";
import QueueLength from "../metrics/QueueLength.vue";
import {
  getMetadata,
  getMetricTitle,
  getMetricComponent
} from "../meta/metrics";
import { Metric, MetricMetadata, comparisonMetrics } from "../../types/metrics";
import { ContainerProps, ContainerPropsValidation } from "../../types/screens";

interface Data {
  getMetadata: (metric: Metric) => MetricMetadata;
  getMetricTitle: (metric: Metric) => string;
  getMetricComponent: (metric: Metric) => string;
  comparisonMetrics: Metric[];
}

export default createComponent({
  components: {
    Throughput,
    CPU,
    Latency,
    RAM,
    QueueLength
  },
  props: ContainerPropsValidation,
  setup(props: ContainerProps, context: SetupContext): Data {
    return {
      getMetadata,
      comparisonMetrics,
      getMetricTitle,
      getMetricComponent
    };
  }
});
</script>
<style scoped>
.metric {
  margin-top: -20px;
}
.metrics {
  margin-top: 6px;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.metric-chart {
  flex: 0 0 32.5%;
  margin: 0px 3px 6px 3px;
  padding: 0px;
}
@media (min-width: 2000px) {
  .metric-chart {
    flex: 0 0 24%;
    margin: 0px 3px 6px 3px;
    padding: 0px;
  }
}
.metric-title {
  z-index: 2;
  position: relative;
  margin-bottom: -60px;
  justify-content: center;
}
</style>
