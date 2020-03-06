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
                :disabled="waitForStartWorkload"
                :loading="waitForStartWorkload"
              >
                <v-icon>
                  mdi-play
                </v-icon>
              </v-btn>
              <v-btn
                @click="startingWorkload(workload, 0)"
                :disabled="waitForPauseWorkload"
                :loading="waitForPauseWorkload"
              >
                <v-icon>
                  mdi-pause
                </v-icon>
              </v-btn>
              <v-btn
                @click="stoppingWorkload()"
                :disabled="waitForStopWorkload"
                :loading="waitForStopWorkload"
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
              v-for="(workload, index) in availableWorkloads"
              :key="workload"
              :label="getDisplayedWorkload(workload)"
              :value="workload"
              @change="checkWorkloadData(workload, index)"
              :loading="waitForWorkloadData[index].value"
              :disabled="waitForWorkloadData[index].value"
            >
            </v-switch>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script lang="ts">
import { SetupContext, defineComponent, ref, Ref } from "@vue/composition-api";
import { Workload, availableWorkloads } from "../../types/workloads";
import { useWorkloadService } from "../../services/workloadService";
import { getDisplayedWorkload } from "../../meta/workloads";

interface Props {
  open: boolean;
}
interface Data {
  availableWorkloads: string[];
  getDisplayedWorkload: (workload: Workload) => string;
  getWorkloadData: () => Promise<string[]>;
  loadWorkloadData: (workload: Workload) => Promise<void>;
  deleteWorkloadData: (workload: Workload) => Promise<void>;
  startWorkload: (workload: Workload, frequency: number) => Promise<void>;
  stopWorkload: () => Promise<void>;
  frequency: Ref<number>;
  workload: Ref<Workload>;
  workloadData: Ref<Workload[]>;
  waitForStartWorkload: Ref<boolean>;
  waitForPauseWorkload: Ref<boolean>;
  startingWorkload: (workload: Workload, frequency: number) => void;
  waitForStopWorkload: Ref<boolean>;
  stoppingWorkload: () => void;
  waitForWorkloadDataValue: Ref<boolean>;
  waitForWorkloadData: Ref<boolean>[];
  checkWorkloadData: (workload: Workload, index: number) => void;
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
    const frequency = ref<number>(200);
    const workload = ref<Workload>("tpch01");
    const waitForStartWorkload = ref<boolean>(false);
    const waitForPauseWorkload = ref<boolean>(false);
    const waitForStopWorkload = ref<boolean>(false);
    const waitForWorkloadDataValue = ref<boolean>(false);
    const waitForWorkloadData: Ref<boolean>[] = [
      waitForWorkloadDataValue,
      waitForWorkloadDataValue,
      waitForWorkloadDataValue,
      waitForWorkloadDataValue
    ];

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
      if (frequency != 0) {
        waitForStartWorkload.value = true;
      } else {
        waitForPauseWorkload.value = true;
      }
      startWorkload(workload, frequency).then(() => {
        waitForStartWorkload.value = false;
        waitForPauseWorkload.value = false;
      });
    }
    function stoppingWorkload(): void {
      waitForStopWorkload.value = true;
      stopWorkload().then(() => {
        waitForStopWorkload.value = false;
      });
    }
    function checkWorkloadData(workload: Workload, index: number): void {
      waitForWorkloadData[index].value = true;
      if (workloadData.value.includes(workload)) {
        loadWorkloadData(workload).then(() => {
          waitForWorkloadData[index].value = false;
        });
      } else {
        deleteWorkloadData(workload).then(() => {
          waitForWorkloadData[index].value = false;
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
      stopWorkload,
      frequency,
      workload,
      workloadData,
      waitForStartWorkload,
      waitForPauseWorkload,
      startingWorkload,
      waitForStopWorkload,
      stoppingWorkload,
      waitForWorkloadDataValue,
      waitForWorkloadData,
      checkWorkloadData,
      closeWorkloadDialog
    };
  }
});
</script>
