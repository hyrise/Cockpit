<template>
  <v-expansion-panels flat>
    <v-expansion-panel>
      <v-expansion-panel-header flat>
        <div class="log">
          log
        </div>
      </v-expansion-panel-header>
      <v-expansion-panel-content>
        <v-textarea
          class="log-text"
          readonly
          solo
          label="log"
          value="ClusterPlugin [20:15:35]: Checked, no changes needed
IndexPlugin.   [20:16:12]: Created index on lineitem.l_shopdate
ClusterPlugin [20:16:31]: Reclustered orders table
ClusterPlugin [20:15:35]: Checked, no changes needed
IndexPlugin.   [20:16:12]: Created index on lineitem.l_shopdate
ClusterPlugin [20:16:31]: Reclustered orders table
ClusterPlugin [20:15:35]: Checked, no changes needed
IndexPlugin.   [20:16:12]: Created index on lineitem.l_shopdate
ClusterPlugin [20:16:31]: Reclustered orders table
ClusterPlugin [20:15:35]: Checked, no changes needed
IndexPlugin.   [20:16:12]: Created index on lineitem.l_shopdate
ClusterPlugin [20:16:31]: Reclustered orders table
ClusterPlugin [20:15:35]: Checked, no changes needed
IndexPlugin.   [20:16:12]: Created index on lineitem.l_shopdate
ClusterPlugin [20:16:31]: Reclustered orders table"
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
    onMounted(() => {});

    return {};
  }
});
</script>
<style>
.log {
  text-align: right;
}
.log-text {
  margin-bottom: -40px !important;
}
</style>
