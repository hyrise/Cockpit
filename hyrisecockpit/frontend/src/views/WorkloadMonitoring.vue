<template>
  <div id="workload-monitoring-page" data-id="workload-monitoring-page">
    <linear-loader
      :conditions="[$databaseController.databasesUpdated]"
      :evaluations="[false]"
    />
    <div class="mx-6">
      <status-warning
        :selected-databases="selectedDatabases"
        :selected-metrics="selectedMetrics"
      />
      <database-query-tables :selected-databases="selectedDatabases" />
      <metrics-comparison-table
        v-if="selectedDatabases.length"
        :selected-databases="selectedDatabases"
        :selected-metrics="selectedMetrics"
        :show-details="false"
        :show-header="true"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, SetupContext } from "@vue/composition-api";
import { Metric, workloadMetrics } from "../types/metrics";
import { Database } from "../types/database";
import LinearLoader from "../components/alerts/LinearLoader.vue";
import DatabaseQueryTables from "@/components/queries/DatabaseQueryTables.vue";
import { MetricViewData } from "../types/views";
import { useSelectionHandling } from "@/meta/selection";
import StatusWarning from "@/components/alerts/StatusWarning.vue";
import SelectionList from "@/components/selection/SelectionList.vue";
import MetricsComparisonTable from "@/components/container/MetricsComparisonTable.vue";

export default defineComponent({
  name: "WorkloadMonitoring",
  components: {
    LinearLoader,
    DatabaseQueryTables,
    StatusWarning,
    SelectionList,
    MetricsComparisonTable,
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return {
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
