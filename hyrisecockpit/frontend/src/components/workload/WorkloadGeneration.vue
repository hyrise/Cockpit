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
              Start, pause and stop a workload
            </p>
            <v-slider
              v-model="frequency"
              class="mt-10"
              thumb-label="always"
              min="0"
              max="1000"
              @click="handleWorkloadChange(workload)"
            ></v-slider>
            <v-text-field
              v-model="frequency"
              label="Number of queries per second"
              outlined
              dense
              @change="handleWorkloadChange(workload)"
            ></v-text-field>
            <v-radio-group
              v-model="workload"
              class="mt-0"
              @change="handleWorkloadChange(workload)"
            >
              <v-radio
                v-for="workload in availableWorkloads"
                :key="workload"
                :label="getDisplayedWorkload(workload)"
                :value="workload"
                :disabled="!isLoaded(workload) || loading"
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
              class="mt-0 pt-0"
              v-model="workloadData"
              v-for="workload in availableWorkloads"
              :key="workload"
              :label="getDisplayedWorkload(workload)"
              :value="workload"
              @change="handleWorkloadDataChange(workload)"
              :loading="buttonIsLoading['load' + workload]"
              :disabled="loading"
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
  reactive,
  computed
} from "@vue/composition-api";
import { Workload, availableWorkloads } from "../../types/workloads";
import { useWorkloadService } from "../../services/workloadService";
import {
  getDisplayedWorkload,
  getTransferredWorkload,
  getWorkloadFromTransferred
} from "../../meta/workloads";

interface Props {
  open: boolean;
}
interface Data {
  availableWorkloads: string[];
  frequency: Ref<number>;
  workload: Ref<Workload>;
  workloadData: Ref<Workload[]>;
  buttonIsLoading: any;
  isActive: Ref<boolean>;
  loading: Ref<boolean>;
  getDisplayedWorkload: (workload: Workload) => string;
  startingWorkload: (workload: Workload) => void;
  pauseWorkload: (workload: Workload) => void;
  stoppingWorkload: () => void;
  isLoaded: (workload: Workload) => boolean;
  handleWorkloadChange: (workload: Workload) => void;
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
    const isActive = ref<boolean>(false);
    const startedWorkload = ref<boolean>(false);
    const buttonIsLoading: Record<string, boolean> = reactive({
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
      getLoadedWorkloadData,
      loadWorkloadData,
      deleteWorkloadData,
      startWorkload,
      stopWorkload
    } = useWorkloadService();
    const workloadData = ref<Workload[]>([]);
    updateWorkloadInformation();
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
    function handleWorkloadChange(workload: Workload): void {
      if (startedWorkload.value) {
        startingWorkload(workload);
      }
    }
    let changeWorkloadData = true;
    function handleWorkloadDataChange(workload: Workload): void {
      buttonIsLoading["load" + workload] = true;
      if (isLoaded(workload)) {
        changeWorkloadData = false;
        loadWorkloadData(workload).then(() => (changeWorkloadData = true));
      } else {
        changeWorkloadData = false;
        deleteWorkloadData(workload).then(() => (changeWorkloadData = true));
      }
    }
    function updateWorkloadInformation(): void {
      getLoadedWorkloadData().then((response: any) => {
        let loading = true;
        //TODO: error when no database is added
        let loadedWorkloadData: string[] = response.data[0].loaded_benchmarks;
        Object.values(response.data).forEach((instance: any) => {
          loadedWorkloadData = loadedWorkloadData.filter((benchmark: any) =>
            instance.loaded_benchmarks.includes(benchmark)
          );
          loading = Object.values(instance).some(
            () => instance.database_blocked_status == 1
          );
        });
        //TODO: error when loading and deleting (sometimes)
        if (!loading && changeWorkloadData) {
          Object.values(availableWorkloads).forEach((workload: Workload) => {
            buttonIsLoading["load" + workload] = false;
          });
          workloadData.value = [];
          Object.values(loadedWorkloadData).forEach((transferred: string) => {
            workloadData.value.push(getWorkloadFromTransferred(transferred));
          });
        }
      });
    }
    setInterval(updateWorkloadInformation, 1000);
    return {
      availableWorkloads,
      frequency,
      workload,
      workloadData,
      buttonIsLoading,
      isActive,
      loading: computed(
        () =>
          buttonIsLoading.loadtpch01 ||
          buttonIsLoading.loadtpch1 ||
          buttonIsLoading.loadtpcds ||
          buttonIsLoading.loadjob
      ),
      getDisplayedWorkload,
      startingWorkload,
      pauseWorkload,
      stoppingWorkload,
      isLoaded,
      handleWorkloadChange,
      handleWorkloadDataChange,
      closeWorkloadDialog
    };
  }
});
</script>
