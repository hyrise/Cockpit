<template>
  <div>
    <div v-if="$databaseService.isReady.value" class="mx-6">
      <div class="select">
        <v-select
          class="select-box"
          v-model="watchedInstances"
          v-on:input="handleMaxSelected"
          :items="availableInstances"
          chips
          label="databases"
          multiple
          counter="4"
          outlined
          return-object
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
        <v-btn
          class="ml-4"
          color="primary"
          fab
          large
          :disabled="!selectedMetrics.length"
          @click="resetMetricSelection()"
        >
          <v-icon>mdi-close-circle</v-icon>
        </v-btn>
      </div>

      <MetricsComparisonTable
        v-if="watchedInstances.length"
        :selected-databases="watchedInstances.map(database => database.value)"
        :selected-metrics="selectedMetrics.map(metric => metric.value)"
        :show-details="true"
      />
      <v-alert v-if="!watchedInstances.length" class="alert" type="warning">
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
import { Metric, comparisonMetrics } from "../types/metrics";
import { getMetricTitle } from "../meta/metrics";
import { MetricViewData } from "../types/views";
import { Database } from "../types/database";
import { useMetricEvents } from "../meta/events";
import { useDatabaseSelection } from "../meta/views";

interface Data extends MetricViewData {
  handleMaxSelected: () => void;
  handleMetricsChanged: () => void;
  resetMetricSelection: () => void;
  selectedMetrics: Ref<Object[]>;
  availableMetrics: Object[];
  availableInstances: Ref<any[]>;
}

export default createComponent({
  components: {
    MetricsComparisonTable
  },
  setup(props: {}, context: SetupContext): Data {
    const { throwMetricsChangedEvent } = useMetricEvents();
    const { watchedInstances, availableInstances } = useDatabaseSelection(
      context
    );

    const availableMetrics = comparisonMetrics.map(metric => {
      return { text: getMetricTitle(metric), value: metric };
    });
    const selectedMetrics = ref<Object[]>(availableMetrics);

    onMounted(() => {
      handleMetricsChanged();
    });

    function handleMaxSelected(): void {
      if (watchedInstances.value.length > 4) {
        watchedInstances.value.pop();
      }
    }
    function handleMetricsChanged(): void {
      throwMetricsChangedEvent(
        selectedMetrics.value.map((metric: any) => metric.value)
      );
    }

    function resetMetricSelection(): void {
      selectedMetrics.value = [];
    }

    return {
      watchedInstances,
      availableInstances,
      handleMaxSelected,
      handleMetricsChanged,
      resetMetricSelection,
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
  flex: 0 0 42%;
}
.alert {
  margin-top: 1%;
}
</style>
