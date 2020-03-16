<template>
  <v-app :style="{ background: $vuetify.theme.themes['light'].background }">
    <AppDrawer />
    <v-app-bar app color="primary" dark>
      <b> Hyrise Cockpit </b>
      <v-tooltip bottom>
        <template v-slot:activator="{ on }">
          <v-icon
            class="database-icon"
            v-on="on"
            @click="showAddDatabaseDialog = true"
            >mdi-database-plus</v-icon
          >
        </template>
        <span>Add Database</span>
      </v-tooltip>
      <add-database
        :open="showAddDatabaseDialog"
        @close="showAddDatabaseDialog = false"
      />
      <v-tooltip bottom>
        <template v-slot:activator="{ on }">
          <v-icon class="plugin-icon" v-on="on" @click="togglePluginEditor()">
            mdi-widgets
          </v-icon>
        </template>
        <span>Manage Plugins</span>
      </v-tooltip>
      <v-tooltip bottom right>
        <template v-slot:activator="{ on }">
          <v-icon v-on="on" @click="openWorkloadDialog()">
            mdi-speedometer
          </v-icon>
        </template>
        <span>Generate Workload</span>
      </v-tooltip>
      <workload-generation
        :open="showWorkloadDialog"
        @close="showWorkloadDialog = false"
      />
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
import addDatabase from "./components/addDatabase.vue";
import PluginsOverview from "./components/plugins/PluginsOverview.vue";
import WorkloadGeneration from "./components/workload/WorkloadGeneration.vue";

interface Data {
  showNavigationDrawer: Ref<boolean>;
  togglePluginEditor: () => void;
  showPluginEditor: Ref<boolean>;
  toggleNavigationDrawer: () => void;
  showWorkloadDialog: Ref<boolean>;
  showAddDatabaseDialog: Ref<boolean>;
  openWorkloadDialog: () => void;
}

export default defineComponent({
  components: { AppDrawer, PluginsOverview, WorkloadGeneration, addDatabase },
  setup(props: {}, context: SetupContext): Data {
    const showNavigationDrawer = ref<boolean>(true);
    const showPluginEditor = ref<boolean>(false);
    const showWorkloadDialog = ref<boolean>(false);
    const showAddDatabaseDialog = ref<boolean>(false);

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
      openWorkloadDialog,
      showAddDatabaseDialog
    };
  }
});
</script>
<style scoped>
.plugin-icon {
  margin-right: 10px;
}
.database-icon {
  margin-right: 10px;
  margin-left: auto;
}
</style>
