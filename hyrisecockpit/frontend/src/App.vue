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
      <workload-generation
        :open="showWorkloadDialog"
        @close="showWorkloadDialog = false"
      />
      <v-btn class=" white--text mr-5" @click="openWorkloadDialog()"
        >Generate Workload</v-btn
      >
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
import WorkloadGeneration from "./components/workload/WorkloadGeneration.vue";

interface Data {
  showNavigationDrawer: Ref<boolean>;
  togglePluginEditor: () => void;
  showPluginEditor: Ref<boolean>;
  toggleNavigationDrawer: () => void;
  showWorkloadDialog: Ref<boolean>;
  openWorkloadDialog: () => void;
}

export default defineComponent({
  components: { AppDrawer, PluginsOverview, WorkloadGeneration },
  setup(props: {}, context: SetupContext): Data {
    const showNavigationDrawer = ref<boolean>(true);
    const showPluginEditor = ref<boolean>(false);
    const showWorkloadDialog = ref<boolean>(false);

    function toggleNavigationDrawer(): void {
      showNavigationDrawer.value = !showNavigationDrawer.value;
    }

    function togglePluginEditor(): void {
      showPluginEditor.value = !showPluginEditor.value;
    }

    function openWorkloadDialog(): void {
      showWorkloadDialog.value = true;
    }
    return {
      showNavigationDrawer,
      toggleNavigationDrawer,
      togglePluginEditor,
      showPluginEditor,
      showWorkloadDialog,
      openWorkloadDialog
    };
  }
});
</script>
<style scoped>
.plugin-icon {
  margin-left: auto;
  margin-right: 10px;
}
</style>
