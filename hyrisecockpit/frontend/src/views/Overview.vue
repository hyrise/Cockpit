<template>
  <div>
    <div v-if="$databaseService.isReady.value" class="mx-6">
      <v-select
        class="select"
        v-model="watchedInstances"
        :items="availableInstances"
        :error="!watchedInstances.length"
        chips
        label="databases"
        multiple
        clearable
        deletable-chips
        return-object
        outlined
        prepend-icon="mdi-database"
      ></v-select>
      <v-alert v-if="!watchedInstances.length" class="alert" type="warning">
        No databases selected.
      </v-alert>
      <database-system-details
        v-if="watchedInstances.length"
        :databases="watchedInstances.map(database => database.value)"
      />
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
import DatabaseSystemDetails from "../components/details/DatabaseSystemDetails.vue";

interface Data extends MetricViewData {
  overviewMetrics: Metric[];
  availableInstances: Ref<any[]>;
}

export default createComponent({
  components: {
    MetricsTileList,
    DatabaseSystemDetails
  },
  setup(props: {}, context: SetupContext): Data {
    const { watchedInstances, availableInstances } = useDatabaseSelection(
      context
    );
    const { emitMetricsChangedEvent } = useMetricEvents();

    onMounted(() => {
      emitMetricsChangedEvent(overviewMetrics);
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
