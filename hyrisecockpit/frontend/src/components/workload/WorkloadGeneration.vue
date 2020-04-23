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
      <v-card-text>
        <v-row>
          <v-col max-width="300px">
            <p class="subtitle-1 font-weight-medium">
              Start, pause and stop a workload
            </p>
            <v-slider
              id="frequency-slider"
              v-model="frequency"
              class="mt-10"
              thumb-label="always"
              min="0"
              max="1000"
              @click="handleFrequencyChange()"
            ></v-slider>
            <v-text-field
              id="frequency-field"
              v-model="frequency"
              label="Number of queries per second"
              outlined
              dense
              @change="handleFrequencyChange()"
            ></v-text-field>
            <v-radio-group
              v-model="workload"
              class="mt-0"
              @change="handleWorkloadChange()"
            >
              <v-radio
                v-for="workload in availableWorkloads"
                :key="workload"
                :label="getDisplayedWorkload(workload)"
                :value="workload"
                :disabled="
                  !isLoaded(workload) || loadingWorkloadData || instanceBlocked
                "
              >
              </v-radio>
            </v-radio-group>
            <v-btn-toggle>
              <v-btn
                id="start-workload"
                @click="handleButtonChange('start')"
                :disabled="buttons.start.loading || !isLoaded(workload)"
                :loading="buttons.start.loading"
                :style="{ color: buttons.start.active ? 'green' : '' }"
              >
                <v-icon>
                  mdi-play
                </v-icon>
              </v-btn>
              <v-btn
                id="pause-workload"
                @click="handleButtonChange('pause')"
                :disabled="buttons.pause.loading || !isLoaded(workload)"
                :loading="buttons.pause.loading"
                :style="{ color: buttons.pause.active ? 'blue' : '' }"
              >
                <v-icon>
                  mdi-pause
                </v-icon>
              </v-btn>
              <v-btn
                id="stop-workload"
                @click="handleButtonChange('stop')"
                :disabled="buttons.stop.loading || noDatabaseAdded"
                :loading="buttons.stop.loading"
                :style="{ color: buttons.stop.active ? 'red' : '' }"
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
            <v-alert
              v-if="noDatabaseAdded"
              class="alert pt-2 pb-2 primary--text"
              type="warning"
              color="warning"
            >
              <slot>No database added </slot>
            </v-alert>
            <v-switch
              class="mt-0 pt-0"
              v-model="workloadData"
              v-for="workload in availableWorkloads"
              :key="workload"
              :label="getDisplayedWorkload(workload)"
              :value="workload"
              @change="handleWorkloadDataChange(workload)"
              :loading="switchesLoading[workload]"
              :disabled="
                runningWorkload ||
                loadingWorkloadData ||
                instanceBlocked ||
                noDatabaseAdded
              "
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
  computed,
} from "@vue/composition-api";
import { Workload, availableWorkloads } from "../../types/workloads";
import { useWorkloadService } from "../../services/workloadService";
import {
  getDisplayedWorkload,
  getWorkloadFromTransferred,
} from "../../meta/workloads";

