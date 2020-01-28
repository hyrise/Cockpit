<template>
  <div class="mx-12">
    <div class="mt-6 mb-2">
      <b> Workload Generation </b>
    </div>
    <v-divider />
    <v-col cols="12">
      <div class="mb-2 mt-2">
        <b> Register workload </b>
      </div>
      <v-btn @click="registerWorkload()" large color="amber">TPCH_0.1 </v-btn>
      <div class="mb-2 mt-6">
        <b> Start/stop workload </b>
      </div>
      <v-btn @click="startWorkload()" large color="success">Start </v-btn>
      <v-btn @click="stopWorkload()" large color="error">Stop </v-btn>
      <div class="mb-2 mt-6">
        <b> Load generated data </b>
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
        <b> Delete generated data </b>
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
  registerWorkload: () => void;
  startWorkload: () => void;
  stopWorkload: () => void;
  availableWorkloads: string[];
}

export default createComponent({
  name: "WorkloadScreen",
  setup(props: Props, context: SetupContext): Data {
    const {
      loadWorkloadData,
      deleteWorkloadData,
      registerWorkload,
      startWorkload,
      stopWorkload
    } = useWorkloadService();
    return {
      loadWorkloadData,
      deleteWorkloadData,
      availableWorkloads,
      registerWorkload,
      startWorkload,
      stopWorkload
    };
  }
});
</script>
<style scoped></style>
