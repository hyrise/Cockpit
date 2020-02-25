<template>
  <div>
    <div v-if="$databaseService.isReady.value" class="mx-6">
      <database-metric-selection :metrics="watchedMetrics" />
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
  createComponent,
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
import { useSelection } from "../meta/views";

export default createComponent({
  components: {
    MetricsComparisonTable,
    DatabaseMetricSelection
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return {
      watchedMetrics: comparisonMetrics,
      ...useSelection(context)
    };
  }
});
</script>
<style scoped>
.select {
  display: flex;
  flex-direction: row;
  margin-top: 2%;
  margin-bottom: 1%;
}
.select-box {
  margin: 0px 20px 10px 20px;
  flex: 0 0 42%;
}
.alert {
  margin-top: 1%;
}
</style>
