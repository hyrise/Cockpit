<template>
  <div
    :id="logDraggableId"
    class="log-popup"
    :style="{
      'z-index': currentPluginLog ? '11' : '-1',
    }"
  >
    <v-alert dense data-id="chart-plugin-log-alert" elevation="5" color="white">
      <div v-if="!!currentPluginLog" class="primary--text">
        <div class="caption mt-n3 header-row">
          <div class="log-header">
            {{ currentPluginLog.header }}
          </div>
          <v-btn @click="$emit('close')" icon class="mr-n4">
            <v-icon small>mdi-close-box</v-icon>
          </v-btn>
        </div>
        <div class="caption mb-n3 log-text-area">
          {{ currentPluginLog.message }}
        </div>
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
  width: 40%;
  height: 40%;
}
.log-text-area {
  height: 90px;
  overflow: auto;
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
