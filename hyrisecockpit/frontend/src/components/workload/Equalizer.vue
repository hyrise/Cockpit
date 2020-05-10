<template>
  <span>
    <p class="subtitle-1 font-weight-medium">
      {{ getDisplayedWorkload(workload) }}
    </p>
    <v-row>
      <v-slider
        v-for="weight in weights"
        v-model="weight.weight"
        :key="weight.name"
        :label="weight.name"
        :value="weight.weight"
        thumb-label
        thumb-size="20"
        min="0"
        max="200"
        vertical
        @click="$emit('change', weight.name, weight.weight)"
      >
      </v-slider>
    </v-row>
  </span>
</template>
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  watch,
  reactive,
} from "@vue/composition-api";
import { Workload } from "../../types/workloads";
import { getDisplayedWorkload } from "../../meta/workloads";

interface Props {
  initialWeights: Object;
  workload: Workload;
}

interface Data {
  weights: Ref<{ name: string; weight: number }[]>;
  getDisplayedWorkload: (workload: Workload) => void;
}

export default defineComponent({
  name: "Equalizer",
  props: {
    initialWeights: {
      type: Object,
      default: {},
    },
    workload: {
      type: String,
      default: "",
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const weights = ref<{ name: string; weight: number }[]>([]);
    watch(
      () => props.initialWeights,
      () => {
        weights.value = [];
        Object.entries(props.initialWeights)
          .sort()
          .forEach(([name, weight]: any) => {
            weights.value.push({ name: name, weight: weight });
          });
      }
    );
    return {
      weights,
      getDisplayedWorkload,
    };
  },
});
</script>
