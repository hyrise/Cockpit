<template>
  <div>
    <div v-if="$databaseController.databasesUpdated.value" class="ml-6">
      <MetricsTileList
        :selected-databases="watchedInstances"
        :show-details="true"
        :selected-metrics="overviewMetrics"
      />
      <component
        v-for="metric in instanceMetrics"
        class="instance"
        :key="metric"
        :metric="metric"
        :is="getMetricComponent(metric)"
        :selected-databases="watchedInstances"
        :metric-meta="getMetricMetadata(metric)"
      />
    </div>
    <linear-loader
      :conditions="[$databaseController.databasesUpdated]"
      :evaluations="[false]"
    />
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  onMounted
} from "@vue/composition-api";
import MetricsTileList from "../components/container/MetricsTileList.vue";
import { getMetricMetadata, getMetricComponent } from "../meta/metrics";
import {
  Metric,
  MetricMetadata,
  overviewMetrics,
  instanceMetrics
} from "../types/metrics";
import Storage from "../components/metrics/Storage.vue";
import Access from "../components/metrics/Access.vue";
import QueryTypeProportion from "../components/metrics/QueryTypeProportion.vue";
import { useMetricEvents } from "../meta/events";
import { Database } from "../types/database";
import LinearLoader from "../components/loading/linearLoader.vue";

interface Data {
  getMetricMetadata: (metric: Metric) => MetricMetadata;
  getMetricComponent: (metric: Metric) => string;
  overviewMetrics: Metric[];
  instanceMetrics: Metric[];
  watchedInstances: Ref<string[]>;
}

export default defineComponent({
  components: {
    MetricsTileList,
    Storage,
    Access,
    QueryTypeProportion,
    LinearLoader
  },
  setup(props: {}, context: SetupContext): Data {
    const { emitWatchedMetricsChangedEvent } = useMetricEvents();
    onMounted(() => {
      emitWatchedMetricsChangedEvent(instanceMetrics.concat(overviewMetrics));
    });

    return {
      getMetricMetadata,
      getMetricComponent,
      watchedInstances: ref([context.root.$route.params.id]),
      overviewMetrics,
      instanceMetrics
    };
  }
});
</script>
<style scoped>
.instance {
  margin-top: 1%;
}
</style>
