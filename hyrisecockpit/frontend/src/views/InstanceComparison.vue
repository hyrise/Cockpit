<template>
  <div>
    <div v-if="$databaseService.isReady.value" class="mx-6">
      <database-metric-selection class="select" :metrics="watchedMetrics" />
      <MetricsComparisonTable
        v-if="selectedDatabases.length"
        :selected-databases="selectedDatabases"
        :selected-metrics="selectedMetrics"
        :show-details="true"
      />
      <v-alert v-if="!selectedDatabases.length" class="alert" type="warning">
        No databases selected.
      </v-alert>
      <v-alert v-if="!selectedMetrics.length" class="alert" type="warning">
        No metrics selected.
      </v-alert>
    </div>
    <v-progress-linear v-else indeterminate color="primary" height="7" />
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
import DatabaseMetricSelection from "../components/selection/DatabaseMetricSelection.vue";
import { Metric, comparisonMetrics } from "../types/metrics";
import { MetricViewData } from "../types/views";
import { Database } from "../types/database";
import { useSelectionHandling } from "../meta/views";

export default defineComponent({
  components: {
    MetricsComparisonTable,
    DatabaseMetricSelection
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return {
      watchedMetrics: comparisonMetrics,
      ...useSelectionHandling(context)
    };
  }
});
</script>
<style scoped>
.select {
  margin-top: 0.5%;
  margin-bottom: 0.5%;
}
.alert {
  margin-top: 1%;
}
</style>
