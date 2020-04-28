<template>
  <v-radio-group class="mt-0">
    <v-radio
      v-for="workload in availableWorkloads"
      :key="workload"
      :label="getDisplayedWorkload(workload)"
      :value="workload"
      :disabled="!workloadData[workload].loaded || disabled"
      @change="handleWorkloadChange(workload)"
    >
    </v-radio>
  </v-radio-group>
</template>
<script lang="ts">
import { defineComponent, SetupContext } from "@vue/composition-api";
import { Workload, availableWorkloads } from "../../types/workloads";
import { getDisplayedWorkload } from "../../meta/workloads";

interface Props {
  workloadData: Record<string, { loaded: boolean; loading: boolean }>;
  disabled: boolean;
}
interface Data {
  availableWorkloads: string[];
  getDisplayedWorkload: (workload: Workload) => string;
  handleWorkloadChange: (workload: Workload) => void;
}

export default defineComponent({
  name: "WorkloadSelector",
  props: {
    workloadData: {
      type: Object,
      default: null,
    },
    disabled: {
      type: Boolean,
      default: null,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    function handleWorkloadChange(workload: Workload): void {
      context.emit("change", workload);
    }
    return {
      availableWorkloads,
      getDisplayedWorkload,
      handleWorkloadChange,
    };
  },
});
</script>
