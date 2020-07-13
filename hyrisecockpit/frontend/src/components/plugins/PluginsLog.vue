<template>
  <v-expansion-panels flat>
    <v-expansion-panel>
      <v-expansion-panel-header flat>
        <div class="log" data-id="plugin-log">Plugin log messages</div>
      </v-expansion-panel-header>
      <v-expansion-panel-content class="content">
        <v-textarea
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
  onMounted,
  computed,
  Ref,
  ref,
} from "@vue/composition-api";

interface Props {
  logText: string;
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
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      logMessages: computed(() => {
        if (props.logText == "") return "No messages";
        return props.logText;
      }),
    };
  },
});
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
