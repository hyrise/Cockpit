<template>
  <div class="mx-12">
    <div class="mt-6 mb-2">
      <b> Workload Generation </b>
    </div>
    <v-divider />
    <v-col cols="12">
      <div class="mb-2 mt-2">
        <b> Start workload </b>
      </div>
      <v-btn-toggle>
        <v-btn
          v-for="workload in availableWorkloads"
          :key="workload"
          @click="
            startWorkload(getWorkloadMetaData(workload));
            getCurrentFrequency();
          "
          color="success"
        >
          {{ workload }}
        </v-btn>
      </v-btn-toggle>
      <p>Frequency is: {{ frequency }}</p>
      <div class="mb-2 mt-6">
        <b> Stop workload </b>
      </div>
      <v-btn
        @click="
          stopWorkload();
          setFrequencyToNull();
        "
        large
        color="error"
        >Stop
      </v-btn>
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
          {{ workload }}
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
          {{ workload }}
        </v-btn>
      </v-btn-toggle>
    </v-col>
    <MetricsTileList
      :selected-databases="watchedInstances"
      :show-details="false"
      :selected-metrics="workloadMetrics"
    />
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
import {
  Workload,
  availableWorkloads,
  WorkloadMetaData
} from "../types/workloads";
import axios from "axios";
import { useWorkloadService } from "../services/workloadService";
import { getWorkloadMetaData, getFrequency } from "../meta/workloads";
import { Metric, workloadMetrics } from "../types/metrics";
import { ScreenData } from "../types/views";
import MetricsTileList from "../components/container/MetricsTileList.vue";

interface Props {}
interface Data extends ScreenData {
  getWorkloadMetaData: (workload: Workload) => WorkloadMetaData;
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
  startWorkload: (workloadMetaData: WorkloadMetaData) => void;
  stopWorkload: () => void;
  availableWorkloads: string[];
  frequency: Ref<number>;
  getCurrentFrequency: () => void;
  setFrequencyToNull: () => void;
  workloadMetrics: Metric[];
}

export default createComponent({
  name: "WorkloadScreen",
  components: {
    MetricsTileList
  },
  setup(props: Props, context: SetupContext): Data {
    const watchedInstances = ref<string[]>([]);
    const frequency = ref<number>(0);
    function getCurrentFrequency(): void {
      frequency.value = getFrequency();
    }
    function setFrequencyToNull(): void {
      frequency.value = 0;
    }
    const {
      loadWorkloadData,
      deleteWorkloadData,
      startWorkload,
      stopWorkload
    } = useWorkloadService();

    const { isReady } = context.root.$databaseData;
    watch(isReady, () => {
      if (isReady.value) {
        watchedInstances.value = [
          context.root.$databaseData.databases.value.map(
            database => database.id
          )[0]
        ];
      }
    });

    return {
      getWorkloadMetaData,
      loadWorkloadData,
      deleteWorkloadData,
      availableWorkloads,
      startWorkload,
      stopWorkload,
      frequency,
      getCurrentFrequency,
      setFrequencyToNull,
      watchedInstances,
      workloadMetrics
    };
  }
});
</script>
<style scoped></style>
