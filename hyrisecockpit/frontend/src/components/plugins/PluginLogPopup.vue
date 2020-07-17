<template>
  <div
    :id="logDraggableId"
    class="log-popup"
    :style="{ 'z-index': currentPluginLog ? '11' : '-1' }"
  >
    <v-alert
      :value="currentPluginLog"
      :toggle="toggleView"
      text
      dismissible
      data-id="chart-plugin-log-alert"
      elevation="20"
      :color="currentPluginLogDatabase.color"
    >
      {{ currentPluginLog }}
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
  currentPluginLog: string;
  currentPluginLogDatabase: any;
}
interface Data {
  logDraggableId: string;
  toggleView: () => void;
}

export default defineComponent({
  name: "PluginLogPopup",
  props: {
    currentPluginLog: {
      type: String,
      default: "",
    },
    currentPluginLogDatabase: {
      type: Object,
      default: null,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const logDraggableId = "log-popup";

    function toggleView(): void {
      console.log("test");
      props.currentPluginLog = "";
      console.log(props);
    }

    onMounted(() => {
      useDragElement(logDraggableId, logDraggableId);
    });

    return {
      logDraggableId,
      toggleView,
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
