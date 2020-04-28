<template>
  <span>
    <v-btn-toggle>
      <v-btn
        id="start-workload"
        @click="startingWorkload()"
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
        @click="pausingWorkload()"
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
        @click="stoppingWorkload()"
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
interface Data {
  startingWorkload: () => void;
  pausingWorkload: () => void;
  stoppingWorkload: () => void;
}

export default defineComponent({
  name: "WorkloadActions",
  props: {
    actions: {
      type: Object,
      default: null,
    },
    disabled: {
      type: Boolean,
      default: null,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    function startingWorkload(): void {
      context.emit("start");
    }
    function pausingWorkload(): void {
      context.emit("pause");
    }
    function stoppingWorkload(): void {
      context.emit("stop");
    }
    return {
      startingWorkload,
      pausingWorkload,
      stoppingWorkload,
    };
  },
});
</script>
