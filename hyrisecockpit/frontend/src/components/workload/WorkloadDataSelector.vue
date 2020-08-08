<template>
  <v-container class="pl-5 py-0">
    <v-tooltip v-for="workload in availableWorkloads" :key="workload" left>
      <template v-slot:activator="{ on }">
        <v-switch
          v-on="on"
          v-model="workloads"
          class="mt-0 pt-0"
          :value="workload"
          :label="workload"
          :loading="loadingWorkloads.includes(workload)"
          :disabled="loadingWorkloads.includes(workload) || disabled"
          data-id="select-workload-data"
          @change="$emit('change', workload)"
          :color="colorValueDefinition.hyriselogo"
        />
      </template>
      <span>
        {{ loadedWorkloads.includes(workload) ? "Remove" : "Load" }}
      </span>
    </v-tooltip>
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
import { colorValueDefinition } from "../../meta/colors";

interface Props {
  availableWorkloads: string[];
  loadedWorkloads: string[];
  loadingWorkloads: string[];
  disabled: boolean;
}
interface Data {
  workloads: Ref<string[]>;
  colorValueDefinition: Record<string, string>;
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
      colorValueDefinition,
    };
  },
});
</script>
