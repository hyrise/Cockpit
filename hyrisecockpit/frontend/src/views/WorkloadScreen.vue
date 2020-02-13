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
        <b> Workload Generation </b>
      </div>
      <v-divider />
      <v-col cols="12">
        <div class="mb-2 mt-2">
          <b> Start workload </b>
        </div>
        <p>Frequency is: {{ frequency }}</p>
        <v-slider v-model="frequency" thumb-label="always" min="1" max="500">
        </v-slider>
        <v-btn-toggle>
          <v-btn
            v-for="workload in availableWorkloads"
            :key="workload"
            @click="startWorkload(workload, frequency)"
            color="success"
          >
            {{ getDisplayedWorkload(workload) }}
          </v-btn>
        </v-btn-toggle>
        <div class="mb-2 mt-6">
          <b> Stop workload </b>
        </div>
        <v-btn @click="stopWorkload()" large color="error">Stop </v-btn>
        <div class="mb-2 mt-6">
          <b> Load generated data into instances</b>
        </div>
        <v-btn-toggle>
          <v-btn
            v-for="workload in availableWorkloads"
            :key="workload"
            @click="loadWorkloadData(workload)"
            color="success"
          >
            {{ getDisplayedWorkload(workload) }}
          </v-btn>
        </v-btn-toggle>
        <div class="mb-2 mt-6">
          <b> Remove generated data from instances</b>
        </div>
        <v-btn-toggle>
          <v-btn
            v-for="workload in availableWorkloads"
            :key="workload"
            @click="deleteWorkloadData(workload)"
            color="error"
          >
            {{ getDisplayedWorkload(workload) }}
          </v-btn>
        </v-btn-toggle>
      </v-col>
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
  createComponent,
  SetupContext,
  onMounted,
  Ref,
  ref,
  watch
} from "@vue/composition-api";
import { Workload, availableWorkloads } from "../types/workloads";
import { useWorkloadService } from "../services/workloadService";
import { getDisplayedWorkload } from "../meta/workloads";
import { Metric, workloadMetrics } from "../types/metrics";
import { MetricViewData } from "../types/views";
import MetricsTileList from "../components/container/MetricsTileList.vue";
import { useMetricEvents } from "../meta/events";
import { Database } from "../types/database";

interface Props {}
interface Data extends MetricViewData {
  getDisplayedWorkload: (workload: Workload) => string;
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
  startWorkload: (workload: Workload, frequency: number) => void;
  stopWorkload: () => void;
  availableWorkloads: string[];
  frequency: number;
  workloadMetrics: Metric[];
}

export default createComponent({
  name: "WorkloadScreen",
  components: {
    MetricsTileList
  },
  setup(props: Props, context: SetupContext): Data {
    const { emitMetricsChangedEvent } = useMetricEvents();
    const watchedInstances = ref<Database[]>([]);
    const frequency = 0;
    const {
      loadWorkloadData,
      deleteWorkloadData,
      startWorkload,
      stopWorkload
    } = useWorkloadService();

    const { isReady } = context.root.$databaseService;
    watch(isReady, () => {
      if (isReady.value) {
        watchedInstances.value = [
          context.root.$databaseService.databases.value[0]
        ];
      }
    });

    onMounted(() => {
      emitMetricsChangedEvent(workloadMetrics);
    });

    return {
      getDisplayedWorkload,
      loadWorkloadData,
      deleteWorkloadData,
      availableWorkloads,
      startWorkload,
      stopWorkload,
      frequency,
      watchedInstances,
      workloadMetrics
    };
  }
});
</script>
<style scoped></style>
