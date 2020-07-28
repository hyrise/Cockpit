<template>
  <div id="workload-monitoring-page" data-id="workload-monitoring-page">
    <linear-loader
      :conditions="[$databaseController.databasesUpdated]"
      :evaluations="[false]"
    />
    <div class="mx-2">
      <status-warning
        :selected-databases="selectedDatabases"
        :selected-metrics="selectedMetrics"
      />
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
import { MetricViewData } from "../types/views";
import { useSelectionHandling } from "@/meta/selection";
import StatusWarning from "@/components/alerts/StatusWarning.vue";
import SelectionList from "@/components/selection/SelectionList.vue";
import MetricsComparisonTable from "@/components/container/MetricsComparisonTable.vue";

export default defineComponent({
  name: "WorkloadMonitoring",
  components: {
    LinearLoader,
    StatusWarning,
    SelectionList,
    MetricsComparisonTable,
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return {
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
</style>
