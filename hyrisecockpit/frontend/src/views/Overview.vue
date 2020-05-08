<template>
  <div id="overview-page">
    <linear-loader
      :conditions="[$databaseController.databasesUpdated]"
      :evaluations="[false]"
    />
    <div v-if="$databaseController.databasesUpdated.value" class="mx-2">
      <status-warning
        :selected-databases="selectedDatabases"
        :selected-metrics="selectedMetrics"
      />
      <database-details-panel
        v-if="selectedDatabases.length"
        :selected-databases="selectedDatabases"
      />
      <metrics-tile-list
        v-if="selectedDatabases.length"
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
  ref,
} from "@vue/composition-api";
import MetricsTileList from "../components/container/MetricsTileList.vue";
import { MetricViewData } from "../types/views";
import { Metric, overviewMetrics } from "../types/metrics";
import { useSelectionHandling } from "@/meta/selection";
import DatabaseDetailsPanel from "../components/details/DatabaseDetailsPanel.vue";
import LinearLoader from "../components/alerts/LinearLoader.vue";
import StatusWarning from "@/components/alerts/StatusWarning.vue";

export default defineComponent({
  components: {
    MetricsTileList,
    DatabaseDetailsPanel,
    LinearLoader,
    StatusWarning,
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return {
      watchedMetrics: overviewMetrics,
      ...useSelectionHandling(context, "overview"),
    };
  },
});
</script>
