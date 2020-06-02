<template>
  <v-dialog v-model="open" persistent max-width="900px">
    <v-card id="workload-generation">
      <v-system-bar :height="50" color="secondary">
        <v-tabs v-model="tab" background-color="grey lighten-1">
          <v-tab> Workload Settings </v-tab>
          <v-tooltip right>
            <template v-slot:activator="{ on }">
              <div v-on="on">
                <v-tab :disabled="disabled || !enableEqualizer">
                  Equalizer
                </v-tab>
              </div>
            </template>
            <span>{{
              enableEqualizer ? "Customize workload" : "Select a workload first"
            }}</span>
          </v-tooltip>
        </v-tabs>
        <v-spacer></v-spacer>
        <v-icon @click="$emit('close')">mdi-close</v-icon>
      </v-system-bar>
      <v-tabs-items v-model="tab">
        <v-tab-item>
          <v-card>
            <v-card-text class="py-0">
              <status-warning
                :selected-databases="databases"
                :selected-metrics="['']"
              />
              <v-row>
                <v-col class="pt-2">
                  <p class="subtitle-1 font-weight-medium mb-2">
                    Start, pause and stop a workload
                  </p>
                  <frequency-handler
                    :initial-frequency="frequency"
                    @change="handleFrequencyChange"
                  />
                  <workload-selector
                    :selected-workloads="selectedWorkloads"
                    :loaded-workloads="loadedWorkloads"
                    :disabled="disabled"
                    @change="handleWorkloadChange"
                  />
                  <workload-actions
                    :actions="actions"
                    :disabled="disabled"
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
                    :loadedWorkloads="loadedWorkloads"
                    :loadingWorkloads="loadingWorkloads"
                    :disabled="runningWorkload || disabled"
                    @change="handleWorkloadDataChange"
                  />
                </v-col>
              </v-row>
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-card-text>
              <equalizer
                :selected-workloads="selectedWorkloads"
                :weights="weights"
                @change="handleWeightChange"
              ></equalizer>
            </v-card-text>
          </v-card>
        </v-tab-item>
      </v-tabs-items>
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
import Equalizer from "./Equalizer.vue";
import WorkloadSelector from "./WorkloadSelector.vue";
import WorkloadActions from "./WorkloadActions.vue";
import WorkloadDataSelector from "./WorkloadDataSelector.vue";

interface Props {
  open: boolean;
}

interface Data extends WorkloadAction, WorkloadDataHandler {
  databases: Ref<readonly string[]>;
  tab: Ref<number>;
}

interface WorkloadAction {
  enableEqualizer: Ref<boolean>;
  frequency: Ref<number>;
  actions: Record<string, { active: boolean; loading: boolean }>;
  selectedWorkloads: Ref<Workload[]>;
  weights: Ref<Record<string, number>[]>;
  startingWorkload: () => void;
  pausingWorkload: () => void;
  stoppingWorkload: () => void;
  handleFrequencyChange: (frequency: number) => void;
  handleWorkloadChange: (workload: Workload) => void;
  handleWeightChange: (
    workload: Workload,
    name: string,
    weight: number
  ) => void;
}

interface WorkloadDataHandler {
  loadedWorkloads: Ref<Workload[]>;
  loadingWorkloads: Ref<Workload[]>;
  runningWorkload: Ref<boolean>;
  disabled: Ref<boolean>;
  handleWorkloadDataChange: (workload: Workload) => void;
}

export default defineComponent({
  name: "WorkloadGeneration",
  components: {
    StatusWarning,
    FrequencyHandler,
    Equalizer,
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
    const tab = ref<number>(0);
    const workloadDataHandler = useWorkloadDataHandler(context);
    return {
      databases: computed(
        () => context.root.$databaseController.availableDatabasesById.value
      ),
      tab,
      ...workloadDataHandler,
      ...useWorkloadAction(context),
    };
  },
});

