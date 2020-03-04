<template>
  <v-dialog v-model="open" persistent max-width="900px">
    <v-card>
      <v-system-bar :height="50">
        <v-card-title>
          Workload Generation
        </v-card-title>
        <v-spacer></v-spacer>
        <v-icon @click="closeWorkloadDialog()">mdi-close</v-icon>
      </v-system-bar>
      <v-card-text class="pb-0">
        <v-row>
          <v-col max-width="300px">
            <p class="subtitle-1 font-weight-medium">
              Start, pause and stop workload
            </p>
            <v-text-field
              class="mt-5"
              v-model="frequency"
              label="Number of queries per second"
              outlined
              dense
            ></v-text-field>
            <v-slider
              v-model="frequency"
              class="mt-5"
              thumb-label="always"
              min="0"
              max="1000"
              step="10"
            ></v-slider>
            <v-radio-group v-model="workload" class="mt-0">
              <v-radio
                v-for="workload in availableWorkloads"
                :key="workload"
                :label="getDisplayedWorkload(workload)"
                :value="workload"
              >
              </v-radio>
            </v-radio-group>
            <v-btn-toggle>
              <v-btn @click="startWorkload(workload, frequency)">
                <v-icon>
                  mdi-play
                </v-icon>
              </v-btn>
              <v-btn @click="startWorkload(workload, 0)">
                <v-icon>
                  mdi-pause
                </v-icon>
              </v-btn>
              <v-btn @click="stopWorkload()">
                <v-icon>
                  mdi-stop
                </v-icon>
              </v-btn>
            </v-btn-toggle>
          </v-col>
          <v-divider vertical class="ml-4 mr-4" />
          <v-col>
            <p class="subtitle-1 font-weight-medium">
              Load and remove generated data into/from instances
            </p>
            <v-switch
              v-model="workloadData"
              v-for="workload in availableWorkloads"
              :key="workload"
              :label="getDisplayedWorkload(workload)"
              :value="getTransferredWorkload(workload)"
              @change="checkWorkloadData(workload)"
            >
            </v-switch>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script lang="ts">
import { SetupContext, defineComponent, ref, Ref } from "@vue/composition-api";
import { Workload, availableWorkloads } from "../../types/workloads";
import { useWorkloadService } from "../../services/workloadService";
import {
  getDisplayedWorkload,
  getTransferredWorkload
} from "../../meta/workloads";
import axios from "axios";

interface Props {
  open: boolean;
}
interface Data {
  availableWorkloads: string[];
  getDisplayedWorkload: (workload: Workload) => string;
  getTransferredWorkload: (workload: Workload) => string;
  getWorkloadData: () => Promise<string[]>;
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
  startWorkload: (workload: Workload, frequency: number) => void;
  stopWorkload: () => void;
  frequency: Ref<number>;
  workload: Ref<Workload>;
  workloadData: Ref<Workload[]>;
  checkWorkloadData: (workload: Workload) => void;
  closeWorkloadDialog: () => void;
}

export default defineComponent({
  props: {
    open: {
      type: Boolean,
      default: false
    }
  },
  setup(props: {}, context: SetupContext): Data {
    const frequency = ref<number>(200);
    const workload = ref<Workload>("tpch01");
    const {
      getWorkloadData,
      loadWorkloadData,
      deleteWorkloadData,
      startWorkload,
      stopWorkload
    } = useWorkloadService();
    const workloadData = ref<Workload[]>([]);
    getWorkloadData().then((response: any) => {
      workloadData.value = response.data;
    });
    function checkWorkloadData(workload: Workload): void {
      if (workload in workloadData) {
        loadWorkloadData(workload);
      } else {
        deleteWorkloadData(workload);
      }
    }
    function closeWorkloadDialog(): void {
      context.emit("close");
    }
    return {
      availableWorkloads,
      getDisplayedWorkload,
      getTransferredWorkload,
      getWorkloadData,
      loadWorkloadData,
      deleteWorkloadData,
      startWorkload,
      stopWorkload,
      frequency,
      workload,
      workloadData,
      checkWorkloadData,
      closeWorkloadDialog
    };
  }
});
</script>
