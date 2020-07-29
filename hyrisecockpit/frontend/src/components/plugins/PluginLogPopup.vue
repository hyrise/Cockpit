<template>
  <div
    :id="logDraggableId"
    class="log-popup"
    :style="{
      'z-index': currentPluginLog ? '11' : '-1',
    }"
  >
    <v-alert
      text
      dense
      data-id="chart-plugin-log-alert"
      elevation="20"
      :color="databaseColor"
    >
      <div v-if="!!currentPluginLog" class="primary--text">
        <div class="header-row">
          <div class="log-header">
            {{ currentPluginLog.header }}
          </div>
          <v-btn @click="$emit('close')" icon>
            <v-icon>mdi-close</v-icon>
          </v-btn>
        </div>
        {{ currentPluginLog.message }}
      </div>
    </v-alert>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch,
} from "@vue/composition-api";
import useDragElement from "@/meta/draggable";

interface Props {
  currentPluginLog: any;
  databaseColor: string;
  metricId: string;
  onClose: () => void;
}
interface Data {
  logDraggableId: string;
}

export default defineComponent({
  name: "PluginLogPopup",
  props: {
    currentPluginLog: {
      type: Object,
      default: null,
    },
    databaseColor: {
      type: String,
      default: null,
    },
    metricId: {
      type: String,
      default: null,
    },
    onClose: {
      type: Function,
      default: () => {},
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const logDraggableId = "log-popup" + props.metricId;

    onMounted(() => {
      useDragElement(logDraggableId, logDraggableId);
    });

    return {
      logDraggableId,
    };
  },
});
</script>
<style>
.log-popup {
  position: absolute;
  top: 20%;
  left: 40%;
  z-index: 11;
  width: 50%;
  height: 50%;
}

.log-header {
  font-weight: bold;
}
.header-row {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
}
</style>
