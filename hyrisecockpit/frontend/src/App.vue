<template>
  <v-app :style="{ background: $vuetify.theme.themes['light'].background }">
    <AppDrawer />
    <v-app-bar app color="primary" dark>
      <b> Hyrise Cockpit </b>
      <v-spacer />
      <v-tooltip bottom>
        <template v-slot:activator="{ on }">
          <v-icon class="icon" v-on="on" @click="showAddDatabaseDialog = true"
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
          <v-icon class="icon" v-on="on" @click="togglePluginEditor()">
            mdi-widgets
          </v-icon>
        </template>
        <span>Manage Plugins</span>
      </v-tooltip>
      <v-tooltip bottom right>
        <template v-slot:activator="{ on }">
          <v-icon class="icon" v-on="on" @click="openWorkloadDialog()">
            mdi-speedometer
          </v-icon>
        </template>
        <span>Generate Workload</span>
      </v-tooltip>
      <workload-generation
        :open="showWorkloadDialog"
        @close="showWorkloadDialog = false"
      />
      <v-menu bottom offset-y>
        <template v-slot:activator="{ on: menu }">
          <v-tooltip bottom>
            <template v-slot:activator="{ on: tooltip }">
              <v-badge class="icon" color="secondary" :content="databaseCount">
                <v-icon v-on="{ ...tooltip, ...menu }">mdi-database</v-icon>
              </v-badge>
            </template>
            <span>Available Databases</span>
          </v-tooltip>
        </template>
        <available-databases-list />
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
  databaseCount: Ref<number>;
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
      databaseCount: computed(
        () =>
          context.root.$databaseController.availableDatabasesById.value.length
      )
    };
  }
});
</script>
<style scoped>
.icon {
  margin-right: 10px;
}
</style>
