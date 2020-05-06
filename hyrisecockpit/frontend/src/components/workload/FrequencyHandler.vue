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
    <v-row>
      <v-col>
        <v-text-field
          id="frequency-field"
          v-model="frequency"
          label="Number of queries per second"
          outlined
          dense
          @change="$emit('change', frequency)"
        ></v-text-field>
      </v-col>
      <v-col class="pl-0" cols="1">
        <v-tooltip right>
          <template v-slot:activator="{ on }">
            <v-icon
              v-on="on"
              class="mt-2"
              :disabled="!enableEqualizer"
              @click="showEqualizer = !showEqualizer"
              >mdi-cog-outline</v-icon
            >
          </template>
          <span>Customize</span>
        </v-tooltip>
      </v-col>
    </v-row>
    <v-row v-if="enableEqualizer && showEqualizer">
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
        @click="$emit('update', weights)"
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

interface Props {
  enableEqualizer: boolean;
  initialWeights: Object;
}
interface Data {
  frequency: Ref<number>;
  showEqualizer: Ref<boolean>;
  weights: Ref<Object>;
}

export default defineComponent({
  name: "FrequencyHandler",
  props: {
    enableEqualizer: {
      type: Boolean,
      default: false,
    },
    initialWeights: {
      type: Object,
      default: {},
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const frequency = ref<number>(200);
    const showEqualizer = ref<boolean>(false);
    const weights = ref<Object>({});
    watch(
      () => props.initialWeights,
      () => {
        weights.value = props.initialWeights;
      }
    );
    return {
      frequency,
      showEqualizer,
      weights,
    };
  },
});
</script>
