<template>
  <v-app :style="{ background: $vuetify.theme.themes['light'].background }">
    <AppDrawer />
    <v-app-bar app color="primary" dark>
      <v-img
        src="../src/components/images/hyrise_logo.png"
        class="mr-2 mb-2"
        max-width="55"
        max-height="55"
      >
      </v-img>
      <v-img
        src="../src/components/images/cockpit_logo.png"
        class="mb-1 mt-1"
        max-width="55"
        max-height="55"
      >
      </v-img>
      <v-spacer />
      <workload-generation
        :open="showWorkloadDialog"
        @close="showWorkloadDialog = false"
      />
      <add-database
        :open="showAddDatabaseDialog"
        @close="showAddDatabaseDialog = false"
      />
      <v-tooltip class="tooltip" bottom>
        <template v-slot:activator="{ on }">
          <v-btn
            color="secondary"
            class="icon"
            v-on="on"
            @click="togglePluginEditor()"
          >
            Plugins
          </v-btn>
        </template>
        <span>Manage Plugins</span>
      </v-tooltip>
      <v-tooltip class="tooltip" bottom right>
        <template v-slot:activator="{ on }">
          <v-btn
            color="secondary"
            class="icon"
            v-on="on"
            @click="openWorkloadDialog()"
            >Workload</v-btn
          >
        </template>
        <span>Generate Workload</span>
      </v-tooltip>
      <v-menu bottom offset-y>
        <template v-slot:activator="{ on: menu }">
          <v-tooltip class="db-tooltip" bottom>
            <template v-slot:activator="{ on: tooltip }">
              <v-badge class="icon" color="secondary" :content="databaseCount">
                <v-icon v-on="{ ...tooltip, ...menu }">mdi-database</v-icon>
              </v-badge>
            </template>
            <span>Manage Databases</span>
          </v-tooltip>
        </template>
        <available-databases-list @addDatabase="showAddDatabaseDialog = true" />
      </v-menu>
    </v-app-bar>
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
import addDatabase from "./components/addDatabase.vue";
import PluginsOverview from "./components/plugins/PluginsOverview.vue";
import WorkloadGeneration from "./components/workload/WorkloadGeneration.vue";
import AvailableDatabasesList from "@/components/details/AvailableDatabasesList.vue";

interface Data {
  togglePluginEditor: () => void;
  showPluginEditor: Ref<boolean>;
  showWorkloadDialog: Ref<boolean>;
  showAddDatabaseDialog: Ref<boolean>;
  openWorkloadDialog: () => void;
  databaseCount: Ref<string>;
}

export default defineComponent({
  components: {
    AppDrawer,
    PluginsOverview,
    WorkloadGeneration,
    addDatabase,
    AvailableDatabasesList
  },
  setup(props: {}, context: SetupContext): Data {
    const showPluginEditor = ref<boolean>(false);
    const showWorkloadDialog = ref<boolean>(false);
    const showAddDatabaseDialog = ref<boolean>(false);

    function togglePluginEditor(): void {
      showPluginEditor.value = !showPluginEditor.value;
    }

    function openWorkloadDialog(): void {
      showWorkloadDialog.value = true;
    }
    return {
      togglePluginEditor,
      showPluginEditor,
      showWorkloadDialog,
      openWorkloadDialog,
      showAddDatabaseDialog,
      databaseCount: computed(() =>
        context.root.$databaseController.availableDatabasesById.value.length.toString()
      )
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
