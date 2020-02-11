<template>
  <div>
    <div v-if="$databaseService.isReady.value" class="mx-6">
      <v-select
        class="select"
        v-model="watchedInstances"
        :items="$databaseService.databases.value.map(database => database.id)"
        chips
        label="databases"
        multiple
        outlined
        prepend-icon="mdi-database"
      ></v-select>
      <MetricsTileList
        :selected-databases="watchedInstances"
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
import { ScreenData } from "../types/views";
import { Metric, overviewMetrics } from "../types/metrics";
import { useMetricEvents } from "../meta/events";

interface Data extends ScreenData {
  overviewMetrics: Metric[];
}

export default createComponent({
  components: {
    MetricsTileList
  },
  setup(props: {}, context: SetupContext): Data {
    const watchedInstances = ref<string[]>([]);
    const { throwMetricsChangedEvent } = useMetricEvents();

    const { isReady } = context.root.$databaseService;
    onMounted(() => {
      throwMetricsChangedEvent(overviewMetrics);
    });

    watch(isReady, () => {
      if (isReady.value) {
        watchedInstances.value = context.root.$databaseService.databases.value.map(
          database => database.id
        );
      }
    });
    return { watchedInstances, overviewMetrics };
  }
});
</script>
<style scoped>
.select {
  padding-top: 20px;
  width: 33%;
}
</style>
