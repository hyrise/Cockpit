<template>
  <v-navigation-drawer v-model="open" app class="elevation-2" width="110">
    <v-toolbar color="primary" class="text-center">
      <v-img
        src="../../src/components/images/hyrise_logo.png"
        class="ml-2 mb-2"
        max-width="55"
        max-height="55"
      >
      </v-img>
    </v-toolbar>
    <v-card-text
      class="text-center secondary primary--text overline"
      max-height="30"
      >Views</v-card-text
    >
    <v-card class="text-center" elevation="0" :to="{ name: 'overview' }">
      <v-icon class="text-center mt-4" size="40">
        mdi-speedometer
      </v-icon>
      <v-card-text class="justify-center card-title overline pt-1">
        Overview
      </v-card-text>
    </v-card>
    <v-card class="text-center" elevation="0" :to="{ name: 'comparison' }">
      <v-icon class="mt-2" size="40">
        mdi-database-search
      </v-icon>
      <v-card-text class="justify-center card-title overline pt-1">
        Comparison
      </v-card-text>
    </v-card>
    <v-card class="text-center" elevation="0" :to="{ name: 'workload' }">
      <v-icon class="mt-2" size="40">
        mdi-align-vertical-bottom
      </v-icon>
      <v-card-text class="justify-center card-title overline pt-1">
        Workload metrics
      </v-card-text>
    </v-card>
    <v-card-text
      class="text-center secondary primary--text overline"
      max-height="30"
      >Settings</v-card-text
    >
    <workload-generation
      :open="showWorkloadDialog"
      @close="showWorkloadDialog = false"
    />
    <add-database
      :open="showAddDatabaseDialog"
      @close="showAddDatabaseDialog = false"
    />
    <v-menu bottom offset-x>
      <template v-slot:activator="{ on: menu }">
        <v-card class="text-center" elevation="0" v-on="{ ...menu }">
          <v-badge
            color="secondary primary--text"
            :content="databaseCount"
            offset-y="30"
            offset-x="12"
            bordered
          >
            <v-icon class="mt-4" size="40">
              mdi-database-plus
            </v-icon>
          </v-badge>
          <v-card-text class="justify-center card-title overline pt-1">
            Database
          </v-card-text>
        </v-card>
      </template>
      <available-databases-list @addDatabase="showAddDatabaseDialog = true" />
    </v-menu>

    <v-card class="text-center" elevation="0" @click="openWorkloadDialog()">
      <v-icon class="mt-2" size="40">
        mdi-account-cog
      </v-icon>
      <v-card-text class="justify-center overline pt-1">
        Workload Generation
      </v-card-text>
    </v-card>
    <v-card class="text-center" elevation="0" @click="togglePluginEditor()">
      <v-icon class="mt-2" size="40">
        mdi-alpha-p-box
      </v-icon>
      <v-card-text class="justify-center overline pt-1">
        Plugins
      </v-card-text>
    </v-card>
    <v-footer absolute class="font-weight-medium">
      <v-img
        src="../../src/components/images/hpi_logo_bw.png"
        max-width="80"
        max-height="80"
      >
      </v-img>
    </v-footer>
  </v-navigation-drawer>
</template>
​
<script lang="ts">
import {
  SetupContext,
  defineComponent,
  ref,
  Ref,
  computed
} from "@vue/composition-api";
import addDatabase from "../components/addDatabase.vue";
import PluginsOverview from "../components/plugins/PluginsOverview.vue";
import WorkloadGeneration from "../components/workload/WorkloadGeneration.vue";
import AvailableDatabasesList from "@/components/details/AvailableDatabasesList.vue";

interface Props {
  open: boolean;
}

interface Data {
  showPluginEditor: Ref<boolean>;
  togglePluginEditor: () => void;
  showWorkloadDialog: Ref<boolean>;
  openWorkloadDialog: () => void;
  showAddDatabaseDialog: Ref<boolean>;
  databaseCount: Ref<string>;
}

export default defineComponent({
  components: {
    PluginsOverview,
    WorkloadGeneration,
    addDatabase,
    AvailableDatabasesList
  },
  setup(
    props: {
      open: {
        type: Boolean;
        default: true;
      };
    },
    context: SetupContext
  ): Data {
    const showPluginEditor = ref<boolean>(false);
    const showWorkloadDialog = ref<boolean>(false);
    const showAddDatabaseDialog = ref<boolean>(false);

    function togglePluginEditor(): void {
      context.emit("openPlugins");
    }
    function openWorkloadDialog(): void {
      showWorkloadDialog.value = true;
    }

    return {
      showPluginEditor,
      togglePluginEditor,
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
.card-title {
  padding: 16px 0px 16px 0px;
  font-size: 16px;
}
</style>
