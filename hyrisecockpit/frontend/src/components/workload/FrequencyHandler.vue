<template>
  <div>
    <div v-for="(frequency, index) in frequencies" :key="index">
      <v-row>
        <v-slider
          v-model="frequencies[index]"
          class="frequency-slider"
          min="0"
          max="1000"
          :disabled="
            !loadedWorkloads.includes(availableWorkloads[index]) || disabled
          "
          @click="$emit('change', index, frequency)"
          @end="$emit('change', index, frequency)"
        ></v-slider>
        <v-text-field
          v-model="frequencies[index]"
          class="frequency-text-field"
          :disabled="
            !loadedWorkloads.includes(availableWorkloads[index]) || disabled
          "
          dense
          @change="$emit('change', index, frequency)"
        ></v-text-field>
      </v-row>
    </div>
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
  initialFrequencies: number[];
  loadedWorkloads: string[];
  disabled: boolean;
}

interface Data {
  frequencies: Ref<number[]>;
}

export default defineComponent({
  name: "FrequencyHandler",
  props: {
    availableWorkloads: {
      type: Array,
      default: () => [],
    },
    initialFrequencies: {
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
    const frequencies = ref<number[]>([]);
    watch(
      () => props.initialFrequencies,
      () => {
        frequencies.value = props.initialFrequencies;
      },
      { immediate: true }
    );
    return {
      frequencies,
    };
  },
});
</script>
<style scoped>
.frequency-slider {
  height: 40px;
}
.frequency-text-field {
  max-width: 20%;
}
.frequency-text-field >>> input {
  text-align: center;
  min-height: 20px;
  margin-bottom: -2px;
}
</style>
