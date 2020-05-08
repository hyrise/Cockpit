<template>
  <div id="comparison-page">
    <linear-loader
      :conditions="[$databaseController.databasesUpdated]"
      :evaluations="[false]"
    />
    <div v-if="$databaseController.databasesUpdated.value" class="mx-2">
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
      <database-system-details :selected-databases="selectedDatabases" />
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
import UnselectedWarning from "@/components/alerts/UnselectedWarning.vue";
import DatabaseSystemDetails from "../components/details/DatabaseSystemDetails.vue";

export default defineComponent({
  components: {
    MetricsComparisonTable,
    LinearLoader,
    UnselectedWarning,
    DatabaseSystemDetails,
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return {
      watchedMetrics: comparisonMetrics,
      ...useSelectionHandling(context, "comparison"),
    };
  },
});
</script>
