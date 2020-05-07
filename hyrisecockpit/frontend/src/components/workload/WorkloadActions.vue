<template>
  <span>
    <v-btn-toggle>
      <v-btn
        id="start-workload"
        @click="$emit('start')"
        :disabled="actions.start.loading || disabled"
        :loading="actions.start.loading"
        :color="actions.start.active ? colorValueDefinition.green : ''"
      >
        <v-icon>
          mdi-play
        </v-icon>
      </v-btn>
      <v-btn
        id="pause-workload"
        @click="$emit('pause')"
        :disabled="actions.pause.loading || disabled"
        :loading="actions.pause.loading"
        :color="actions.pause.active ? colorValueDefinition.blue : ''"
      >
        <v-icon>
          mdi-pause
        </v-icon>
      </v-btn>
      <v-btn
        id="stop-workload"
        @click="$emit('stop')"
        :disabled="actions.stop.loading || disabled"
        :loading="actions.stop.loading"
        :color="actions.stop.active ? colorValueDefinition.red : ''"
      >
        <v-icon>
          mdi-stop
        </v-icon>
      </v-btn>
    </v-btn-toggle>
  </span>
</template>
<script lang="ts">
import { defineComponent, SetupContext } from "@vue/composition-api";
import { colorValueDefinition } from "../../meta/colors";

interface Props {
  actions: Record<string, { active: boolean; loading: boolean }>;
  disabled: boolean;
}

interface Data {
  colorValueDefinition: Record<string, string>;
}

export default defineComponent({
  name: "WorkloadActions",
  props: {
    actions: {
      type: Object,
      default: {},
    },
    disabled: {
      type: Boolean,
      default: false,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      colorValueDefinition,
    };
  },
});
</script>
