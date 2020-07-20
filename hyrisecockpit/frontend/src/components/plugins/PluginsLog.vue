<template>
  <v-expansion-panels flat>
    <v-expansion-panel>
      <v-expansion-panel-header flat @click="scrollToBottom(300, true)">
        <div class="log" data-id="plugin-log">Plugin log messages</div>
      </v-expansion-panel-header>
      <v-expansion-panel-content class="content">
        <v-textarea
          :id="`${database}-log-text`"
          class="log-text"
          readonly
          solo
          label="Plugin log messages"
          :value="logMessages"
          data-id="plugin-log-area"
        ></v-textarea>
      </v-expansion-panel-content>
    </v-expansion-panel>
  </v-expansion-panels>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  computed,
  Ref,
  ref,
  watch,
} from "@vue/composition-api";

interface Props {
  logText: string;
  database: string;
}
interface Data {
  logMessages: Ref<string>;
}

export default defineComponent({
  name: "PluginsLog",
  props: {
    logText: {
      type: String,
      default: "",
    },
    database: {
      type: String,
      default: "",
    },
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      logMessages: computed(() => {
        if (props.logText == "") return "No messages";
        return props.logText;
      }),
      ...useAutoScroll(props, context),
    };
  },
});

/** Scroll textbox to the latest log entry */
function useAutoScroll(
  props: Props,
  context: SetupContext
): {
  scrollToBottom: () => void;
} {
  watch(
    () => props.logText,
    () => {
      scrollToBottom();
    },
    { immediate: true }
  );

  function scrollToBottom(offset = 0, force = false): void {
    setTimeout(() => {
      const textBox = document.getElementById(`${props.database}-log-text`);
      /* stop scrolling, if it was manually scrolled to the top with an offset of 200px */
      if (
        textBox &&
        (textBox.scrollHeight - textBox.scrollTop < 200 || force)
      ) {
        textBox.scrollTop = textBox.scrollHeight;
      }
    }, offset);
  }

  return { scrollToBottom };
}
</script>
<style>
.log {
  text-align: right;
}
.content {
  margin: 0px -26px 0px -26px;
}
.log-text {
  margin-bottom: -40px !important;
  font-size: 14px;
}
</style>
