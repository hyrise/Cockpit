<template>
  <div class="setting-row">
    <div class="setting-name">
      test:
    </div>
    <v-text-field />
  </div>
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
  databaseId: string;
  pluginId: string;
  settings: any;
}

interface Data {}

export default defineComponent({
  name: "PluginSettings",
  props: {
    databaseId: {
      type: String,
      default: ""
    },
    pluginId: {
      type: String,
      default: ""
    },
    settings: {
      type: Array,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): Data {
    console.log(props);
    return {};
  }
});
</script>
<style>
.setting-name {
  margin-right: 5px;
  flex: 0 0 40%;
}
.setting-row {
  margin-top: -10px;
  display: flex;
  flex-direction: row;
  align-items: baseline;
}
</style>
