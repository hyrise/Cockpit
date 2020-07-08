<template>
  <v-dialog v-model="open" persistent max-width="900px">
    <v-card data-id="workload-generation">
      <v-system-bar :height="50" color="secondary">
        <v-tabs v-model="tab" background-color="grey lighten-1">
          <v-tab>Workload Settings</v-tab>
          <v-tooltip right>
            <template v-slot:activator="{ on }">
              <div v-on="on">
                <v-tab :disabled="disabled || !enableEqualizer" data-id="open-equalizer">Equalizer</v-tab>
              </div>
            </template>
            <span>
              {{
              enableEqualizer ? "Customize workload" : "Select a workload first"
              }}
            </span>
          </v-tooltip>
        </v-tabs>
        <v-spacer></v-spacer>
        <v-icon @click="$emit('close')">mdi-close</v-icon>
      </v-system-bar>
      <v-tabs-items v-model="tab">
        <v-tab-item>
          <v-card>
            <v-card-text class="py-0">
              <status-warning :selected-databases="databases" :selected-metrics="['']" />
              <v-row>
                <v-col class="pb-5" cols="7">
                  <v-row>
                    <v-col class="pl-5 pr-0 pb-0" cols="5">
                      <p class="subtitle-1 font-weight-medium mb-3">Start and stop workloads</p>
                      <workload-selector
                        :selected-workloads="selectedWorkloads"
                        :loaded-workloads="loadedWorkloads"
                        :disabled="disabled"
                        @change="handleWorkloadChange"
                      />
                    </v-col>
                    <v-col class="pb-0">
                      <p
                        class="subtitle-1 font-weight-medium mb-2"
                      >Change number of queries per second</p>
                      <frequency-handler
                        :initial-frequencies="frequencies"
                        :loaded-workloads="loadedWorkloads"
                        :disabled="disabled"
                        @change="handleFrequencyChange"
                      />
                    </v-col>
                  </v-row>
                  <v-col class="text-center pt-0">
                    <p class="subtitle-1 font-weight-medium mb-2">Start and stop worker</p>
                    <workload-actions
                      :actions="actions"
                      :disabled="disabled"
                      @start="start()"
                      @pause="pause()"
                      @stop="stop()"
                    />
                  </v-col>
                </v-col>
                <v-divider vertical class="ml-5 mr-3" />
                <v-col class="pt-6">
                  <p
                    class="subtitle-1 font-weight-medium mb-3"
                  >Load and remove data into/from instances</p>
                  <workload-data-selector
                    :loaded-workloads="loadedWorkloads"
                    :loading-workloads="loadingWorkloads"
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
                :initial-weights="weights"
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

interface Data extends WorkloadActions, WorkloadDataHandler {
  databases: Ref<readonly string[]>;
  tab: Ref<number>;
}

interface WorkloadActions {
  enableEqualizer: Ref<boolean>;
  frequencies: Ref<number[]>;
  actions: Record<string, { active: boolean; loading: boolean }>;
  selectedWorkloads: Ref<Workload[]>;
  weights: Ref<Record<string, number>[]>;
  start: () => void;
  pause: () => void;
  stop: () => void;
  handleFrequencyChange: (index: number, frequency: number) => void;
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
    const workloadActions = useWorkloadActions(context);
    return {
      databases: computed(
        () => context.root.$databaseController.availableDatabasesById.value
      ),
      tab,
      ...workloadActions,
      ...useWorkloadDataHandler(
        context,
        workloadActions.selectedWorkloads,
        workloadActions.weights
      ),
    };
  },
});

