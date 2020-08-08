<template>
  <div>
    <v-tooltip v-for="workload in availableWorkloads" :key="workload" left>
      <template v-slot:activator="{ on }">
        <v-checkbox
          v-on="on"
          v-model="workloads"
          class="mt-0 pt-0"
          :label="workload"
          :value="workload"
          :disabled="!loadedWorkloads.includes(workload) || disabled"
          data-id="select-workload"
          @change="$emit('change', workload)"
          :color="colorValueDefinition.hyriselogo"
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
import { colorValueDefinition } from "../../meta/colors";

interface Props {
  availableWorkloads: string[];
  selectedWorkloads: string[];
  loadedWorkloads: string[];
  disabled: boolean;
}
interface Data {
  workloads: Ref<string[]>;
  colorValueDefinition: Record<string, string>;
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
      colorValueDefinition,
    };
  },
});
</script>
