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
              <v-btn
                @click="startingWorkload(workload, frequency)"
                :disabled="buttonIsLoading.start"
                :loading="buttonIsLoading.start"
              >
                <v-icon>
                  mdi-play
                </v-icon>
              </v-btn>
              <v-btn
                @click="pauseWorkload(workload)"
                :disabled="buttonIsLoading.pause"
                :loading="buttonIsLoading.pause"
              >
                <v-icon>
                  mdi-pause
                </v-icon>
              </v-btn>
              <v-btn
                @click="stoppingWorkload()"
                :disabled="buttonIsLoading.stop"
                :loading="buttonIsLoading.stop"
              >
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
              :value="workload"
              @change="handleWorkloadDataChange(workload)"
              :loading="buttonIsLoading['load' + workload]"
              :disabled="buttonIsLoading['load' + workload]"
            >
            </v-switch>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script lang="ts">
import {
  SetupContext,
  defineComponent,
  ref,
  Ref,
  reactive
} from "@vue/composition-api";
import { Workload, availableWorkloads } from "../../types/workloads";
import { useWorkloadService } from "../../services/workloadService";
import { getDisplayedWorkload } from "../../meta/workloads";

interface Props {
  open: boolean;
}
interface Data {
  buttonIsLoading: any[];
  availableWorkloads: string[];
  frequency: Ref<number>;
  workload: Ref<Workload>;
  workloadData: Ref<Workload[]>;
  getDisplayedWorkload: (workload: Workload) => string;
  getWorkloadData: () => Promise<string[]>;
  loadWorkloadData: (workload: Workload) => Promise<void>;
  deleteWorkloadData: (workload: Workload) => Promise<void>;
  startWorkload: (workload: Workload, frequency: number) => Promise<void>;
  pauseWorkload: (workload: Workload) => void;
  stopWorkload: () => Promise<void>;
  startingWorkload: (workload: Workload, frequency: number) => void;
  stoppingWorkload: () => void;
  handleWorkloadDataChange: (workload: Workload) => void;
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
    const buttonIsLoading = reactive({
      loadtpch01: false,
      loadtpch1: false,
      loadtpcds: false,
      loadjob: false,
      start: false,
      pause: false,
      stop: false
    });
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
    /* getWorkloadData().then((response: any) => {
      workloadData.value = response.data;
    }); */
    function closeWorkloadDialog(): void {
      context.emit("close");
    }
    function startingWorkload(workload: Workload, frequency: number): void {
      buttonIsLoading["start"] = true;
      startWorkload(workload, frequency).then(() => {
        buttonIsLoading["start"] = false;
      });
    }
    function pauseWorkload(workload: Workload): void {
      buttonIsLoading["pause"] = true;
      startWorkload(workload, 0).then(() => {
        buttonIsLoading["pause"] = false;
      });
    }
    function stoppingWorkload(): void {
      buttonIsLoading["stop"] = true;
      stopWorkload().then(() => {
        buttonIsLoading["stop"] = false;
      });
    }
    function handleWorkloadDataChange(workload: Workload): void {
      buttonIsLoading["load" + workload] = true;
      if (workloadData.value.includes(workload)) {
        loadWorkloadData(workload).then(() => {
          buttonIsLoading["load" + workload] = false;
        });
      } else {
        deleteWorkloadData(workload).then(() => {
          buttonIsLoading["load" + workload] = false;
        });
      }
    }
    return {
      availableWorkloads,
      getDisplayedWorkload,
      getWorkloadData,
      loadWorkloadData,
      deleteWorkloadData,
      startWorkload,
      pauseWorkload,
      stopWorkload,
      frequency,
      workload,
      workloadData,
      startingWorkload,
      stoppingWorkload,
      handleWorkloadDataChange,
      closeWorkloadDialog,
      buttonIsLoading
    };
  }
});
</script>
