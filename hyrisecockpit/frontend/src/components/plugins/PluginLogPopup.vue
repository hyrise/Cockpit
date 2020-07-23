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
      :color="currentPluginLogDatabase.color"
    >
      {{ currentPluginLog && currentPluginLog.message }}
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
  currentPluginLogDatabase: any;
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
    currentPluginLogDatabase: {
      type: Object,
      default: null,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const logDraggableId = "log-popup";

    watch(props, (props) => {
      console.log(props);
    });

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
  position: fixed;
  top: 50%;
  left: 40%;
  z-index: 11;
  width: 400px;
}
.log-text {
  height: 100px;
  overflow: auto;
  font-size: 16px;
}
</style>
