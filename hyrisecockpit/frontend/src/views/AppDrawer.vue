<template>
  <v-navigation-drawer app fixed width="200" color="grey lighten-3">
    <v-list>
      <v-list-item dense flat>
        <v-list-item-avatar tile size="50" class="ml-0 mt-0 mb-4">
          <img src="../../src/assets/images/hyrise_logo.png" />
        </v-list-item-avatar>
        <img
          class="mb-1"
          height="23"
          src="../../src/assets/images/cockpit_logo.png"
        />
      </v-list-item>
      <v-divider />
      <v-list-item color="#02789D" input-value="true" dense>
        <v-list-item-content>
          <v-list-item-title class="body-2">Metrics</v-list-item-title>
        </v-list-item-content>
        <v-list-item-icon>
          <v-icon
            id="selection-list-button"
            dense
            color="secondary"
            @click="$emit('toggleSelection')"
            >mdi-cog-outline</v-icon
          >
        </v-list-item-icon>
      </v-list-item>

      <v-list-item id="overview-button" :to="{ name: 'overview' }" dense>
        <v-list-item-icon class="mr-2">
          <v-icon>mdi-database-search</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title class="body-2 font-weight-light"
            >Overview</v-list-item-title
          >
        </v-list-item-content>
      </v-list-item>

      <v-list-item id="comparison-button" :to="{ name: 'comparison' }" dense>
        <v-list-item-icon class="mr-2">
          <v-icon>mdi-chart-line</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title class="body-2 font-weight-light"
            >Comparison</v-list-item-title
          >
        </v-list-item-content>
      </v-list-item>

      <v-list-item
        id="workload-monitoring-button"
        :to="{ name: 'workload' }"
        dense
      >
        <v-list-item-icon class="mr-2">
          <v-icon>mdi-chart-bar</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title class="body-2 font-weight-light"
            >Workload Analysis</v-list-item-title
          >
        </v-list-item-content>
      </v-list-item>

      <v-divider />
      <v-list-item color="#02789D" input-value="true" dense>
        <v-list-item-content>
          <v-list-item-title class="body-2">Settings</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <workload-generation
        :open="showWorkloadDialog"
        @close="showWorkloadDialog = false"
      />

      <v-list-item
        id="workload-generation-button"
        @click="showWorkloadDialog = true"
        dense
      >
        <v-list-item-icon class="mr-2">
          <v-icon>mdi-account-cog</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title class="body-2 font-weight-light"
            >Workload</v-list-item-title
          >
        </v-list-item-content>
      </v-list-item>

      <v-list-item
        id="plugin-overview-button"
        @click="$emit('openPlugins')"
        dense
      >
        <v-list-item-icon class="mr-2">
          <v-icon>mdi-tune</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title class="body-2 font-weight-light"
            >Plugins</v-list-item-title
          >
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

      <v-menu bottom offset-x>
        <template v-slot:activator="{ on: menu }">
          <v-list-item
            id="database-list-button"
            v-on="{ ...menu }"
            @click="$emit('closeSelection')"
            dense
          >
            <v-list-item-icon class="mr-2">
              <v-icon>mdi-database-sync</v-icon>
            </v-list-item-icon>
            <v-badge
              id="number-of-databases"
              color="secondary primary--text"
              :content="databaseCount"
              offset-y="1"
              offset-x="40"
            >
            </v-badge>

            <v-list-item-content>
              <v-list-item-title class="body-2 font-weight-light"
                >Databases</v-list-item-title
              >
            </v-list-item-content>
          </v-list-item>
        </template>
        <available-databases-list
          @addDatabase="showAddDatabaseDialog = true"
          @removeDatabase="handleDatabaseDeletion"
        />
      </v-menu>
    </v-list>
    <v-divider />
    <v-footer absolute class="font-weight-medium mb-1" color="grey lighten-3">
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
  computed,
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
    RemoveDatabase,
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
      removedDatabaseId,
    };
  },
});
</script>
<style scoped>
.card-title {
  padding: 16px 0px 16px 0px;
  font-size: 16px;
}
</style>
