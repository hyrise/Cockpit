<template>
  <v-dialog v-model="open" persistent max-width="900px">
    <v-card id="workload-generation">
      <v-system-bar :height="50" color="secondary">
        <v-tabs v-model="tab" background-color="grey lighten-1">
          <v-tab> Workload Settings </v-tab>
          <v-tooltip right>
            <template v-slot:activator="{ on }">
              <div v-on="on">
                <v-tab :disabled="!enableEqualizer"> Equalizer </v-tab>
              </div>
            </template>
            <span>{{
              enableEqualizer ? "Customize workload" : "Start a workload first"
            }}</span>
          </v-tooltip>
        </v-tabs>
        <v-spacer></v-spacer>
        <v-icon @click="$emit('close')">mdi-close</v-icon>
      </v-system-bar>

      <v-tabs-items v-model="tab">
        <v-tab-item>
          <v-card flat>
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
                  <v-row>
                    <v-col class="py-0">
                      <frequency-handler
                        :initial-frequency="frequency"
                        @change="handleFrequencyChange"
                      />
                    </v-col>
                    <v-col cols="1">
                      <v-tooltip bottom>
                        <template v-slot:activator="{ on }">
                          <div v-on="on">
                            <v-icon
                              class="mt-8"
                              :disabled="!enableEqualizer"
                              @click="tab = 1"
                              >mdi-cog-outline</v-icon
                            >
                          </div>
                        </template>
                        <span>
                          {{
                            enableEqualizer
                              ? "Customize workload"
                              : "Start a workload first"
                          }}
                        </span>
                      </v-tooltip>
                    </v-col>
                  </v-row>
                  <workload-selector
                    :initial-workload="workload"
                    :workload-data="workloadData"
                    :disabled="disabled"
                    @change="handleWorkloadChange"
                  />
                  <workload-actions
                    :actions="actions"
                    :disabled="
                      disabled ||
                      workload === '' ||
                      !workloadData[workload].loaded
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
                    @change="handleWorkloadDataChange"
                  />
                </v-col>
              </v-row>
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <weights-handler
                :initial-weights="weights"
                :workload="workload"
                @change="handleWeightChange"
              ></weights-handler>
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
import WeightsHandler from "./WeightsHandler.vue";
import WorkloadSelector from "./WorkloadSelector.vue";
import WorkloadActions from "./WorkloadActions.vue";
import WorkloadDataSelector from "./WorkloadDataSelector.vue";

interface Props {
  open: boolean;
}

interface Data extends WorkloadHandler, WorkloadAction, WorkloadDataHandler {
  databases: Ref<readonly string[]>;
  tab: number;
}

interface WorkloadHandler {
  workload: Ref<Workload>;
  handleWorkloadChange: (workload: Workload) => void;
}

interface WorkloadAction {
  enableEqualizer: Ref<boolean>;
  frequency: Ref<number>;
  actions: Record<string, { active: boolean; loading: boolean }>;
  weights: Ref<Object>;
  startingWorkload: () => void;
  pausingWorkload: () => void;
  stoppingWorkload: () => void;
  handleFrequencyChange: (frequency: number) => void;
  handleWeightChange: (weights: Object) => void;
}

interface WorkloadDataHandler {
  workloadData: Record<string, { loaded: boolean; loading: boolean }>;
  runningWorkload: Ref<boolean>;
  disabled: Ref<boolean>;
  handleWorkloadDataChange: (workload: Workload) => void;
}

export default defineComponent({
  name: "WorkloadGeneration",
  components: {
    StatusWarning,
    FrequencyHandler,
    WeightsHandler,
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
    const tab: number = 0;
    const workloadHandler = useWorkloadHandler();
    return {
      databases: computed(
        () => context.root.$databaseController.availableDatabasesById.value
      ),
      tab,
      ...workloadHandler,
      ...useWorkloadAction(workloadHandler.workload),
      ...useWorkloadDataHandler(context),
    };
  },
});

function useWorkloadHandler(): WorkloadHandler {
  const workload = ref<Workload>("");

  function handleWorkloadChange(changedWorkload: Workload): void {
    workload.value = changedWorkload;
  }
  return {
    workload,
    handleWorkloadChange,
  };
}

function useWorkloadAction(workload: Ref<Workload>): WorkloadAction {
  const frequency = ref<number>(200);
  const {
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
  let weights = ref<Object>({});

  getWorkloads().then((response: any) => {
    if (response.data.length > 0) {
      workload.value = getWorkloadFromTransferred(response.data[0].folder_name);
      frequency.value = response.data[0].frequency;
      updatingWorkload().then((response: any) =>
        handleWeightChange(response.data.weights)
      );
      if (frequency.value > 0) {
        actions.start.active = true;
      } else {
        actions.pause.active = true;
      }
    }
  });

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
  function updatingWorkload(): Promise<void> {
    return updateWorkload(workload.value, frequency.value, weights.value);
  }
  function startOrUpdateWorkload(action: string): void {
    getWorkloads().then((response: any) => {
      if (response.data.length === 0) {
        startWorker().then(() => {
          startWorkload(workload.value, frequency.value).then(() => {
            updatingWorkload().then((response: any) => {
              handleWeightChange(response.data.weights);
              stopLoading(action);
            });
          });
        });
      } else {
        updatingWorkload().then(() => stopLoading(action));
      }
    });
  }
  function startingWorkload(): void {
    startLoading("start");
    startOrUpdateWorkload("start");
  }
  function pausingWorkload(): void {
    startLoading("pause");
    frequency.value = 0;
    startOrUpdateWorkload("pause");
  }
  function stoppingWorkload(): void {
    startLoading("stop");
    getWorkloads().then((response: any) => {
      if (response.data.length !== 0) {
        stopWorkload(workload.value).then(() => {
          stopWorker();
          stopLoading("stop");
        });
      }
    });
  }
  function handleFrequencyChange(changedFrequency: number): void {
    frequency.value = changedFrequency;
    if (actions.start.active) {
      updatingWorkload();
    }
  }
  function handleWeightChange(changedWeights: Object): void {
    weights.value = changedWeights;
    updatingWorkload();
  }
  return {
    enableEqualizer: computed(
      () => actions.start.active || actions.pause.active
    ),
    frequency,
    actions,
    weights,
    startingWorkload,
    pausingWorkload,
    stoppingWorkload,
    handleFrequencyChange,
    handleWeightChange,
  };
}

function useWorkloadDataHandler(context: SetupContext): WorkloadDataHandler {
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
  } = useWorkloadService();
  const runningWorkload = ref<boolean>(false);
  let blocked: boolean = false;
  let changeWorkloadData: boolean = true;
  const { emitDatabaseStatusChangedEvent } = useDatabaseEvents();

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
          Object.values(availableWorkloads).forEach((workload: Workload) => {
            workloadData[workload].loading = false;
          });
          Object.keys(workloadData).forEach((workload: string) => {
            workloadData[workload].loaded = false;
          });
          Object.values(loadedWorkloadData).forEach((transferred: string) => {
            workloadData[getWorkloadFromTransferred(transferred)].loaded = true;
          });
        }
      }
    });
  }
  setInterval(updateWorkloadInformation, 1000);
  return {
    workloadData,
    runningWorkload,
    disabled: computed(
      () =>
        blocked ||
        !context.root.$databaseController.availableDatabasesById.value.length ||
        workloadData.tpch01.loading ||
        workloadData.tpch1.loading ||
        workloadData.tpcds.loading ||
        workloadData.job.loading
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
