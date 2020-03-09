<template>
  <div>
    <linear-loader
      :conditions="[$databaseController.databasesUpdated]"
      :evaluations="[false]"
    />
    <div v-if="$databaseController.databasesUpdated.value" class="mx-6">
      <database-metric-selection class="select" :metrics="watchedMetrics" />
      <v-alert v-if="!selectedDatabases.length" class="alert" type="warning">
        No databases selected.
      </v-alert>
      <database-details-panel
        v-if="selectedDatabases.length"
        :selected-databases="selectedDatabases"
        :handle-scroll="false"
      />
      <MetricsTileList
        class="list"
        :selected-databases="selectedDatabases"
        :show-details="false"
        :selected-metrics="selectedMetrics"
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
  onMounted,
  ref
} from "@vue/composition-api";
import MetricsTileList from "../components/container/MetricsTileList.vue";
import { MetricViewData } from "../types/views";
import { Metric, overviewMetrics } from "../types/metrics";
import { useSelectionHandling } from "../meta/views";
import DatabaseDetailsPanel from "../components/details/DatabaseDetailsPanel.vue";
import DatabaseMetricSelection from "../components/selection/DatabaseMetricSelection.vue";
import LinearLoader from "../components/loading/linearLoader.vue";

export default defineComponent({
  components: {
    MetricsTileList,
    DatabaseDetailsPanel,
    DatabaseMetricSelection,
    LinearLoader
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return {
      watchedMetrics: overviewMetrics,
      ...useSelectionHandling()
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
