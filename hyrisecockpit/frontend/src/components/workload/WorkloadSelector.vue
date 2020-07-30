<template>
  <div>
    <v-tooltip v-for="workload in availableWorkloads" :key="workload" left>
      <template v-slot:activator="{ on }">
        <v-checkbox
          v-on="on"
          v-model="workloads"
          class="mt-0 pt-0"
          :label="getDisplayedWorkload(workload)"
          :value="workload"
          :disabled="!loadedWorkloads.includes(workload) || disabled"
          data-id="select-workload"
          @change="$emit('change', workload)"
        >
        </v-checkbox>
      </template>
      <span>
        {{ selectedWorkloads.includes(workload) ? "Stop" : "Start" }}
      </span>
    </v-tooltip>
  </div>
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
  selectedWorkloads: Workload[];
  loadedWorkloads: Workload[];
  disabled: boolean;
}
interface Data {
  workloads: Ref<Workload[]>;
  availableWorkloads: string[];
  getDisplayedWorkload: (workload: Workload) => string;
}

export default defineComponent({
  name: "WorkloadSelector",
  props: {
    selectedWorkloads: {
      type: Array,
      default: () => [],
    },
    loadedWorkloads: {
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
      () => props.selectedWorkloads,
      () => {
        workloads.value = props.selectedWorkloads;
      },
      { immediate: true }
    );
    return {
      workloads,
      availableWorkloads,
      getDisplayedWorkload,
    };
  },
});
</script>
