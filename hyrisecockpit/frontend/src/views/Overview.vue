<template>
  <div>
    <div v-if="$databaseService.isReady.value" class="mx-6">
      <database-metric-selection class="select" :metrics="watchedMetrics" />
      <v-alert v-if="!selectedDatabases.length" class="alert" type="warning">
        No databases selected.
      </v-alert>
      <database-system-details
        v-if="selectedDatabases.length"
        :databases="selectedDatabases"
        :handle-scroll="false"
      />
      <MetricsTileList
        class="list"
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
  defineComponent,
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
import { useSelectionHandling } from "../meta/views";
import DatabaseSystemDetails from "../components/details/DatabaseSystemDetails.vue";
import DatabaseMetricSelection from "../components/selection/DatabaseMetricSelection.vue";

export default defineComponent({
  components: {
    MetricsTileList,
    DatabaseSystemDetails,
    DatabaseMetricSelection
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return {
      watchedMetrics: overviewMetrics,
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
.list {
  margin-top: 1%;
}
</style>
