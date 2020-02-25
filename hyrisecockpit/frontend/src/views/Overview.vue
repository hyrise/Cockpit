<template>
  <div>
    <div v-if="$databaseService.isReady.value" class="mx-6">
      <database-metric-selection :metrics="watchedMetrics" />
      <v-alert v-if="!selectedDatabases.length" class="alert" type="warning">
        No databases selected.
      </v-alert>
      <database-system-details
        v-if="selectedDatabases.length"
        :databases="selectedDatabases"
        :handle-scroll="false"
      />
      <MetricsTileList
        :selected-databases="selectedDatabases"
        :show-details="false"
        :selected-metrics="selectedMetrics"
      />
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
  onMounted,
  ref
} from "@vue/composition-api";
import MetricsTileList from "../components/container/MetricsTileList.vue";
import { MetricViewData } from "../types/views";
import { Metric, overviewMetrics } from "../types/metrics";
import { Database } from "../types/database";
import { useSelection } from "../meta/views";
import DatabaseSystemDetails from "../components/details/DatabaseSystemDetails.vue";
import DatabaseMetricSelection from "../components/selection/DatabaseMetricSelection.vue";

export default createComponent({
  components: {
    MetricsTileList,
    DatabaseSystemDetails,
    DatabaseMetricSelection
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return { watchedMetrics: overviewMetrics, ...useSelection(context) };
  }
});
</script>
<style scoped>
.select {
  padding-top: 20px;
  width: 33%;
}
</style>
