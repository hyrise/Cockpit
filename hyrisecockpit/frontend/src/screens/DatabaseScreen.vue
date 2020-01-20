<template>
  <div>
    <div class="chart mx-12">
      <div class="metrics">
        <div class="metric-chart">
          <Throughput
            :preselected-database-id="$route.params.id"
            :metric-meta="getMetadata('throughput')"
          />
        </div>
        <div class="metric-chart">
          <Latency
            :preselected-database-id="$route.params.id"
            :metric-meta="getMetadata('throughput')"
          />
        </div>
        <div class="metric-chart">
          <Ram
            :preselected-database-id="$route.params.id"
            :metric-meta="getMetadata('throughput')"
          />
        </div>
        <div class="metric-chart">
          <Cpu
            :preselected-database-id="$route.params.id"
            :metric-meta="getMetadata('cpu')"
          />
        </div>
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
}

export default createComponent({
  name: "DatabaseScreen",
  components: {
    Throughput,
    Storage,
    Cpu,
    Access,
    Latency,
    Ram
  },
  setup(props: {}, context: SetupContext): Data {
    function getMetadata(metric: Metric): MetricMetadata {
      return metricsMetadata[metric];
    }
    return {
      getMetadata
    };
  }
});
</script>
<style scoped>
.metrics {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.metric-chart {
  flex: 1 0 33.33%;
}
</style>
