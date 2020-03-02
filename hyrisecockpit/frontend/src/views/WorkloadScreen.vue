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
          <b> Start, pause and stop workload </b>
        </div>
        <v-slider
          v-model="frequency"
          class="mt-10"
          thumb-label="always"
          min="0"
          max="1000"
          step="10"
        >
          <template v-slot:append>
            <v-text-field
              v-model="frequency"
              class="mt-n1 pt-0"
              type="number"
              style="width: 60px"
              step="10"
            ></v-text-field>
          </template>
        </v-slider>
        <v-radio-group v-model="workload">
          <v-radio
            v-for="workload in availableWorkloads"
            :key="workload"
            :label="getDisplayedWorkload(workload)"
            :value="workload"
          >
          </v-radio>
        </v-radio-group>
        <v-btn-toggle>
          <v-btn @click="startWorkload(workload, frequency)" large color="error"
            >Start
          </v-btn>
          <v-btn @click="startWorkload(workload, 0)" large color="error"
            >Pause
          </v-btn>
          <v-btn @click="stopWorkload()" large color="error">Stop </v-btn>
        </v-btn-toggle>
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
  defineComponent,
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
import MetricsTileList from "../components/container/MetricsTileList.vue";
import { useMetricEvents } from "../meta/events";
import { Database } from "../types/database";

interface Props {}
interface Data {
  getDisplayedWorkload: (workload: Workload) => string;
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
  startWorkload: (workload: Workload, frequency: number) => void;
  stopWorkload: () => void;
  availableWorkloads: string[];
  frequency: Ref<number>;
  workload: String;
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
    const frequency = ref<number>(200);
    const workload = "tpch01";
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
      emitWatchedMetricsChangedEvent(workloadMetrics);
    });

    return {
      getDisplayedWorkload,
      loadWorkloadData,
      deleteWorkloadData,
      availableWorkloads,
      startWorkload,
      stopWorkload,
      frequency,
      workload,
      watchedInstances,
      workloadMetrics
    };
  }
});
</script>
<style scoped></style>
