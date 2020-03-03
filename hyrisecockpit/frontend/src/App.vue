<template>
  <v-app :style="{ background: $vuetify.theme.themes['light'].background }">
    <AppDrawer :open="showNavigationDrawer" />
    <v-app-bar app color="primary" dark>
      <v-app-bar-nav-icon @click="toggleNavigationDrawer()">
      </v-app-bar-nav-icon>
      <b> Hyrise Cockpit </b>
      <v-icon class="plugin-icon" @click="togglePluginEditor()">
        mdi-widgets
      </v-icon>
    </v-app-bar>
    <v-content>
      <PluginsOverview v-if="showPluginEditor" :onClose="togglePluginEditor" />
      <router-view />
    </v-content>
  </v-app>
</template>

<script lang="ts">
import { SetupContext, defineComponent, ref, Ref } from "@vue/composition-api";
import AppDrawer from "./views/AppDrawer.vue";
import PluginsOverview from "./components/plugins/PluginsOverview.vue";

interface Data {
  toggleNavigationDrawer: () => void;
  showNavigationDrawer: Ref<boolean>;
  togglePluginEditor: () => void;
  showPluginEditor: Ref<boolean>;
}

export default defineComponent({
  components: { AppDrawer, PluginsOverview },
  setup(props: {}, context: SetupContext): Data {
    const showNavigationDrawer = ref<boolean>(true);
    const showPluginEditor = ref<boolean>(false);

    function toggleNavigationDrawer(): void {
      showNavigationDrawer.value = !showNavigationDrawer.value;
    }

    function togglePluginEditor(): void {
      showPluginEditor.value = !showPluginEditor.value;
    }

    return {
      showNavigationDrawer,
      toggleNavigationDrawer,
      togglePluginEditor,
      showPluginEditor
    };
  }
});
</script>
<style scoped>
.plugin-icon {
  margin-left: auto;
}
</style>
