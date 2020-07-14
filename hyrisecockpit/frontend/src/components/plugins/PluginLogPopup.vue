<template>
  <div v-if="currentPluginLog" class="plugin-overview">
    <v-card>
      <v-card-title>
        Plugin Log
      </v-card-title>
    </v-card>
    <v-textarea
      class="log-text"
      readonly
      solo
      label="Plugin log messages"
      :value="currentPluginLog"
      data-id="chart-plugin-log-area"
    ></v-textarea>
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
} from "@vue/composition-api";

interface Props {
  currentPluginLog: string;
}
interface Data {}

export default defineComponent({
  name: "PluginLogPopup",
  props: {
    currentPluginLog: {
      type: String,
      default: "",
    },
  },
  setup(props: Props, context: SetupContext): void {
    onMounted(() => {
      console.log(props);
    });
  },
});
</script>
<style>
.plugin {
  position: fixed;
  top: 20px;
  right: 10px;
  z-index: 11;
  width: 500px;
}
.log-text {
  font-size: 16px;
}
</style>
