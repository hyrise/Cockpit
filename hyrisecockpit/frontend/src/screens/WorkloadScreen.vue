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
          @click="startWorkload(getWorkloadData(workload))"
          color="success"
        >
          {{ workload }}
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
    <krueger-graph />
  </div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  onMounted,
  Ref,
  ref
} from "@vue/composition-api";
import { Workload, availableWorkloads, WorkloadData } from "../types/workloads";
import axios from "axios";
import { useWorkloadService } from "../services/workloadService";
import { getWorkloadData } from "../components/meta/workloads";
import KruegerGraph from "../components/KruegerGraph.vue";

interface Props {}
interface Data {
  getWorkloadData: (workload: Workload) => WorkloadData;
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
  startWorkload: (workloadData: WorkloadData) => void;
  stopWorkload: () => void;
  availableWorkloads: string[];
}

export default createComponent({
  name: "WorkloadScreen",
  components: {
    KruegerGraph
  },
  setup(props: Props, context: SetupContext): Data {
    const {
      loadWorkloadData,
      deleteWorkloadData,
      startWorkload,
      stopWorkload
    } = useWorkloadService();
    return {
      getWorkloadData,
      loadWorkloadData,
      deleteWorkloadData,
      availableWorkloads,
      startWorkload,
      stopWorkload
    };
  }
});
</script>
<style scoped></style>
