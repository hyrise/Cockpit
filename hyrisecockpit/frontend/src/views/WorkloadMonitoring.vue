<template>
  <div>
    <linear-loader
      :conditions="[$databaseController.databasesUpdated]"
      :evaluations="[false]"
    />
    <div class="mx-6">
      <database-metric-selection class="select" :metrics="[]" />
      <database-query-tables :selected-databases="selectedDatabases" />
      <unselected-warning :condition="selectedDatabases">
        <template #message>
          No databases selected.
        </template>
      </unselected-warning>
      <v-card color="primary">
        <v-card-title class="white--text">
          Workload metrics
        </v-card-title>
      </v-card>
      <metrics-tile-list
        v-if="$databaseController.databasesUpdated.value"
        :selected-databases="watchedInstances"
        :show-details="false"
        :selected-metrics="watchedMetrics"
      />
    </div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  Ref,
  ref,
  watch
} from "@vue/composition-api";
import { Metric, workloadMetrics } from "../types/metrics";
import MetricsTileList from "../components/container/MetricsTileList.vue";
import { useMetricEvents } from "../meta/events";
import { Database } from "../types/database";
import LinearLoader from "../components/alerts/linearLoader.vue";
import DatabaseQueryTables from "@/components/queries/DatabaseQueryTables.vue";
import DatabaseMetricSelection from "../components/selection/DatabaseMetricSelection.vue";
import { MetricViewData } from "../types/views";
import { useSelectionHandling } from "../meta/views";
import UnselectedWarning from "@/components/alerts/unselectedWarning.vue";

interface Props {}
interface Data extends MetricViewData {
  watchedInstances: Ref<string[]>;
}

export default defineComponent({
  name: "WorkloadMonitoring",
  components: {
    MetricsTileList,
    LinearLoader,
    DatabaseQueryTables,
    DatabaseMetricSelection,
    UnselectedWarning
  },
  setup(props: Props, context: SetupContext): Data {
    const { emitWatchedMetricsChangedEvent } = useMetricEvents();
    const watchedInstances = ref<string[]>([]);
    const { databasesUpdated } = context.root.$databaseController;

    watch(databasesUpdated, () => {
      if (databasesUpdated.value) {
        watchedInstances.value = [
          context.root.$databaseController.availableDatabasesById.value[0]
        ];
      }
    });

    onMounted(() => {
      emitWatchedMetricsChangedEvent(workloadMetrics);
    });

    return {
      watchedInstances,
      watchedMetrics: workloadMetrics,
      ...useSelectionHandling()
    };
  }
});
</script>
<style scoped>
.select {
  margin-top: 0.5%;
  margin-bottom: 0.5%;
}
</style>
