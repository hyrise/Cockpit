<template>
  <div>
    <linear-loader
      :conditions="[$databaseController.databasesUpdated]"
      :evaluations="[false]"
    />
    <div v-if="$databaseController.databasesUpdated.value" class="mx-6">
      <database-details-panel
        v-if="selectedDatabases.length"
        :selected-databases="selectedDatabases"
      />
      <unselected-warning :condition="selectedDatabases">
        <template #message>
          No databases selected.
        </template>
      </unselected-warning>
      <unselected-warning :condition="selectedMetrics">
        <template #message>
          No metrics selected.
        </template>
      </unselected-warning>
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
  onMounted
} from "@vue/composition-api";
import MetricsComparisonTable from "../components/container/MetricsComparisonTable.vue";
import { Metric, comparisonMetrics } from "../types/metrics";
import { MetricViewData } from "../types/views";
import { Database } from "../types/database";
import { useSelectionHandling } from "@/meta/selection";
import LinearLoader from "../components/alerts/linearLoader.vue";
import UnselectedWarning from "@/components/alerts/unselectedWarning.vue";
import DatabaseDetailsPanel from "../components/details/DatabaseDetailsPanel.vue";

export default defineComponent({
  components: {
    MetricsComparisonTable,
    DatabaseDetailsPanel,
    LinearLoader,
    UnselectedWarning
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return {
      watchedMetrics: comparisonMetrics,
      ...useSelectionHandling(context, "comparison")
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
