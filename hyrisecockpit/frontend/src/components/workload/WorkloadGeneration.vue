<template>
  <v-dialog v-model="open" persistent max-width="600px">
    <v-card>
      <v-card-text>
        <div class="mx-12">
          <v-col cols="12">
            <div class="mb-2 mt-2">
              <b> Start, pause and stop workload </b>
            </div>
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
                  type="number"
                  style="width: 60px"
                  step="10"
                ></v-text-field>
              </template>
            </v-slider>
            <v-radio-group v-model="workload">
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

            <div class="mb-2 mt-6">
              <b> Load and remove generated data into/from instances</b>
            </div>
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
        </div>
      </v-card-text>
      <v-card-actions>
        <v-spacer />
        <v-btn color="primary" text @click="closeWorkloadDialog()">Close</v-btn>
      </v-card-actions>
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
  workload: Ref<String>;
  workloadData: Ref<String>;
}

export default defineComponent({
  props: {
    open: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    closeWorkloadDialog() {
      this.$emit("close");
    }
  },
  setup(context: SetupContext): Data {
    const frequency = ref<number>(200);
    const workload = ref<String>("tpch01");
    const workloadData = ref<String>("tpch01");
    const {
      loadWorkloadData,
      deleteWorkloadData,
      startWorkload,
      stopWorkload
    } = useWorkloadService();

    return {
      availableWorkloads,
      getDisplayedWorkload,
      loadWorkloadData,
      deleteWorkloadData,
      startWorkload,
      stopWorkload,
      frequency,
      workload,
      workloadData
    };
  }
});
</script>
