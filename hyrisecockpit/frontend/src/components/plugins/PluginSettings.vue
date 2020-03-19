<template>
  <v-text-field />
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
  availableSettings: any;
}

interface Data {}

export default defineComponent({
  name: "PluginSettings",
  props: {
    dataBaseId: {
      type: String,
      default: ""
    },
    pluginId: {
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
</style>
