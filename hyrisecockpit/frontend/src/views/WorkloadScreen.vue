<template>
  <div>
    <v-progress-linear
      v-if="!$databaseController.databasesUpdated.value"
      indeterminate
      color="primary"
      height="7"
    />
    <div class="mx-12">
      <div class="mt-6 mb-2">
        <b> Workload Monitoring </b>
      </div>
      <v-divider />
      <MetricsTileList
        v-if="$databaseController.databasesUpdated.value"
        :selected-databases="watchedInstances"
        :show-details="false"
        :selected-metrics="workloadMetrics"
      />
    </div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  Ref,
  ref,
  watch
} from "@vue/composition-api";
import { Metric, workloadMetrics } from "../types/metrics";
import MetricsTileList from "../components/container/MetricsTileList.vue";
import { useMetricEvents } from "../meta/events";
import { Database } from "../types/database";

interface Props {}
interface Data {
  workloadMetrics: Metric[];
  watchedInstances: Ref<string[]>;
}

export default defineComponent({
  name: "WorkloadScreen",
  components: {
    MetricsTileList
  },
  setup(props: Props, context: SetupContext): Data {
    const { emitWatchedMetricsChangedEvent } = useMetricEvents();
    const watchedInstances = ref<string[]>([]);
    const { databasesUpdated } = context.root.$databaseController;

    watch(databasesUpdated, () => {
      if (databasesUpdated.value) {
        watchedInstances.value = [
          context.root.$databaseController.availableDatabasesById.value[0]
        ];
      }
    });

    onMounted(() => {
      emitWatchedMetricsChangedEvent(workloadMetrics);
    });

    return {
      watchedInstances,
      workloadMetrics
    };
  }
});
</script>
<style scoped></style>
