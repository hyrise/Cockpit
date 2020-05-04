<template>
  <v-dialog v-model="open" persistent max-width="900px">
    <v-card id="workload-generation">
      <v-system-bar :height="50">
        <v-card-title>
          Workload Settings
        </v-card-title>
        <v-spacer></v-spacer>
        <v-icon @click="$emit('close')">mdi-close</v-icon>
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
            <frequency-handler
              :initial-frequency="frequency"
              @change="handleFrequencyChange"
            />
            <workload-selector
              :initial-workload="workload"
              :workload-data="workloadData"
              :disabled="disabled"
              @change="handleWorkloadChange"
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
              @change="handleWorkloadDataChange"
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

interface Data extends WorkloadHandler, WorkloadAction, WorkloadDataHandler {
  databases: Ref<readonly string[]>;
}

interface WorkloadHandler {
  workload: Ref<Workload>;
  handleWorkloadChange: (workload: Workload) => void;
}

interface WorkloadAction {
  frequency: Ref<number>;
  actions: Record<string, { active: boolean; loading: boolean }>;
  startingWorkload: () => void;
  pausingWorkload: () => void;
  stoppingWorkload: () => void;
  handleFrequencyChange: (frequency: number) => void;
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
    const workloadHandler = useWorkloadHandler();

    return {
      databases: computed(
        () => context.root.$databaseController.availableDatabasesById.value
      ),
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

  getWorkloads().then((response: any) => {
    if (response.data.length > 0) {
      workload.value = getWorkloadFromTransferred(response.data[0].folder_name);
      frequency.value = response.data[0].frequency;
      frequency.value > 0
        ? (actions.start.active = true)
        : (actions.pause.active = true);
    }
  });

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
  return {
    frequency,
    actions,
    startingWorkload,
    pausingWorkload,
    stoppingWorkload,
    handleFrequencyChange,
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
              benchmark !== "no-ops_0_1" &&
              benchmark !== "no-ops_1"
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
