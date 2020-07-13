<template>
  <span>
    <v-btn-toggle>
      <v-btn
        :disabled="actions.start.loading || disabled"
        :loading="actions.start.loading"
        :color="actions.start.active ? colorValueDefinition.green : ''"
        data-id="start-workload"
        @click="$emit('start')"
      >
        <v-icon>
          mdi-play
        </v-icon>
      </v-btn>
      <v-btn
        :disabled="actions.pause.loading || disabled"
        :loading="actions.pause.loading"
        :color="actions.pause.active ? colorValueDefinition.blue : ''"
        data-id="pause-workload"
        @click="$emit('pause')"
      >
        <v-icon>
          mdi-pause
        </v-icon>
      </v-btn>
      <v-btn
        :disabled="actions.stop.loading || disabled"
        :loading="actions.stop.loading"
        :color="actions.stop.active ? colorValueDefinition.red : ''"
        data-id="stop-workload"
        @click="$emit('stop')"
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
