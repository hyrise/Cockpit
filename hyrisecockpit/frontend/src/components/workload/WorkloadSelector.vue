<template>
  <div>
    <v-checkbox
      v-for="workload in availableWorkloads"
      v-model="workloads"
      class="mt-0 pt-0"
      :key="workload"
      :label="workload"
      :value="workload"
      :disabled="!loadedWorkloads.includes(workload) || disabled"
      data-id="select-workload"
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

interface Props {
  availableWorkloads: string[];
  selectedWorkloads: string[];
  loadedWorkloads: string[];
  disabled: boolean;
}
interface Data {
  workloads: Ref<string[]>;
}

export default defineComponent({
  name: "WorkloadSelector",
  props: {
    availableWorkloads: {
      type: Array,
      default: () => [],
    },
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
    const workloads = ref<string[]>([]);
    watch(
      () => props.selectedWorkloads,
      () => {
        workloads.value = props.selectedWorkloads;
      },
      { immediate: true }
    );
    return {
      workloads,
    };
  },
});
</script>
