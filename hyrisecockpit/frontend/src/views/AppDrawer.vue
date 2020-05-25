<template>
  <v-navigation-drawer app fixed width="200" color="grey lighten-4">
    <v-list subheader>
      <v-list-item>
        <v-list-item-avatar tile size="70" class="mt-0 mb-2 mr-2">
          <img src="../../src/assets/images/hyrise_logo.png" />
        </v-list-item-avatar>
        <v-list-item-title
          class="title font-weight-regular text--secondary mt-2"
          >Cockpit</v-list-item-title
        >
      </v-list-item>
      <v-divider />
      <v-list-item color="#02789D" input-value="true" dense>
        <v-list-item-content>
          <v-list-item-title class="body-2 ml-1"
            >Analysis Views</v-list-item-title
          >
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
      <v-divider />

      <v-list-item id="overview-button" :to="{ name: 'overview' }">
        <v-list-item-icon class="mr-4 ml-1">
          <v-icon>mdi-database-search</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title class="body-2 font-weight-light"
            >Overview</v-list-item-title
          >
        </v-list-item-content>
      </v-list-item>

      <v-list-item id="comparison-button" :to="{ name: 'comparison' }">
        <v-list-item-icon class="mr-4 ml-1">
          <v-icon>mdi-chart-line</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title class="body-2 font-weight-light"
            >Comparison</v-list-item-title
          >
        </v-list-item-content>
      </v-list-item>

      <v-list-item id="workload-monitoring-button" :to="{ name: 'workload' }">
        <v-list-item-icon class="mr-4 ml-1">
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
          <v-list-item-title class="body-2 ml-1">Settings</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
      <v-divider />

      <workload-generation
        :open="showWorkloadDialog"
        @close="showWorkloadDialog = false"
        @start="changeWorkloadIndicator('start')"
        @pause="changeWorkloadIndicator('pause')"
        @stop="changeWorkloadIndicator('stop')"
      />

      <v-list-item
        id="workload-generation-button"
        @click="showWorkloadDialog = true"
      >
        <v-list-item-icon class="mr-4 ml-1">
          <v-icon>mdi-account-cog</v-icon>
        </v-list-item-icon>
        <v-badge
          v-if="workloadIndicator.icon != ''"
          :icon="workloadIndicator.icon"
          :color="colorValueDefinition[workloadIndicator.color]"
          offset-y="1"
          offset-x="50"
          class="primary--text"
        >
        </v-badge>

        <v-list-item-content>
          <v-list-item-title class="body-2 font-weight-light"
            >Workload</v-list-item-title
          >
        </v-list-item-content>
      </v-list-item>

      <v-list-item id="plugin-overview-button" @click="$emit('openPlugins')">
        <v-list-item-icon class="mr-4 ml-1">
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
          >
            <v-list-item-icon class="mr-4 ml-1">
              <v-icon>mdi-database-sync</v-icon>
            </v-list-item-icon>
            <v-badge
              id="number-of-databases"
              color="secondary"
              :content="databaseCount"
              offset-y="1"
              offset-x="50"
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
      <v-divider />
    </v-list>

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
  reactive,
} from "@vue/composition-api";
import AddDatabase from "@/components/databases/AddDatabase.vue";
import RemoveDatabase from "@/components/databases/RemoveDatabase.vue";
import WorkloadGeneration from "../components/workload/WorkloadGeneration.vue";
import AvailableDatabasesList from "@/components/databases/AvailableDatabasesList.vue";
import { Database } from "@/types/database";
import { colorValueDefinition } from "../meta/colors";

interface Data {
  showPluginEditor: Ref<boolean>;
  showWorkloadDialog: Ref<boolean>;
  showAddDatabaseDialog: Ref<boolean>;
  showRemoveDatabaseDialog: Ref<boolean>;
  databaseCount: Ref<string>;
  handleDatabaseDeletion: (database: Database) => void;
  changeWorkloadIndicator: (action: string) => void;
  removedDatabaseId: Ref<string>;
  colorValueDefinition: Record<string, string>;
  workloadIndicator: Record<string, string>;
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
    const workloadIndicator: Record<string, string> = reactive({
      icon: "",
      color: "",
    });
    const removedDatabaseId = ref<string>("");
    function handleDatabaseDeletion(database: Database): void {
      removedDatabaseId.value = database.id;
      showRemoveDatabaseDialog.value = true;
    }
    function changeWorkloadIndicator(action: string): void {
      if (action === "start") {
        workloadIndicator.icon = "mdi-play";
        workloadIndicator.color = "green";
      } else if (action === "pause") {
        workloadIndicator.icon = "mdi-pause";
        workloadIndicator.color = "blue";
      } else {
        workloadIndicator.icon = "mdi-stop";
        workloadIndicator.color = "red";
      }
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
      changeWorkloadIndicator,
      removedDatabaseId,
      colorValueDefinition,
      workloadIndicator,
    };
  },
});
</script>
<style scoped>
.v-list-item {
  padding-top: 4px;
  padding-bottom: 4px;
}
</style>
