<template>
  <div>
    <linear-loader
      :conditions="[$databaseController.databasesUpdated]"
      :evaluations="[false]"
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
        <v-slider
          v-model="frequency"
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
      <!-- <metrics-tile-list
        v-if="$databaseController.databasesUpdated.value"
        :selected-databases="watchedInstances"
        :show-details="false"
        :selected-metrics="workloadMetrics"
      /> -->
      <database-query-tables />
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
import LinearLoader from "../components/loading/linearLoader.vue";
import DatabaseQueryTables from "@/components/DatabaseQueryTables.vue";

interface Props {}
interface Data {
  getDisplayedWorkload: (workload: Workload) => string;
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
  startWorkload: (workload: Workload, frequency: number) => void;
  stopWorkload: () => void;
  availableWorkloads: string[];
  frequency: Ref<number>;
  workloadMetrics: Metric[];
  watchedInstances: Ref<string[]>;
}

export default defineComponent({
  name: "WorkloadScreen",
  components: {
    MetricsTileList,
    LinearLoader,
    DatabaseQueryTables
  },
  setup(props: Props, context: SetupContext): Data {
    const { emitWatchedMetricsChangedEvent } = useMetricEvents();
    const watchedInstances = ref<string[]>([]);
    const frequency = ref<number>(200);
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
      getDisplayedWorkload,
      availableWorkloads,
      frequency,
      watchedInstances,
      workloadMetrics,
      ...useWorkloadService()
    };
  }
});
</script>
<style scoped></style>
