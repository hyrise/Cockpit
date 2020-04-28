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
        <status-warning
          :selected-databases="databases"
          :selected-metrics="['']"
        />
        <v-row>
          <v-col class="pt-2">
            <p class="subtitle-1 font-weight-medium">
              Start, pause and stop a workload
            </p>
            <frequency-handler @change="handleFrequencyChange($event)" />
            <workload-selector
              :workload-data="workloadData"
              :disabled="disabled"
              @change="handleWorkloadChange($event)"
            />
            <workload-actions
              :actions="actions"
              :disabled="
                disabled || workload === '' || !workloadData[workload].loaded
              "
              @start="startingWorkload()"
              @pause="pausingWorkload()"
              @stop="stoppingWorkload()"
            />
          </v-col>
          <v-divider vertical class="ml-4 mr-4" />
          <v-col class="pt-2">
            <p class="subtitle-1 font-weight-medium">
              Load and remove generated data into/from instances
            </p>
            <workload-data-selector
              :workload-data="workloadData"
              :disabled="runningWorkload || disabled"
              @change="handleWorkloadDataChange($event)"
            />
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
import { useDatabaseEvents } from "../../meta/events";
import { getWorkloadFromTransferred } from "../../meta/workloads";
import StatusWarning from "../alerts/StatusWarning.vue";
import FrequencyHandler from "./FrequencyHandler.vue";
import WorkloadSelector from "./WorkloadSelector.vue";
import WorkloadActions from "./WorkloadActions.vue";
import WorkloadDataSelector from "./WorkloadDataSelector.vue";

interface Props {
  open: boolean;
}
interface Data {
  frequency: Ref<number>;
  workload: Ref<Workload>;
  workloadData: Record<string, { loaded: boolean; loading: boolean }>;
  actions: Record<string, { active: boolean; loading: boolean }>;
  runningWorkload: Ref<boolean>;
  disabled: Ref<boolean>;
  databases: Ref<readonly string[]>;
  startingWorkload: () => void;
  pausingWorkload: () => void;
  stoppingWorkload: () => void;
  handleFrequencyChange: (frequency: number) => void;
  handleWorkloadChange: (workload: Workload) => void;
  handleWorkloadDataChange: (workload: Workload) => void;
  closeWorkloadDialog: () => void;
}
export default defineComponent({
  components: {
    StatusWarning,
    FrequencyHandler,
    WorkloadSelector,
    WorkloadActions,
    WorkloadDataSelector,
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
    const workloadData: Record<
      string,
      { loaded: boolean; loading: boolean }
    > = reactive({
      tpch01: {
        loaded: false,
        loading: false,
      },
      tpch1: {
        loaded: false,
        loading: false,
      },
      tpcds: {
        loaded: false,
        loading: false,
      },
      job: {
        loaded: false,
        loading: false,
      },
    });
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
    const actions: Record<
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
    const runningWorkload = ref<boolean>(false);
    let blocked: boolean = false;
    let changeWorkloadData: boolean = true;
    const { emitDatabaseStatusChangedEvent } = useDatabaseEvents();

    function closeWorkloadDialog(): void {
      context.emit("close");
    }
    function startLoading(action: string): void {
      actions[action].loading = true;
      Object.values(actions).forEach((action: any) => {
        action.active = false;
      });
    }
    function stopLoading(action: string): void {
      actions[action].loading = false;
      actions[action].active = true;
    }
    function startingWorkload(): void {
      startLoading("start");
      getWorkloads().then((response: any) => {
        if (response.data.length === 0) {
          startWorkload(workload.value, frequency.value).then(() => {
            stopLoading("start");
          });
        } else {
          updateWorkload(workload.value, frequency.value).then(() => {
            stopLoading("start");
          });
        }
      });
    }
    function pausingWorkload(): void {
      startLoading("pause");
      getWorkloads().then((response: any) => {
        if (response.data.length === 0) {
          startWorkload(workload.value, 0).then(() => {
            stopLoading("pause");
          });
        } else {
          updateWorkload(workload.value, 0).then(() => {
            stopLoading("pause");
          });
        }
      });
    }
    function stoppingWorkload(): void {
      startLoading("stop");
      getWorkloads().then((response: any) => {
        if (response.data.length !== 0) {
          stopWorkload(workload.value).then(() => {
            stopLoading("stop");
          });
        }
      });
    }
    function handleFrequencyChange(changedFrequency: number): void {
      frequency.value = changedFrequency;
      if (actions.start.active) {
        updateWorkload(workload.value, frequency.value);
      }
    }
    function handleWorkloadChange(changedWorkload: Workload): void {
      workload.value = changedWorkload;
    }
    function handleWorkloadDataChange(workload: Workload): void {
      workloadData[workload].loading = true;
      changeWorkloadData = false;
      if (!workloadData[workload].loaded) {
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
          blocked = Object.values(response.data).some(
            (database: any) =>
              database.database_blocked_status === true ||
              database.hyrise_active === false
          );
          if (!blocked && changeWorkloadData) {
            Object.values(availableWorkloads).forEach((workload: Workload) => {
              workloadData[workload].loading = false;
            });
            Object.keys(workloadData).forEach((workload: string) => {
              workloadData[workload].loaded = false;
            });
            Object.values(loadedWorkloadData).forEach((transferred: string) => {
              workloadData[
                getWorkloadFromTransferred(transferred)
              ].loaded = true;
            });
          }
        }
      });
    }
    setInterval(updateWorkloadInformation, 1000);
    return {
      frequency,
      workload,
      workloadData,
      actions,
      runningWorkload,
      disabled: computed(
        () =>
          blocked ||
          !context.root.$databaseController.availableDatabasesById.value
            .length ||
          workloadData.tpch01.loading ||
          workloadData.tpch1.loading ||
          workloadData.tpcds.loading ||
          workloadData.job.loading
      ),
      databases: computed(
        () => context.root.$databaseController.availableDatabasesById.value
      ),
      startingWorkload,
      pausingWorkload,
      stoppingWorkload,
      handleFrequencyChange,
      handleWorkloadChange,
      handleWorkloadDataChange,
      closeWorkloadDialog,
    };
  },
});
</script>
