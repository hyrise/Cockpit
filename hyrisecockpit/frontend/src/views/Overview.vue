<template>
  <div>
    <div v-if="$databaseService.isReady.value" class="mx-6">
      <v-select
        class="select"
        v-model="watchedInstances"
        :items="availableInstances"
        chips
        label="databases"
        multiple
        return-object
        outlined
        prepend-icon="mdi-database"
      ></v-select>
      <MetricsTileList
        :selected-databases="watchedInstances.map(database => database.value)"
        :show-details="false"
        :selected-metrics="overviewMetrics"
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
import { useMetricEvents } from "../meta/events";
import { Database } from "../types/database";
import { useDatabaseSelection } from "../meta/views";

interface Data extends MetricViewData {
  overviewMetrics: Metric[];
  availableInstances: Ref<any[]>;
}

export default createComponent({
  components: {
    MetricsTileList
  },
  setup(props: {}, context: SetupContext): Data {
    const { watchedInstances, availableInstances } = useDatabaseSelection(
      context
    );
    const { throwMetricsChangedEvent } = useMetricEvents();

    onMounted(() => {
      throwMetricsChangedEvent(overviewMetrics);
    });

    return { watchedInstances, overviewMetrics, availableInstances };
  }
});
</script>
<style scoped>
.select {
  padding-top: 20px;
  width: 33%;
}
</style>
