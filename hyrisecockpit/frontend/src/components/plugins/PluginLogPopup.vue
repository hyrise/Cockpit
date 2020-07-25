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
      data-id="chart-plugin-log-alert"
      elevation="20"
      :color="currentPluginLogDatabaseColor"
    >
      <div v-if="!!currentPluginLog">
        <div class="header-row">
          <div class="log-header">
            {{ currentPluginLog.header }}
          </div>
          <v-btn @click="onClose()" icon>
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
  currentPluginLogDatabaseColor: string;
  currentPluginLogMetricId: string;
}
interface Data {
  logDraggableId: string;
  onClose: () => void;
}

export default defineComponent({
  name: "PluginLogPopup",
  props: {
    currentPluginLog: {
      type: Object,
      default: null,
    },
    currentPluginLogDatabaseColor: {
      type: String,
      default: null,
    },
    currentPluginLogMetricId: {
      type: String,
      default: null,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const logDraggableId = "log-popup" + props.currentPluginLogMetricId;

    function onClose() {
      props.currentPluginLog = null;
    }

    onMounted(() => {
      useDragElement(logDraggableId, logDraggableId);
    });

    return {
      logDraggableId,
      onClose,
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
  width: 400px;
}
.log-text {
  height: 100px;
  overflow: auto;
  font-size: 16px;
}
.log-header {
  font-weight: bold;
  font-size: 16px;
}
.header-row {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
}
</style>
