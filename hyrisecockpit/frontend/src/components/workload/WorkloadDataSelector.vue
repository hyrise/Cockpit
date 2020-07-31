<template>
  <span>
    <v-switch
      v-for="workload in availableWorkloads"
      v-model="workloads"
      class="mt-0 pt-0"
      :key="workload"
      :value="workload"
      :label="workload"
      :loading="loadingWorkloads.includes(workload)"
      :disabled="loadingWorkloads.includes(workload) || disabled"
      data-id="select-workload-data"
      @change="$emit('change', workload)"
    />
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

interface Props {
  availableWorkloads: string[];
  loadedWorkloads: string[];
  loadingWorkloads: string[];
  disabled: boolean;
}
interface Data {
  workloads: Ref<string[]>;
}

export default defineComponent({
  name: "WorkloadDataSelector",
  props: {
    availableWorkloads: {
      type: Array,
      default: () => [],
    },
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
    const workloads = ref<string[]>([]);
    watch(
      () => props.loadedWorkloads,
      () => {
        workloads.value = props.loadedWorkloads;
      },
      { immediate: true }
    );
    return {
      workloads,
    };
  },
});
</script>
