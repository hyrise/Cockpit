<template>
  <v-container class="mt-0 pt-0">
    <v-checkbox
      v-model="workloads"
      class="mt-0 pt-0"
      v-for="workload in availableWorkloads"
      :key="workload"
      :label="getDisplayedWorkload(workload)"
      :value="workload"
      :disabled="!workloadData[workload].loaded || disabled"
      @change="$emit('change', workload)"
    >
    </v-checkbox>
  </v-container>
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
  workloadData: Record<
    string,
    { loaded: boolean; loading: boolean; selected: boolean }
  >;
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
    workloadData: {
      type: Object,
      default: {},
    },
    disabled: {
      type: Boolean,
      default: false,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const workloads = ref<Workload[]>([]);
    watch(
      () => props.workloadData,
      () => {
        workloads.value = [];
        Object.entries(props.workloadData).forEach((workload: any) => {
          if (workload[1].selected) {
            workloads.value.push(workload[0]);
          }
        });
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
