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
        <status-warning :selected-databases="databases" />
        <v-row>
          <v-col class="pt-2">
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
              @click="handleWorkloadChange()"
            ></v-slider>
            <v-text-field
              id="frequency-field"
              v-model="frequency"
              label="Number of queries per second"
              outlined
              dense
              @change="handleWorkloadChange()"
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
                  !isLoaded(workload) || isDisabled() || !databases.length
                "
              >
              </v-radio>
            </v-radio-group>
            <v-btn-toggle>
              <v-btn
                id="start-workload"
                @click="handleButtonChange('start')"
                :disabled="
                  buttons.start.loading ||
                  !isLoaded(workload) ||
                  isDisabled() ||
                  !databases.length
                "
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
                :disabled="
                  buttons.pause.loading ||
                  !isLoaded(workload) ||
                  isDisabled() ||
                  !databases.length
                "
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
                :disabled="
                  buttons.stop.loading || isDisabled() || !databases.length
                "
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
          <v-col class="pt-2">
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
              :loading="switchesLoading[workload]"
              :disabled="runningWorkload || isDisabled() || !databases.length"
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
import { useDatabaseService } from "../../services/databaseService";
import { useDatabaseEvents } from "../../meta/events";
import {
  getDisplayedWorkload,
  getWorkloadFromTransferred,
} from "../../meta/workloads";
import StatusWarning from "../alerts/StatusWarning.vue";

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
  databases: Ref<readonly string[]>;
  getDisplayedWorkload: (workload: Workload) => string;
  useDatabaseService: () => void;
  isLoaded: (workload: Workload) => boolean;
  isDisabled: () => boolean;
  handleButtonChange: (button: string) => void;
  handleWorkloadChange: () => void;
  handleWorkloadDataChange: (workload: Workload) => void;
  closeWorkloadDialog: () => void;
}
export default defineComponent({
  components: {
    StatusWarning,
  },
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
      startWorkload,
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
    let disabled: boolean = false;
    let changeWorkloadData: boolean = true;
    const { emitDatabaseStatusChangedEvent } = useDatabaseEvents();

    function closeWorkloadDialog(): void {
      context.emit("close");
    }
    function handleButtonChange(button: string): void {
      buttons[button].loading = true;
      Object.values(buttons).forEach((button: any) => {
        button.active = false;
      });
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
      } else {
        stopWorkload().then(() => {
          buttons[button].loading = false;
          buttons[button].active = true;
        });
      }
    }
    function isLoaded(workload: Workload): boolean {
      return workloadData.value.includes(workload);
    }
    function isDisabled(): boolean {
      return (
        disabled ||
        switchesLoading.tpch01 ||
        switchesLoading.tpch1 ||
        switchesLoading.tpcds ||
        switchesLoading.job
      );
    }
    function handleWorkloadChange(): void {
      if (buttons.start.active) {
        handleButtonChange("start");
      }
    }
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
          let loadedWorkloadData: string[] = response.data[0].loaded_benchmarks;
          Object.values(response.data).forEach((database: any) => {
            loadedWorkloadData = loadedWorkloadData.filter((benchmark: any) =>
              database.loaded_benchmarks.includes(benchmark)
            );
            emitDatabaseStatusChangedEvent(
              database.id,
              database.database_blocked_status,
              database.hyrise_active
            );
          });
          runningWorkload.value = Object.values(response.data).some(
            (database: any) => database.worker_pool_status === "running"
          );
          disabled = Object.values(response.data).some(
            (database: any) =>
              database.database_blocked_status === true ||
              database.hyrise_active === false
          );
          if (!disabled && changeWorkloadData) {
            Object.values(availableWorkloads).forEach((workload: Workload) => {
              switchesLoading[workload] = false;
            });
            workloadData.value = [];
            Object.values(loadedWorkloadData).forEach((transferred: string) => {
              workloadData.value.push(getWorkloadFromTransferred(transferred));
            });
          }
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
      databases: computed(
        () => context.root.$databaseController.availableDatabasesById.value
      ),
      getDisplayedWorkload,
      useDatabaseService,
      isLoaded,
      isDisabled,
      handleButtonChange,
      handleWorkloadChange,
      handleWorkloadDataChange,
      closeWorkloadDialog,
    };
  },
});
</script>
