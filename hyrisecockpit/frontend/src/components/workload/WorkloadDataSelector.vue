<template>
  <span>
    <v-switch
      v-for="workload in availableWorkloads"
      v-model="loadedWorkloads"
      class="mt-0 pt-0"
      :key="workload"
      :value="workload"
      :label="getDisplayedWorkload(workload)"
      @change="$emit('change', workload)"
      :loading="workloadData[workload].loading"
      :disabled="workloadData[workload].loading || disabled"
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
  workloadData: Record<string, { loaded: boolean; loading: boolean }>;
  disabled: boolean;
}
interface Data {
  loadedWorkloads: Ref<Workload[]>;
  availableWorkloads: string[];
  getDisplayedWorkload: (workload: Workload) => string;
}

export default defineComponent({
  name: "WorkloadDataSelector",
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
    const loadedWorkloads = ref<Workload[]>([]);
    watch(
      () => props.workloadData,
      () => {
        loadedWorkloads.value = Object.entries(props.workloadData).map(
          ([workload, { loaded }]: any) => {
            if (loaded) {
              return workload;
            }
          }
        );
      }
    );
    return {
      loadedWorkloads,
      availableWorkloads,
      getDisplayedWorkload,
    };
  },
});
</script>
