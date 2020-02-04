<template>
  <div class="ml-6">
    <MetricsTileList
      :selected-databases="watchedInstances"
      :show-details="true"
      :selected-metrics="overviewMetrics"
    />
    <div class="mt-6 mb-2">
      <component
        v-for="metric in instanceMetrics"
        :key="metric"
        :is="getMetricComponent(metric)"
        :selected-databases="watchedInstances"
        :metric-meta="getMetadata(metric)"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { createComponent, SetupContext, Ref, ref } from "@vue/composition-api";
import MetricsTileList from "../components/container/MetricsTileList.vue";
import { getMetadata, getMetricComponent } from "../meta/metrics";
import {
  Metric,
  MetricMetadata,
  overviewMetrics,
  instanceMetrics
} from "../types/metrics";
import Storage from "../components/metrics/Storage.vue";
import Access from "../components/metrics/Access.vue";
import QueryTypeProportion from "../components/metrics/QueryTypeProportion.vue";

import { ScreenData } from "../types/views";

interface Data extends ScreenData {
  getMetadata: (metric: Metric) => MetricMetadata;
  getMetricComponent: (metric: Metric) => string;
  overviewMetrics: Metric[];
  instanceMetrics: Metric[];
}

export default createComponent({
  components: {
    MetricsTileList,
    Storage,
    Access,
    QueryTypeProportion
  },
  setup(props: {}, context: SetupContext): Data {
    const watchedInstances = ref<string[]>([context.root.$route.params.id]);

    return {
      getMetadata,
      getMetricComponent,
      watchedInstances,
      overviewMetrics,
      instanceMetrics
    };
  }
});
</script>
