<template>
  <div>
    <div class="chart mx-12">
      <div class="metrics">
        <v-card class="metric-chart" v-for="metric in metrics" :key="metric">
          <v-card-title class="metric-title">
            {{ metric }}
          </v-card-title>
          <component
            :is="metric"
            :enable-comparison="false"
            :preselected-database-id="$route.params.id"
            :metric-meta="getMetadata(metric.toLowerCase())"
          />
        </v-card>
      </div>
      <div class="mt-6 mb-2">
        <b> Access frequency Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Access
        :preselected-database-id="$route.params.id"
        :metric-meta="getMetadata('access')"
      />
      <div class="mt-6 mb-2">
        <b> Storage Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Storage
        :preselected-database-id="$route.params.id"
        :metric-meta="getMetadata('storage')"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { createComponent, SetupContext } from "@vue/composition-api";
import Throughput from "../components/metrics/Throughput.vue";
import Storage from "../components/metrics/Storage.vue";
import Cpu from "../components/metrics/Cpu.vue";
import Access from "../components/metrics/Access.vue";
import Latency from "../components/metrics/Latency.vue";
import Ram from "../components/metrics/Ram.vue";
import { metricsMetadata } from "../components/meta/metrics";
import { Metric, MetricMetadata } from "../types/metrics";

interface Data {
  getMetadata: (metric: Metric) => MetricMetadata;
  metrics: string[];
}

export default createComponent({
  components: {
    Throughput,
    Storage,
    Cpu,
    Access,
    Latency,
    Ram
  },
  setup(props: {}, context: SetupContext): Data {
    const metrics = ["Throughput", "Cpu", "Latency", "Ram"];
    function getMetadata(metric: Metric): MetricMetadata {
      return metricsMetadata[metric];
    }
    return {
      getMetadata,
      metrics
    };
  }
});
</script>
<style scoped>
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
.metric-title {
  z-index: 2;
  position: relative;
  margin-bottom: -60px;
  justify-content: center;
}
</style>
