<template>
  <div>
    <div v-for="(frequency, index) in frequencies" :key="index">
      <v-row>
        <v-slider
          class="frequency-slider"
          v-model="frequencies[index]"
          min="0"
          max="1000"
          @click="$emit('change', index, frequency)"
          @end="$emit('change', index, frequency)"
        ></v-slider>
        <v-text-field
          class="frequency-text-field"
          v-model="frequencies[index]"
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
  initialFrequencies: number[];
}

interface Data {
  frequencies: Ref<number[]>;
}

export default defineComponent({
  name: "FrequencyHandler",
  props: {
    initialFrequencies: {
      type: Array,
      default: [],
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const frequencies = ref<number[]>([]);
    watch(
      () => props.initialFrequencies,
      () => {
        frequencies.value = props.initialFrequencies;
      }
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
