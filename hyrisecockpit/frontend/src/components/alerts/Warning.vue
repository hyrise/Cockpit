<template>
  <v-banner
    class="banner mr-2"
    v-model="banner"
    v-if="show"
    single-line
    :color="colorValueDefinition.orange"
    elevation="5"
  >
    <v-icon :color="colorValueDefinition.darkgrey" size="27" class="mr-3">
      mdi-alert-outline
    </v-icon>

    <slot class="mt-6" name="message" />

    <v-btn :color="colorValueDefinition.darkgrey" icon @click="banner = false">
      <v-icon size="20">mdi-close</v-icon>
    </v-btn>
  </v-banner> </template
>y
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  computed,
  Ref,
} from "@vue/composition-api";
import { colorValueDefinition } from "../../meta/colors";

interface Data {
  banner: boolean;
  colorValueDefinition: Record<string, string>;
  show: Ref<boolean>;
}

interface Props {
  condition: any[];
}

export default defineComponent({
  name: "Warning",
  props: {
    condition: {
      type: Array,
      default: () => [],
    },
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      colorValueDefinition,
      banner: true,
      show: computed(() => !props.condition.length),
    };
  },
});
</script>
<style scoped>
.banner {
  border-radius: 4px;
}
</style>
