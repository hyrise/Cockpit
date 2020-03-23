<template>
  <v-app :style="{ background: $vuetify.theme.themes['light'].background }">
    <AppDrawer @openPlugins="togglePluginEditor()" />
    <v-content>
      <PluginsOverview v-if="showPluginEditor" :onClose="togglePluginEditor" />
      <router-view />
    </v-content>
  </v-app>
</template>

<script lang="ts">
import {
  SetupContext,
  defineComponent,
  ref,
  Ref,
  computed
} from "@vue/composition-api";
import AppDrawer from "./views/AppDrawer.vue";
import PluginsOverview from "./components/plugins/PluginsOverview.vue";

interface Data {
  togglePluginEditor: () => void;
  showPluginEditor: Ref<boolean>;
}

export default defineComponent({
  components: {
    AppDrawer,
    PluginsOverview
  },
  setup(props: {}, context: SetupContext): Data {
    const showPluginEditor = ref<boolean>(false);

    function togglePluginEditor(): void {
      showPluginEditor.value = !showPluginEditor.value;
    }
    return {
      togglePluginEditor,
      showPluginEditor
    };
  }
});
</script>
<style scoped>
.icon {
  margin-right: 10px;
}
.tooltip {
  z-index: 10;
}
.db-tooltip {
  z-index: 1;
}
</style>
