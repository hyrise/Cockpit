<template>
  <div id="workload-monitoring-page">
    <linear-loader :conditions="[$databaseController.databasesUpdated]" :evaluations="[false]" />
    <div class="mx-6">
      <database-query-tables :selected-databases="selectedDatabases" />
      <unselected-warning :condition="selectedDatabases">
        <template #message>No databases selected.</template>
      </unselected-warning>
      <v-card color="primary">
        <v-card-title class="white--text">Workload Metrics</v-card-title>
      </v-card>
      <v-container
        v-if="$databaseController.databasesUpdated.value"
        class="grey lighten-5 flex"
        fluid
        justify="center"
        align="center"
      >
        <metric-tile
          v-for="metric in selectedMetrics"
          :key="metric"
          class="flex-item"
          :metric="metric"
          :selected-databases="watchedInstances"
          :show-details="false"
          :graph-id="metric"
        />
      </v-container>
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
  watch,
} from "@vue/composition-api";
import { Metric, workloadMetrics } from "../types/metrics";
import { Database } from "../types/database";
import LinearLoader from "../components/alerts/LinearLoader.vue";
import DatabaseQueryTables from "@/components/queries/DatabaseQueryTables.vue";
import { MetricViewData } from "../types/views";
import { useSelectionHandling } from "@/meta/selection";
import UnselectedWarning from "@/components/alerts/UnselectedWarning.vue";
import MetricTile from "@/components/container/MetricTile.vue";
import SelectionList from "@/components/selection/SelectionList.vue";

interface Props {}
interface Data extends MetricViewData {
  watchedInstances: Ref<string[]>;
}

export default defineComponent({
  name: "WorkloadMonitoring",
  components: {
    MetricTile,
    LinearLoader,
    DatabaseQueryTables,
    UnselectedWarning,
    SelectionList,
  },
  setup(props: Props, context: SetupContext): Data {
    const watchedInstances = ref<string[]>([]);
    const { databasesUpdated } = context.root.$databaseController;

    watch(databasesUpdated, () => {
      if (databasesUpdated.value) {
        watchedInstances.value = [
          context.root.$databaseController.availableDatabasesById.value[0],
        ];
      }
    });

    return {
      watchedInstances,
      watchedMetrics: workloadMetrics,
      ...useSelectionHandling(context, "workload"),
    };
  },
});
</script>
<style scoped>
.select {
  margin-top: 0.5%;
  margin-bottom: 0.5%;
}
.flex {
  margin-top: 6px;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.flex-item {
  flex: 0 0 49%;
  margin: 5px 0.5% 5px 0.5%;
}
</style>
