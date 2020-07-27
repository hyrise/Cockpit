<template>
  <v-navigation-drawer app fixed width="134" color="grey lighten-4">
    <v-list subheader>
      <v-list-item>
        <v-list-item-avatar tile size="71" class="mt-0 mb-0 mr-0 ml-4">
          <img src="../../src/assets/images/hyrise_logo.png" />
        </v-list-item-avatar>
      </v-list-item>
      <v-list-item-title
        class="body-3 font-weight-regular text--secondary mt-0 mb-0 ml-9"
        >Cockpit</v-list-item-title
      >
      <v-list-item
        :color="colorValueDefinition.hyriselogo"
        input-value="true"
        dense
      >
        <v-list-item-content>
          <v-list-item-title class="subtitle-2 ml-3 mt-5 mb-n2"
            >Monitoring</v-list-item-title
          >
        </v-list-item-content>
        <v-list-item-btn class="mr-0 mt-6">
          <v-icon
            size="18"
            dense
            color="secondary"
            data-id="selection-list-button"
            @click="$emit('toggleSelection')"
            >mdi-cog-outline</v-icon
          >
        </v-list-item-btn>
      </v-list-item>
      <v-list-item
        :to="{ name: 'overview' }"
        data-id="overview-button"
        :color="colorValueDefinition.hyriselogo"
      >
        <v-icon class="ml-8 mb-4">mdi-database-search</v-icon>
        <div class="caption ml-n9 mt-10 font-weight-regular-light">
          Overview
        </div>
      </v-list-item>

      <v-list-item
        :to="{ name: 'comparison' }"
        data-id="comparison-button"
        :color="colorValueDefinition.hyriselogo"
      >
        <v-icon class="ml-8 mb-4">mdi-chart-line</v-icon>
        <div class="caption ml-n11 mt-10 font-weight-regular-light">
          Comparison
        </div>
      </v-list-item>

      <v-list-item
        :to="{ name: 'workload' }"
        data-id="workload-monitoring-button"
        :color="colorValueDefinition.hyriselogo"
      >
        <v-icon class="ml-8 mb-4">mdi-chart-bar</v-icon>
        <div class="caption ml-n15 mt-10 font-weight-regular-light">
          Workload Analysis
        </div>
      </v-list-item>
      <v-list-item
        :color="colorValueDefinition.hyriselogo"
        input-value="true"
        dense
      >
        <v-list-item-content>
          <v-list-item-title class="subtitle-2 ml-2 mt-4 mb-n2"
            >Configuration</v-list-item-title
          >
        </v-list-item-content>
      </v-list-item>

      <workload-generation
        :open="showWorkloadDialog"
        @close="showWorkloadDialog = false"
        @start="changeWorkloadIndicator('start')"
        @stop="changeWorkloadIndicator('stop')"
      />

      <v-list-item
        @click="showWorkloadDialog = true"
        data-id="workload-generation-button"
      >
        <v-icon class="ml-8 mb-4">mdi-account-cog</v-icon>
        <v-badge
          v-if="workloadIndicator.icon != ''"
          :icon="workloadIndicator.icon"
          :color="colorValueDefinition[workloadIndicator.color]"
          offset-y="-7"
          offset-x="36"
          class="primary--text"
        ></v-badge>

        <div class="caption ml-n9 mt-10 font-weight-regular-light">
          Workload
        </div>
      </v-list-item>

      <v-list-item
        @click="$emit('openPlugins')"
        data-id="plugin-overview-button"
      >
        <v-icon class="ml-8 mb-4">mdi-tune</v-icon>

        <div class="caption ml-n8 mt-10 font-weight-regular-light">Plugins</div>
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
            v-on="{ ...menu }"
            data-id="database-list-button"
            @click="$emit('closeSelection')"
          >
            <v-icon class="ml-8 mb-4 font-weight-regular-light"
              >mdi-database-sync</v-icon
            >
            <v-badge
              color="secondary"
              :content="databaseCount"
              offset-y="-7"
              offset-x="36"
              data-id="number-of-databases"
            ></v-badge>

            <div class="caption ml-n10 mt-10 font-weight-regular-light">
              Databases
            </div>
          </v-list-item>
        </template>
        <available-databases-list
          @addDatabase="showAddDatabaseDialog = true"
          @removeDatabase="handleDatabaseDeletion"
        />
      </v-menu>
    </v-list>
    <v-spacer class="spacer mt-12 pt-5"></v-spacer>
    <v-img
      class="ml-8"
      src="../../src/assets/images/hpi_logo_bw.png"
      max-width="65"
      max-height="65"
    ></v-img>
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