function useWorkloadAction(context: SetupContext): WorkloadAction {
  //TODO: frequency for every workload
  const frequency = ref<number>(200);
  const {
    getLoadedWorkloadData,
    startWorker,
    stopWorker,
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
  const selectedWorkloads = ref<Workload[]>([]);
  const weights = ref<Record<string, number>[]>([]);

  // running workload indicator
  getWorkloads().then((response: any) => {
    if (response.data.length > 0) {
      initialiseWorkloadSelector(response.data);
      frequency.value = response.data[0].frequency;
    }
    getLoadedWorkloadData().then((response: any) => {
      initialiseWorkloadActions(response.data);
    });
  });

  function initialiseWorkloadSelector(database: any): void {
    //TODO: set right order of tables
    Object.values(database).forEach((workload: any) => {
      selectedWorkloads.value.push(
        getWorkloadFromTransferred(workload.folder_name)
      );
      updatingWorkload(getWorkloadFromTransferred(workload.folder_name));
    });
  }
  function initialiseWorkloadActions(database: any): void {
    let workersStopped = Object.values(database).some(
      (database: any) => database.worker_pool_status === "closed"
    );
    if (!workersStopped) {
      if (frequency.value > 0) {
        actions.start.active = true;
        context.emit("start");
      } else {
        actions.pause.active = true;
        context.emit("pause");
      }
    }
  }
  function startLoading(action: string): void {
    actions[action].loading = true;
    Object.values(actions).forEach((action: any) => {
      action.active = false;
    });
    actions[action].active = true;
  }
  function stopLoading(action: string): void {
    actions[action].loading = false;
  }
  function updatingWorkload(workload: Workload) {
    if (
      weights.value[selectedWorkloads.value.indexOf(workload)] !== undefined
    ) {
      updateWorkload(
        workload,
        frequency.value,
        weights.value[selectedWorkloads.value.indexOf(workload)]
      );
    } else {
      updateWorkload(workload, frequency.value, {}).then((response: any) =>
        handleWeightsChange(response.data.weights)
      );
    }
  }
  function updatingWorkloads(): void {
    Object.values(selectedWorkloads.value).forEach((workload: Workload) => {
      updatingWorkload(workload);
    });
  }
  function startingWorker(action: string): void {
    startLoading(action);
    startWorker().then(() => stopLoading(action));
  }
  function startingWorkload(): void {
    context.emit("start");
    startingWorker("start");
  }
  function pausingWorkload(): void {
    context.emit("pause");
    frequency.value = 0;
    startingWorker("pause");
  }
  function stoppingWorkload(): void {
    context.emit("stop");
    startLoading("stop");
    stopWorker().then(() => stopLoading("stop"));
  }
  function handleFrequencyChange(changedFrequency: number): void {
    frequency.value = changedFrequency;
    if (actions.start.active) {
      updatingWorkloads();
    }
  }
  function handleWorkloadChange(workload: Workload): void {
    if (!selectedWorkloads.value.includes(workload)) {
      selectedWorkloads.value.push(workload);
      startWorkload(workload, frequency.value).then(() =>
        updatingWorkload(workload)
      );
    } else {
      weights.value.splice(selectedWorkloads.value.indexOf(workload), 1);
      selectedWorkloads.value.splice(
        selectedWorkloads.value.indexOf(workload),
        1
      );
      stopWorkload(workload);
    }
  }
  function handleWeightChange(
    workload: Workload,
    key: string,
    weight: number
  ): void {
    const changedWeight =
      weights.value[selectedWorkloads.value.indexOf(workload)];
    changedWeight[key] = weight;
    weights.value.splice(selectedWorkloads.value.indexOf(workload), 1);
    weights.value.splice(
      selectedWorkloads.value.indexOf(workload),
      0,
      changedWeight
    );
    updatingWorkload(workload);
  }
  function handleWeightsChange(changedWeights: Record<string, number>): void {
    weights.value.push(changedWeights);
  }
  return {
    enableEqualizer: computed(() => selectedWorkloads.value.length !== 0),
    frequency,
    actions,
    selectedWorkloads,
    weights,
    startingWorkload,
    pausingWorkload,
    stoppingWorkload,
    handleFrequencyChange,
    handleWorkloadChange,
    handleWeightChange,
  };
}

function useWorkloadDataHandler(context: SetupContext): WorkloadDataHandler {
  const loadedWorkloads = ref<Workload[]>([]);
  const loadingWorkloads = ref<Workload[]>([]);
  const {
    getLoadedWorkloadData,
    loadWorkloadData,
    deleteWorkloadData,
  } = useWorkloadService();
  const runningWorkload = ref<boolean>(false);
  let blocked: boolean = false;
  let changeWorkloadData: boolean = true;
  const { emitDatabaseStatusChangedEvent } = useDatabaseEvents();

  function handleWorkloadDataChange(workload: Workload): void {
    loadingWorkloads.value.push(workload);
    changeWorkloadData = false;
    if (!loadedWorkloads.value.includes(workload)) {
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
          loadedWorkloadData = loadedWorkloadData.filter(
            (benchmark: any) =>
              database.loaded_benchmarks.includes(benchmark) &&
              !["no-ops_0_1", "no-ops_1"].includes(benchmark)
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
          loadedWorkloads.value = [];
          loadingWorkloads.value = [];
          Object.values(loadedWorkloadData).forEach((transferred: string) => {
            loadedWorkloads.value.push(getWorkloadFromTransferred(transferred));
          });
        }
      }
    });
  }
  setInterval(updateWorkloadInformation, 1000);
  return {
    loadedWorkloads,
    loadingWorkloads,
    runningWorkload,
    disabled: computed(
      () =>
        blocked ||
        !context.root.$databaseController.availableDatabasesById.value.length ||
        loadingWorkloads.value.length !== 0
    ),
    handleWorkloadDataChange,
  };
}
</script>
<style scoped>
.v-tab {
  height: 48px;
  text-transform: none !important;
  font-size: medium;
}
</style>
