<template>
  <div id="overview-page" data-id="overview-page">
    <linear-loader
      :conditions="[$databaseController.databasesUpdated]"
      :evaluations="[false]"
    />
    <div v-if="$databaseController.databasesUpdated.value" class="mx-2">
      <status-warning
        :selected-databases="selectedDatabases"
        :selected-metrics="selectedMetrics"
      />
      <database-system-details
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
import { defineComponent, SetupContext } from "@vue/composition-api";
import MetricsTileList from "../components/container/MetricsTileList.vue";
import { MetricViewData } from "../types/views";
import { Metric, overviewMetrics } from "../types/metrics";
import { useSelectionHandling } from "@/meta/selection";
import DatabaseSystemDetails from "../components/details/DatabaseSystemDetails.vue";
import LinearLoader from "../components/alerts/LinearLoader.vue";
import StatusWarning from "@/components/alerts/StatusWarning.vue";

export default defineComponent({
  components: {
    MetricsTileList,
    DatabaseSystemDetails,
    LinearLoader,
    StatusWarning,
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return {
      ...useSelectionHandling(context, "overview"),
    };
  },
});
</script>
