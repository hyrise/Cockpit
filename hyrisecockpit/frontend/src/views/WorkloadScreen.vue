<template>
  <div>
    <v-progress-linear
      v-if="!$databaseService.isReady.value"
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
        v-if="$databaseService.isReady.value"
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
  watchedInstances: Ref<Database[]>;
}

export default defineComponent({
  name: "WorkloadScreen",
  components: {
    MetricsTileList
  },
  setup(props: Props, context: SetupContext): Data {
    const { emitWatchedMetricsChangedEvent } = useMetricEvents();
    const watchedInstances = ref<Database[]>([]);

    const { isReady } = context.root.$databaseService;
    watch(isReady, () => {
      if (isReady.value) {
        watchedInstances.value = [
          context.root.$databaseService.databases.value[0]
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
