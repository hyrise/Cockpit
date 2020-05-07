<template>
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
  initialWeights: Object;
}
interface Data {
  weights: Ref<Object>;
}

export default defineComponent({
  name: "WeightsHandler",
  props: {
    initialWeights: {
      type: Object,
      default: {},
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
    };
  },
});
</script>
