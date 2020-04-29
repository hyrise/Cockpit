<template>
  <span>
    <v-btn-toggle>
      <v-btn
        id="start-workload"
        @click="$emit('start')"
        :disabled="actions.start.loading || disabled"
        :loading="actions.start.loading"
        :style="{ color: actions.start.active ? 'green' : '' }"
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
        :style="{ color: actions.pause.active ? 'blue' : '' }"
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
        :style="{ color: actions.stop.active ? 'red' : '' }"
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

interface Props {
  actions: Record<string, { active: boolean; loading: boolean }>;
  disabled: boolean;
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
});
</script>