function useWorkloadActions(context: SetupContext): WorkloadActions {
  const frequencies = ref<number[]>([]);
  const {
    getLoadedWorkloadData,
    startWorker,
    stopWorker,
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

  // initialize frequency for every workload
  frequencies.value = Object.values(availableWorkloads).map(() => 200);

  // running workload indicator
  getWorkloads().then((response: any) => {
    if (response.data.length > 0) {
      initializeWorkloadSelector(response.data);
    }
    getLoadedWorkloadData().then((response: any) => {
      if (response.data.length > 0) {
        initializeWorkloadActions(response.data);
      }
    });
  });

  function initializeWorkloadSelector(workloads: any): void {
    Object.values(workloads).forEach((workloadData: any) => {
      const workload = getWorkloadFromTransferred(workloadData.folder_name);
      selectedWorkloads.value.push(workload);
      frequencies.value[availableWorkloads.indexOf(workload)] =
        workloadData.frequency;
      updatingWorkload(workload);
    });
  }
  function initializeWorkloadActions(databases: any): void {
    const workersStopped = Object.values(databases).some(
      (database: any) => database.worker_pool_status === "closed"
    );
    const frequenciesAreNull = Object.values(frequencies.value).every(
      (frequency) => frequency === 0
    );
    if (!workersStopped) {
      if (!frequenciesAreNull) {
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
    const index = selectedWorkloads.value.indexOf(workload);
    if (weights.value[index] !== undefined) {
      updateWorkload(
        workload,
        frequencies.value[availableWorkloads.indexOf(workload)],
        weights.value[index]
      );
    } else {
      updateWorkload(
        workload,
        frequencies.value[availableWorkloads.indexOf(workload)],
        {}
      ).then((response: any) => {
        if (response.data.weights)
          handleWeightsChange(index, response.data.weights);
      });
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
  function start(): void {
    context.emit("start");
    startingWorker("start");
  }
  function pause(): void {
    context.emit("pause");
    frequencies.value = Object.values(frequencies.value).map(() => 0);
    updatingWorkloads();
    startingWorker("pause");
  }
  function stop(): void {
    context.emit("stop");
    startLoading("stop");
    stopWorker().then(() => stopLoading("stop"));
  }
  function handleFrequencyChange(index: number, frequency: number): void {
    frequencies.value[index] = frequency;
    const frequenciesAreNull = Object.values(frequencies.value).every(
      (frequency) => frequency === 0
    );
    if (actions.pause.active && !frequenciesAreNull) {
      context.emit("start");
      startLoading("start");
      stopLoading("start");
    }
    if (actions.start.active && frequenciesAreNull) {
      context.emit("pause");
      startLoading("pause");
      stopLoading("pause");
    }
    if (selectedWorkloads.value.includes(availableWorkloads[index])) {
      updatingWorkload(availableWorkloads[index]);
    }
  }
  function handleWorkloadChange(workload: Workload): void {
    const index = selectedWorkloads.value.indexOf(workload);
    if (!selectedWorkloads.value.includes(workload)) {
      selectedWorkloads.value.push(workload);
      startWorkload(
        workload,
        frequencies.value[availableWorkloads.indexOf(workload)]
      ).then(() => updatingWorkload(workload));
    } else {
      selectedWorkloads.value.splice(index, 1);
      weights.value.splice(index, 1);
      stopWorkload(workload);
    }
  }
  function handleWeightChange(
    workload: Workload,
    key: string,
    weight: number
  ): void {
    const index = selectedWorkloads.value.indexOf(workload);
    const changedWeight = weights.value[index];
    changedWeight[key] = weight;
    weights.value.splice(index, 1);
    weights.value.splice(index, 0, changedWeight);
    updatingWorkload(workload);
  }
  function handleWeightsChange(
    index: number,
    changedWeights: Record<string, number>
  ): void {
    weights.value.splice(index, 0, changedWeights);
  }
  return {
    enableEqualizer: computed(() => selectedWorkloads.value.length !== 0),
    frequencies,
    actions,
    selectedWorkloads,
    weights,
    start,
    pause,
    stop,
    handleFrequencyChange,
    handleWorkloadChange,
    handleWeightChange,
  };
}

function useWorkloadDataHandler(
  context: SetupContext,
  selectedWorkloads: Ref<Workload[]>,
  weights: Ref<Record<string, number>[]>
): WorkloadDataHandler {
  const loadedWorkloads = ref<Workload[]>([]);
  const loadingWorkloads = ref<Workload[]>([]);
  const {
    stopWorkload,
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
      // load workload data
      loadWorkloadData(workload).then(() => {
        changeWorkloadData = true;
      });
    } else {
      // stop workload and delete workload data
      const index = selectedWorkloads.value.indexOf(workload);
      selectedWorkloads.value.splice(index, 1);
      weights.value.splice(index, 1);
      stopWorkload(workload);
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
