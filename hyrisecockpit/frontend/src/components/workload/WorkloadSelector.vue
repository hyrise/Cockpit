<template>
  <v-radio-group class="mt-0" v-model="workload">
    <v-radio
      v-for="workload in availableWorkloads"
      :key="workload"
      :label="getDisplayedWorkload(workload)"
      :value="workload"
      :disabled="!workloadData[workload].loaded || disabled"
      @change="$emit('change', workload)"
    >
    </v-radio>
  </v-radio-group>
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
  initialWorkload: Workload;
  workloadData: Record<string, { loaded: boolean; loading: boolean }>;
  disabled: boolean;
}
interface Data {
  workload: Ref<Workload>;
  availableWorkloads: string[];
  getDisplayedWorkload: (workload: Workload) => string;
}

export default defineComponent({
  name: "WorkloadSelector",
  props: {
    initialWorkload: {
      type: String,
      default: "",
    },
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
    const workload = ref<Workload>("");
    watch(
      () => props.initialWorkload,
      () => {
        workload.value = props.initialWorkload;
      }
    );
    return {
      workload,
      availableWorkloads,
      getDisplayedWorkload,
    };
  },
});
</script>
