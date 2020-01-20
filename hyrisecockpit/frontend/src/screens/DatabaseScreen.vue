<template>
  <div>
    <div class="chart mx-12">
      <div class="mt-6 mb-2">
        <b> Throughput Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Throughput
        :preselected-database-id="$route.params.id"
        :metric-meta="getMetadata('throughput')"
      />
      <div class="mt-6 mb-2">
        <b> CPU Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Cpu
        :preselected-database-id="$route.params.id"
        :metric-meta="getMetadata('cpu')"
      />
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
    Access
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
.chart {
  max-width: 1800px;
  max-height: 1000px;
}
</style>
