<template>
  <div class="ml-6">
    <MetricsTileList :selected-databases="$route.params.id" />
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
</template>

<script lang="ts">
import { createComponent, SetupContext } from "@vue/composition-api";
import MetricsTileList from "../components/MetricsTileList.vue";
import { metricsMetadata } from "../components/meta/metrics";
import { Metric, MetricMetadata } from "../types/metrics";
import Storage from "../components/metrics/Storage.vue";
import Access from "../components/metrics/Access.vue";

interface Data {
  getMetadata: (metric: Metric) => MetricMetadata;
}

export default createComponent({
  components: {
    MetricsTileList,
    Storage,
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
