<template>
  <div>
    <div v-if="$databaseService.isReady.value" class="mx-6">
      <div class="select">
        <v-select
          class="select-box"
          v-model="watchedInstances"
          v-on:input="handleMaxSelected"
          :items="$databaseService.databases.value.map(database => database.id)"
          chips
          label="databases"
          multiple
          counter="4"
          outlined
          prepend-icon="mdi-database"
        ></v-select>
        <v-select
          class="select-box"
          v-model="selectedMetrics"
          v-on:input="handleMetricsChanged"
          :items="availableMetrics"
          chips
          return-object
          label="metrics"
          multiple
          outlined
          prepend-icon="mdi-database"
        ></v-select>
      </div>
      <MetricsComparisonTable
        :selected-databases="watchedInstances"
        :selected-metrics="selectedMetrics.map(metric => metric.value)"
        :show-details="true"
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
  ref,
  onMounted
} from "@vue/composition-api";
import MetricsComparisonTable from "../components/container/MetricsComparisonTable.vue";
import { Metric, comparisonMetrics } from "../types/metrics";
import { getMetricTitle } from "../meta/metrics";
import { ScreenData } from "../types/views";
import { eventBus } from "../plugins/eventBus";

interface Data extends ScreenData {
  handleMaxSelected: () => void;
  handleMetricsChanged: () => void;
  selectedMetrics: Ref<Object[]>;
  availableMetrics: Object[];
}

export default createComponent({
  components: {
    MetricsComparisonTable
  },
  setup(props: {}, context: SetupContext): Data {
    const watchedInstances = ref<string[]>([]);
    const availableMetrics = comparisonMetrics.map(metric => {
      return { text: getMetricTitle(metric), value: metric };
    });
    const selectedMetrics = ref<Object[]>(availableMetrics);
    const { isReady } = context.root.$databaseService;
    watch(isReady, () => {
      if (isReady.value) {
        watchedInstances.value = context.root.$databaseService.databases.value.map(
          database => database.id
        );
      }
    });

    onMounted(() => {
      handleMetricsChanged();
    });

    function handleMaxSelected(): void {
      if (watchedInstances.value.length > 4) {
        watchedInstances.value.pop();
      }
    }
    function handleMetricsChanged(): void {
      eventBus.$emit(
        "METRICS_CHANGED",
        selectedMetrics.value.map((metric: any) => metric.value)
      );
    }

    return {
      watchedInstances,
      handleMaxSelected,
      handleMetricsChanged,
      selectedMetrics,
      availableMetrics
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
  flex: 0 0 48%;
}
</style>
