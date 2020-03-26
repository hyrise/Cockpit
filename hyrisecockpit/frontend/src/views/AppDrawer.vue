<template>
  <v-navigation-drawer app width="110">
    <v-toolbar class="text-center secondary">
      <v-img
        src="../../src/components/images/hyrise_logo.png"
        class="ml-2 mb-2"
        max-width="55"
        max-height="55"
      >
      </v-img>
    </v-toolbar>
    <v-card-text
      class="text-center primary white--text overline"
      max-height="30"
      >Views</v-card-text
    >
    <v-card
      id="overview-button"
      class="text-center"
      elevation="0"
      :to="{ name: 'overview' }"
    >
      <v-icon class="text-center mt-4" size="40">
        mdi-speedometer
      </v-icon>
      <v-card-text class="justify-center card-title overline pt-1">
        Overview
      </v-card-text>
    </v-card>
    <v-card
      id="comparison-button"
      class="text-center"
      elevation="0"
      :to="{ name: 'comparison' }"
    >
      <v-icon class="mt-2" size="40">
        mdi-database-search
      </v-icon>
      <v-card-text class="justify-center card-title overline pt-1">
        Comparison
      </v-card-text>
    </v-card>
    <v-card
      id="workload-monitoring-button"
      class="text-center"
      elevation="0"
      :to="{ name: 'workload' }"
    >
      <v-icon class="mt-2" size="40">
        mdi-align-vertical-bottom
      </v-icon>
      <v-card-text class="justify-center card-title overline pt-1">
        Workload metrics
      </v-card-text>
    </v-card>
    <v-card-text
      class="text-center primary white--text overline"
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
    <remove-database
      :open="showRemoveDatabaseDialog"
      :database-id="removedDatabaseId"
      @close="showRemoveDatabaseDialog = false"
    />
    <v-menu bottom offset-x>
      <template v-slot:activator="{ on: menu }">
        <v-card
          id="database-list-button"
          class="text-center"
          elevation="0"
          v-on="{ ...menu }"
        >
          <v-badge
            color="secondary primary--text"
            :content="databaseCount"
            offset-y="30"
            offset-x="12"
            bordered
          >
            <v-icon class="mt-4" size="40">
              mdi-database
            </v-icon>
          </v-badge>
          <v-card-text class="justify-center card-title overline pt-1">
            Databases
          </v-card-text>
        </v-card>
      </template>
      <available-databases-list
        @addDatabase="showAddDatabaseDialog = true"
        @removeDatabase="handleDatabaseDeletion"
      />
    </v-menu>

    <v-card
      id="workload-generation-button"
      class="text-center"
      elevation="0"
      @click="showWorkloadDialog = true"
    >
      <v-icon class="mt-2" size="40">
        mdi-account-cog
      </v-icon>
      <v-card-text class="justify-center overline pt-1">
        Workload Generation
      </v-card-text>
    </v-card>
    <v-card
      id="plugin-overview-button"
      class="text-center"
      elevation="0"
      @click="$emit('openPlugins')"
    >
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
import AddDatabase from "@/components/databases/AddDatabase.vue";
import RemoveDatabase from "@/components/databases/RemoveDatabase.vue";
import PluginsOverview from "../components/plugins/PluginsOverview.vue";
import WorkloadGeneration from "../components/workload/WorkloadGeneration.vue";
import AvailableDatabasesList from "@/components/databases/AvailableDatabasesList.vue";
import { Database } from "@/types/database";

interface Props {
  open: boolean;
}

interface Data {
  showPluginEditor: Ref<boolean>;
  showWorkloadDialog: Ref<boolean>;
  showAddDatabaseDialog: Ref<boolean>;
  showRemoveDatabaseDialog: Ref<boolean>;
  databaseCount: Ref<string>;
  handleDatabaseDeletion: (database: Database) => void;
  removedDatabaseId: Ref<string>;
}

export default defineComponent({
  components: {
    PluginsOverview,
    WorkloadGeneration,
    AddDatabase,
    AvailableDatabasesList,
    RemoveDatabase
  },
  setup(props: {}, context: SetupContext): Data {
    const showRemoveDatabaseDialog = ref(false);
    const removedDatabaseId = ref<string>("");
    function handleDatabaseDeletion(database: Database): void {
      removedDatabaseId.value = database.id;
      showRemoveDatabaseDialog.value = true;
    }
    return {
      showPluginEditor: ref(false),
      showWorkloadDialog: ref(false),
      showAddDatabaseDialog: ref(false),
      showRemoveDatabaseDialog,
      databaseCount: computed(() =>
        context.root.$databaseController.availableDatabasesById.value.length.toString()
      ),
      handleDatabaseDeletion,
      removedDatabaseId
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
