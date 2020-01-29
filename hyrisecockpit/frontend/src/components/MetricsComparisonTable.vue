<template>
  <div class="metrics-table">
    <div
      class="metrics-column"
      v-for="database in selectedDatabases"
      :key="database"
    >
      {{ database }}
      <v-card v-for="metric in comparisonMetrics" :key="metric">
        <v-card-title class="metric-title">
          {{ metric }}
        </v-card-title>
        <component
          class="metric"
          :is="metric"
          :selected-databases="[database]"
          :metric-meta="getMetadata(metric.toLowerCase())"
          :graph-id="`${metric}-${database}`"
        />
      </v-card>
    </div>
  </div>
</template>

<script lang="ts">
import { createComponent, SetupContext } from "@vue/composition-api";
import Throughput from "./metrics/Throughput.vue";
import CPU from "./metrics/CPU.vue";
import Latency from "./metrics/Latency.vue";
import RAM from "./metrics/RAM.vue";
import { getMetadata } from "./meta/metrics";
import { Metric, MetricMetadata, comparisonMetrics } from "../types/metrics";

interface Data {
  getMetadata: (metric: Metric) => MetricMetadata;
  comparisonMetrics: string[];
}

interface Props {
  selectedDatabases: string[];
}

export default createComponent({
  components: {
    Throughput,
    CPU,
    Latency,
    RAM
  },
  props: {
    selectedDatabases: {
      type: Array,
      default: null
    }
  },
  setup(props: {}, context: SetupContext): Data {
    return {
      getMetadata,
      comparisonMetrics
    };
  }
});
</script>
<style scoped>
.metrics-table {
  margin-top: 6px;
  display: flex;
  flex-direction: row;
}
.metrics-column {
  margin-top: 6px;
  flex: 0 1 auto;
  display: flex;
  flex-direction: column;
}
.metric-title {
  z-index: 2;
  position: relative;
  margin-bottom: -60px;
  justify-content: center;
}
</style>
