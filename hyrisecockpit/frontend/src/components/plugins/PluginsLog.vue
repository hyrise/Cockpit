<template>
  <v-expansion-panels flat>
    <v-expansion-panel>
      <v-expansion-panel-header flat>
        <div class="log">
          log
        </div>
      </v-expansion-panel-header>
      <v-expansion-panel-content class="content">
        <v-textarea
          class="log-text"
          readonly
          solo
          label="log"
          :value="logText"
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
  ref
} from "@vue/composition-api";

interface Props {
  logText: string;
}
interface Data {}

export default defineComponent({
  name: "PluginsLog",
  props: {
    logText: {
      type: String,
      default: ""
    }
  },
  setup(props: Props, context: SetupContext): Data {
    return {};
  }
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
