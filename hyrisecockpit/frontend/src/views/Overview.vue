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
  ref
} from "@vue/composition-api";
import MetricsTileList from "../components/container/MetricsTileList.vue";
import { MetricViewData } from "../types/views";
import { Metric, overviewMetrics } from "../types/metrics";
import { useSelectionHandling } from "@/meta/selection";
import DatabaseDetailsPanel from "../components/details/DatabaseDetailsPanel.vue";
import LinearLoader from "../components/alerts/LinearLoader.vue";
import UnselectedWarning from "@/components/alerts/UnselectedWarning.vue";

export default defineComponent({
  components: {
    MetricsTileList,
    DatabaseDetailsPanel,
    LinearLoader,
    UnselectedWarning
  },
  setup(props: {}, context: SetupContext): MetricViewData {
    return {
      watchedMetrics: overviewMetrics,
      ...useSelectionHandling(context, "overview")
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
