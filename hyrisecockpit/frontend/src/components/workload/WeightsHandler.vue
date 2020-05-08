<template>
  <span>
    <p class="subtitle-1 font-weight-medium">
      {{ getDisplayedWorkload(workload) }}
    </p>
    <v-row>
      <v-slider
        v-model="weights[key]"
        v-for="(weight, key) in weights"
        :key="key"
        :label="key"
        :value="weight"
        thumb-label
        thumb-size="20"
        min="0"
        max="200"
        vertical
        @click="$emit('change', weights)"
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
} from "@vue/composition-api";
import { Workload } from "../../types/workloads";
import { getDisplayedWorkload } from "../../meta/workloads";

interface Props {
  initialWeights: Object;
  workload: Workload;
}

interface Data {
  weights: Ref<Object>;
  getDisplayedWorkload: (workload: Workload) => void;
}

export default defineComponent({
  name: "WeightsHandler",
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
    const weights = ref<Object>({});
    watch(
      () => props.initialWeights,
      () => {
        weights.value = props.initialWeights;
      }
    );
    return {
      weights,
      getDisplayedWorkload,
    };
  },
});
</script>
