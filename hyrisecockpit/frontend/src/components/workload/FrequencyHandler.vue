<template>
  <span>
    <v-slider
      id="frequency-slider"
      v-model="frequency"
      class="mt-10"
      thumb-label="always"
      min="0"
      max="1000"
      @click="$emit('change', frequency)"
    ></v-slider>
    <v-text-field
      id="frequency-field"
      v-model="frequency"
      label="Number of queries per second"
      outlined
      dense
      @change="$emit('change', frequency)"
    ></v-text-field>
  </span>
</template>
<script lang="ts">
import { defineComponent, SetupContext, Ref, ref } from "@vue/composition-api";

interface Data {
  frequency: Ref<number>;
}

export default defineComponent({
  name: "FrequencyHandler",
  setup(props: {}, context: SetupContext): Data {
    const frequency = ref<number>(200);
    return {
      frequency,
    };
  },
});
</script>
