<template>
  <div id="comparison-page">
    <linear-loader
      :conditions="[$databaseController.databasesUpdated]"
      :evaluations="[false]"
    />
    <div v-if="$databaseController.databasesUpdated.value" class="mx-6">
      <status-warning :selected-databases="selectedDatabases" />
      <database-details-panel
        v-if="selectedDatabases.length"
        :selected-databases="selectedDatabases"
      />
      <warning :condition="selectedDatabases">
        <template #message>
          No databases selected.
        </template>
      </warning>
      <warning :condition="selectedMetrics">
        <template #message>
          No metrics selected.
        </template>
      </warning>
      <metrics-comparison-table
        v-if="selectedDatabases.length"
        :selected-databases="selectedDatabases"
        :selected-metrics="selectedMetrics"
        :show-details="true"
      />
    </div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  watch,
  computed,
  Ref,
  ref,
  onMounted,
} from "@vue/composition-api";
import MetricsComparisonTable from "../components/container/MetricsComparisonTable.vue";
import { Metric, comparisonMetrics } from "../types/metrics";
import { MetricViewData } from "../types/views";
import { Database } from "../types/database";
import { useSelectionHandling } from "@/meta/selection";
import LinearLoader from "../components/alerts/LinearLoader.vue";
import Warning from "@/components/alerts/Warning.vue";
import StatusWarning from "@/components/alerts/StatusWarning.vue";
import DatabaseDetailsPanel from "../components/details/DatabaseDetailsPanel.vue";

export default defineComponent({
  components: {
    MetricsComparisonTable,
    DatabaseDetailsPanel,
    LinearLoader,
    Warning,
    StatusWarning,
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return {
      watchedMetrics: comparisonMetrics,
      ...useSelectionHandling(context, "comparison"),
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
