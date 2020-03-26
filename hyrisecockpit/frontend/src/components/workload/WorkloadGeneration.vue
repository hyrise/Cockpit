<template>
  <v-dialog v-model="open" persistent max-width="900px">
    <v-card id="workload-generation">
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
              Start, pause and stop a workload
            </p>
            <v-slider
              v-model="frequency"
              class="mt-10"
              thumb-label="always"
              min="0"
              max="1000"
              step="10"
              @end="handleChange(workload)"
            ></v-slider>
            <v-text-field
              v-model="frequency"
              label="Number of queries per second"
              outlined
              dense
            ></v-text-field>
            <v-radio-group
              v-model="workload"
              class="mt-0"
              @change="handleChange(workload)"
            >
              <v-radio
                v-for="workload in availableWorkloads"
                :key="workload"
                :label="getDisplayedWorkload(workload)"
                :value="workload"
                :disabled="!isLoaded(workload)"
              >
              </v-radio>
            </v-radio-group>
            <v-btn-toggle>
              <v-btn
                @click="startingWorkload(workload)"
                :disabled="buttonIsLoading.start || !isLoaded(workload)"
                :loading="buttonIsLoading.start"
                :style="{ color: isActive ? 'green' : '' }"
              >
                <v-icon>
                  mdi-play
                </v-icon>
              </v-btn>
              <v-btn
                @click="pauseWorkload(workload)"
                :disabled="buttonIsLoading.pause || !isLoaded(workload)"
                :loading="buttonIsLoading.pause"
                :style="{ color: isActive ? 'blue' : '' }"
              >
                <v-icon>
                  mdi-pause
                </v-icon>
              </v-btn>
              <v-btn
                @click="stoppingWorkload()"
                :disabled="buttonIsLoading.stop"
                :loading="buttonIsLoading.stop"
                :style="{ color: isActive ? 'red' : '' }"
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
  availableWorkloads: string[];
  frequency: Ref<number>;
  workload: Ref<Workload>;
  workloadData: Ref<Workload[]>;
  buttonIsLoading: any;
  getDisplayedWorkload: (workload: Workload) => string;
  startingWorkload: (workload: Workload) => void;
  pauseWorkload: (workload: Workload) => void;
  stoppingWorkload: () => void;
  isLoaded: (workload: Workload) => boolean;
  handleChange: (workload: Workload) => void;
  handleWorkloadDataChange: (workload: Workload) => void;
  closeWorkloadDialog: () => void;
  isActive: Ref<boolean>;
}
export default defineComponent({
  props: {
    open: {
      type: Boolean,
      default: false
    }
  },
  setup(props: {}, context: SetupContext): Data {
    const isActive = ref<boolean>(false);
    const startedWorkload = ref<boolean>(false);
    const buttonIsLoading: any = reactive({
      loadtpch01: false,
      loadtpch1: false,
      loadtpcds: false,
      loadjob: false,
      start: false,
      pause: false,
      stop: false
    });
    const frequency = ref<number>(200);
    const workload = ref<Workload>("");
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
    function startingWorkload(workload: Workload): void {
      buttonIsLoading["start"] = true;
      startWorkload(workload, frequency.value).then(() => {
        buttonIsLoading["start"] = false;
        startedWorkload.value = true;
        isActive.value = true;
      });
    }
    function pauseWorkload(workload: Workload): void {
      buttonIsLoading["pause"] = true;
      startedWorkload.value = false;
      startWorkload(workload, 0).then(() => {
        buttonIsLoading["pause"] = false;
        isActive.value = true;
      });
    }
    function stoppingWorkload(): void {
      buttonIsLoading["stop"] = true;
      startedWorkload.value = false;
      stopWorkload().then(() => {
        buttonIsLoading["stop"] = false;
        isActive.value = true;
      });
    }
    function isLoaded(workload: Workload): boolean {
      return workloadData.value.includes(workload);
    }
    function handleChange(workload: Workload): void {
      if (startedWorkload.value) {
        startingWorkload(workload);
      }
    }
    function handleWorkloadDataChange(workload: Workload): void {
      buttonIsLoading["load" + workload] = true;
      if (isLoaded(workload)) {
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
      frequency,
      workload,
      workloadData,
      buttonIsLoading,
      getDisplayedWorkload,
      startingWorkload,
      pauseWorkload,
      stoppingWorkload,
      isLoaded,
      handleChange,
      handleWorkloadDataChange,
      closeWorkloadDialog,
      isActive
    };
  }
});
</script>
