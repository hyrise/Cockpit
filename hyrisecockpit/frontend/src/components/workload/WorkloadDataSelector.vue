<template>
  <span>
    <v-switch
      v-for="workload in availableWorkloads"
      v-model="workloads"
      class="mt-0 pt-0"
      :key="workload"
      :value="workload"
      :label="getDisplayedWorkload(workload)"
      @change="$emit('change', workload)"
      :loading="loadingWorkloads.includes(workload)"
      :disabled="loadingWorkloads.includes(workload) || disabled"
      data-id="select-workload-data"
    >
    </v-switch>
  </span>
</template>
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  watch,
} from "@vue/composition-api";
import { Workload, availableWorkloads } from "../../types/workloads";
import { getDisplayedWorkload } from "../../meta/workloads";

interface Props {
  loadedWorkloads: Workload[];
  loadingWorkloads: Workload[];
  disabled: boolean;
}
interface Data {
  workloads: Ref<Workload[]>;
  availableWorkloads: string[];
  getDisplayedWorkload: (workload: Workload) => string;
}

export default defineComponent({
  name: "WorkloadDataSelector",
  props: {
    loadedWorkloads: {
      type: Array,
      default: () => [],
    },
    loadingWorkloads: {
      type: Array,
      default: () => [],
    },
    disabled: {
      type: Boolean,
      default: false,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const workloads = ref<Workload[]>([]);
    watch(
      () => props.loadedWorkloads,
      () => {
        workloads.value = props.loadedWorkloads;
      }
    );
    return {
      workloads,
      availableWorkloads,
      getDisplayedWorkload,
    };
  },
});
</script>
