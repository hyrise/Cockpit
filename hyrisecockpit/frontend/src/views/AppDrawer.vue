<template>
  <v-navigation-drawer app fixed width="250">
    <v-list>
      <v-list-item two-line>
        <v-list-item-avatar tile>
          <img src="../../src/assets/images/hyrise_logo.png" />
        </v-list-item-avatar>
        <v-list-item-content>
          <v-list-item-title><b>Cockpit</b></v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-divider />
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>Views</v-list-item-title>
        </v-list-item-content>
        <v-list-item-icon>
          <v-icon id="selection-list-button" @click="$emit('openSelection')"
            >mdi-cog-outline</v-icon
          >
        </v-list-item-icon>
      </v-list-item>

      <v-list-item id="overview-button" :to="{ name: 'overview' }">
        <v-list-item-icon>
          <v-icon>mdi-speedometer</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>Overview</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-list-item id="comparison-button" :to="{ name: 'comparison' }">
        <v-list-item-icon>
          <v-icon>mdi-database-search</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>Comparison</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-list-item id="workload-monitoring-button" :to="{ name: 'workload' }">
        <v-list-item-icon>
          <v-icon>mdi-align-vertical-bottom</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>Workload Metrics</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>Settings</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-menu bottom offset-x>
        <template v-slot:activator="{ on: menu }">
          <v-list-item id="database-list-button" v-on="{ ...menu }">
            <v-list-item-icon>
              <v-icon>mdi-database</v-icon>
            </v-list-item-icon>
            <v-badge
              id="number-of-databases"
              color="secondary primary--text"
              :content="databaseCount"
              offset-y="1"
              offset-x="40"
              bordered
            >
            </v-badge>

            <v-list-item-content>
              <v-list-item-title>Databases</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
        <available-databases-list
          @addDatabase="showAddDatabaseDialog = true"
          @removeDatabase="handleDatabaseDeletion"
        />
      </v-menu>

      <workload-generation
        :open="showWorkloadDialog"
        @close="showWorkloadDialog = false"
      />

      <v-list-item
        id="workload-generation-button"
        @click="showWorkloadDialog = true"
      >
        <v-list-item-icon>
          <v-icon>mdi-account-cog</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>Workload</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <add-database
        :open="showAddDatabaseDialog"
        @close="showAddDatabaseDialog = false"
      />
      <remove-database
        :open="showRemoveDatabaseDialog"
        :database-id="removedDatabaseId"
        @close="showRemoveDatabaseDialog = false"
      />

      <v-list-item id="plugin-overview-button" @click="$emit('openPlugins')">
        <v-list-item-icon>
          <v-icon>mdi-alpha-p-box</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>Plugins</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>

    <v-footer absolute class="font-weight-medium">
      <v-img
        src="../../src/assets/images/hpi_logo_bw.png"
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
import WorkloadGeneration from "../components/workload/WorkloadGeneration.vue";
import AvailableDatabasesList from "@/components/databases/AvailableDatabasesList.vue";
import { Database } from "@/types/database";

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
