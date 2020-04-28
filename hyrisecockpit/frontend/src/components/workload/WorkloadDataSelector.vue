<template>
  <span>
    <v-switch
      class="mt-0 pt-0"
      v-for="workload in availableWorkloads"
      :key="workload"
      :input-value="workloadData[workload].loaded"
      :label="getDisplayedWorkload(workload)"
      @change="handleWorkloadDataChange(workload)"
      :loading="workloadData[workload].loading"
      :disabled="workloadData[workload].loading || disabled"
    >
    </v-switch>
  </span>
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
  handleWorkloadDataChange: (workload: Workload) => void;
}

export default defineComponent({
  name: "WorkloadDataSelector",
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
    function handleWorkloadDataChange(workload: Workload): void {
      context.emit("change", workload);
    }
    return {
      availableWorkloads,
      getDisplayedWorkload,
      handleWorkloadDataChange,
    };
  },
});
</script>
