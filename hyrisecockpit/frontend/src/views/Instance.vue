<template>
  <div>
    <div v-if="$databaseService.isReady.value" class="ml-6">
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
        :metric-meta="getMetadata(metric)"
      />
    </div>
    <v-progress-linear v-else indeterminate color="primary" height="7" />
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
import { useMetricEvents } from "../meta/events";
import { Database } from "../types/database";

interface Data {
  getMetadata: (metric: Metric) => MetricMetadata;
  getMetricComponent: (metric: Metric) => string;
  overviewMetrics: Metric[];
  instanceMetrics: Metric[];
  watchedInstances: Ref<Database[]>;
}

export default defineComponent({
  components: {
    MetricsTileList,
    Storage,
    Access,
    QueryTypeProportion
  },
  setup(props: {}, context: SetupContext): Data {
    const watchedInstances = ref<Database[]>([
      getDatabaseById(context.root.$route.params.id)
    ]);
    const { emitWatchedMetricsChangedEvent } = useMetricEvents();
    onMounted(() => {
      emitWatchedMetricsChangedEvent(instanceMetrics.concat(overviewMetrics));
    });

    function getDatabaseById(id: string): Database | undefined {
      return context.root.$databaseService.databases.value.find(
        database => database.id === id
      );
    }

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
<style scoped>
.instance {
  margin-top: 1%;
}
</style>
