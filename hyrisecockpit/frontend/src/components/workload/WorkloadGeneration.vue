<template>
  <v-dialog v-model="open" persistent max-width="750px">
    <v-card>
      <v-system-bar>
        <v-spacer></v-spacer>
        <v-icon @click="closeWorkloadDialog()">mdi-close</v-icon>
      </v-system-bar>
      <v-card-title class="justify-center">
        Workload Generation
      </v-card-title>
      <v-card-text class="pb-0">
        <v-row>
          <v-col max-width="300px">
            <b> Start, pause and stop workload </b>
            <v-slider
              v-model="frequency"
              class="mt-10"
              thumb-label="always"
              min="0"
              max="1000"
              step="10"
            >
              <template v-slot:append>
                <v-text-field
                  v-model="frequency"
                  class="mt-n1 pt-0"
                  style="width: 50px"
                  step="10"
                ></v-text-field>
              </template>
            </v-slider>
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
              <v-btn @click="startWorkload(workload, frequency)">
                <v-icon>
                  mdi-play
                </v-icon>
              </v-btn>
              <v-btn @click="startWorkload(workload, 0)">
                <v-icon>
                  mdi-pause
                </v-icon>
              </v-btn>
              <v-btn @click="stopWorkload()">
                <v-icon>
                  mdi-stop
                </v-icon>
              </v-btn>
            </v-btn-toggle>
          </v-col>
          <v-divider vertical class="ml-4 mr-4" />
          <v-col>
            <b> Load and remove generated data into/from instances</b>
            <v-radio-group v-model="workloadData">
              <v-radio
                v-for="workload in availableWorkloads"
                :key="workload"
                :label="getDisplayedWorkload(workload)"
                :value="workload"
              >
              </v-radio>
            </v-radio-group>
            <v-btn-toggle>
              <v-btn @click="loadWorkloadData(workloadData)">
                <v-icon>
                  mdi-plus
                </v-icon>
              </v-btn>
              <v-btn @click="deleteWorkloadData(workloadData)">
                <v-icon>
                  mdi-minus
                </v-icon>
              </v-btn>
            </v-btn-toggle>
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
  loadWorkloadData: (workload: Workload) => void;
  deleteWorkloadData: (workload: Workload) => void;
  startWorkload: (workload: Workload, frequency: number) => void;
  stopWorkload: () => void;
  frequency: Ref<number>;
  workload: Ref<string>;
  workloadData: Ref<string>;
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
    const workload = ref<string>("tpch01");
    const workloadData = ref<string>("tpch01");
    const {
      loadWorkloadData,
      deleteWorkloadData,
      startWorkload,
      stopWorkload
    } = useWorkloadService();

    function closeWorkloadDialog(): void {
      context.emit("close");
    }
    return {
      availableWorkloads,
      getDisplayedWorkload,
      loadWorkloadData,
      deleteWorkloadData,
      startWorkload,
      stopWorkload,
      frequency,
      workload,
      workloadData,
      closeWorkloadDialog
    };
  }
});
</script>
