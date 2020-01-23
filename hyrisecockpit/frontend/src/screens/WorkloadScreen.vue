<template>
  <div class="mx-12">
    <div class="mt-6 mb-2">
      <b> Workload Generation </b>
    </div>
    <v-divider />

    <v-col cols="12">
      <div class="mb-2 mt-2">
        <b> Load generated workload </b>
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
        <b> Delete generated workload </b>
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
      <div class="mb-2 mt-6">
        <b> Start/stop workload </b>
      </div>
      <v-btn 
        :key="workload"
        @click="startWorkload(workload)"
        large color="success">Start
      </v-btn>
      <v-btn 
        :key="workload"
        @click="startWorkload(workload)"
        large color="error">Stop
      </v-btn>
    </v-col>
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
import { Workload, availableWorkloads } from "../types/workloads";
import axios from "axios";
import { useWorkloadService } from "../services/workloadService";

interface Props {}
interface Data {
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
  startWorkload: (workload: Workload) => void;
  stopWorkload: (workload: Workload) => void;
  availableWorkloads: string[];
}

export default createComponent({
  name: "WorkloadScreen",
  setup(props: Props, context: SetupContext): Data {
    const { loadWorkloadData, deleteWorkloadData, startWorkload, stopWorkload } = useWorkloadService();
    return {
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