interface Props {
  open: boolean;
}
interface Data {
  availableWorkloads: string[];
  frequency: Ref<number>;
  workload: Ref<Workload>;
  workloadData: Ref<Workload[]>;
  buttons: Record<string, { active: boolean; loading: boolean }>;
  switchesLoading: Record<string, boolean>;
  runningWorkload: Ref<boolean>;
  loadingWorkloadData: Ref<boolean>;
  instanceBlocked: Ref<boolean>;
  noDatabaseAdded: Ref<boolean>;
  getDisplayedWorkload: (workload: Workload) => string;
  isLoaded: (workload: Workload) => boolean;
  handleButtonChange: (button: string) => void;
  handleFrequencyChange: () => void;
  handleWorkloadChange: () => void;
  handleWorkloadDataChange: (workload: Workload) => void;
  closeWorkloadDialog: () => void;
}
export default defineComponent({
  props: {
    open: {
      type: Boolean,
      default: false,
    },
  },
  setup(props: {}, context: SetupContext): Data {
    const frequency = ref<number>(200);
    const workload = ref<Workload>("");
    const workloadData = ref<Workload[]>([]);
    const {
      getLoadedWorkloadData,
      loadWorkloadData,
      deleteWorkloadData,
      getWorkload,
      getWorkloads,
      startWorkload,
      updateWorkload,
      stopWorkload,
    } = useWorkloadService();
    const buttons: Record<
      string,
      { active: boolean; loading: boolean }
    > = reactive({
      start: {
        active: false,
        loading: false,
      },
      pause: {
        active: false,
        loading: false,
      },
      stop: {
        active: false,
        loading: false,
      },
    });
    const switchesLoading: Record<string, boolean> = reactive({
      tpch01: false,
      tpch1: false,
      tpcds: false,
      job: false,
    });
    const runningWorkload = ref<boolean>(false);
    const instanceBlocked = ref<boolean>(false);
    const noDatabaseAdded = ref<boolean>(false);

    function closeWorkloadDialog(): void {
      context.emit("close");
    }
    function handleButtonChange(button: string): void {
      buttons[button].loading = true;
      Object.values(buttons).forEach((button: any) => {
        button.active = false;
      });
      getWorkloads().then((response: any) => {
        if (response.data.length === 0) {
          if (button === "start") {
            startWorkload(workload.value, frequency.value).then(() => {
              buttons[button].loading = false;
              buttons[button].active = true;
            });
          } else if (button === "pause") {
            startWorkload(workload.value, 0).then(() => {
              buttons[button].loading = false;
              buttons[button].active = true;
            });
          }
        } else {
          if (button === "start") {
            updateWorkload(workload.value, frequency.value).then(() => {
              buttons[button].loading = false;
              buttons[button].active = true;
            });
          } else if (button === "pause") {
            updateWorkload(workload.value, 0).then(() => {
              buttons[button].loading = false;
              buttons[button].active = true;
            });
          } else {
            stopWorkload(workload.value).then(() => {
              buttons[button].loading = false;
              buttons[button].active = true;
            });
          }
        }
      });
    }
    function isLoaded(workload: Workload): boolean {
      return workloadData.value.includes(workload);
    }
    function handleFrequencyChange(): void {
      if (buttons.start.active) {
        updateWorkload(workload.value, frequency.value);
      }
    }
    function handleWorkloadChange(): void {
      if (buttons.start.active) {
        handleButtonChange("start");
      }
    }
    let changeWorkloadData = true;
    function handleWorkloadDataChange(workload: Workload): void {
      switchesLoading[workload] = true;
      changeWorkloadData = false;
      if (isLoaded(workload)) {
        loadWorkloadData(workload).then(() => {
          changeWorkloadData = true;
        });
      } else {
        deleteWorkloadData(workload).then(() => {
          changeWorkloadData = true;
        });
      }
    }
    function updateWorkloadInformation(): void {
      getLoadedWorkloadData().then((response: any) => {
        if (response.data.length !== 0) {
          noDatabaseAdded.value = false;
          let loadedWorkloadData: string[] = response.data[0].loaded_benchmarks;
          Object.values(response.data).forEach((instance: any) => {
            loadedWorkloadData = loadedWorkloadData.filter((benchmark: any) =>
              instance.loaded_benchmarks.includes(benchmark)
            );
          });
          instanceBlocked.value = Object.values(response.data).some(
            (instance: any) => instance.database_blocked_status === true
          );
          runningWorkload.value = Object.values(response.data).some(
            (instance: any) => instance.worker_pool_status === "running"
          );
          if (!instanceBlocked.value && changeWorkloadData) {
            Object.values(availableWorkloads).forEach((workload: Workload) => {
              switchesLoading[workload] = false;
            });
            workloadData.value = [];
            Object.values(loadedWorkloadData).forEach((transferred: string) => {
              workloadData.value.push(getWorkloadFromTransferred(transferred));
            });
          }
        } else {
          noDatabaseAdded.value = true;
        }
      });
    }
    setInterval(updateWorkloadInformation, 1000);
    return {
      availableWorkloads,
      frequency,
      workload,
      workloadData,
      buttons,
      switchesLoading,
      runningWorkload,
      loadingWorkloadData: computed(
        () =>
          switchesLoading.tpch01 ||
          switchesLoading.tpch1 ||
          switchesLoading.tpcds ||
          switchesLoading.job
      ),
      instanceBlocked,
      noDatabaseAdded,
      getDisplayedWorkload,
      isLoaded,
      handleButtonChange,
      handleFrequencyChange,
      handleWorkloadChange,
      handleWorkloadDataChange,
      closeWorkloadDialog,
    };
  },
});
</script>
