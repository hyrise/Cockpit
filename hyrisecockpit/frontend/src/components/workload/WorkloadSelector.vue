<template>
  <div>
    <v-checkbox
      v-for="workload in availableWorkloads"
      v-model="workloads"
      class="mt-0 pt-0"
      :key="workload"
      :label="getDisplayedWorkload(workload)"
      :value="workload"
      :disabled="!workloadData[workload].loaded || disabled"
      @change="$emit('change', workload)"
    >
    </v-checkbox>
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
        Object.entries(props.workloadData).map(
          ([workload, { selected }]: any) => {
            if (selected) {
              workloads.value.push(workload);
            }
          }
        );
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
