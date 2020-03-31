<template>
  <v-navigation-drawer
    v-model="drawer"
    permanent
    absolute
    app
    width="220"
    fixed="true"
  >
    <v-list>
      <v-list-item two-line>
        <v-list-item-avatar tile="true">
          <img src="../../src/components/images/hyrise_logo.png" />
        </v-list-item-avatar>
        <v-list-item-content>
          <v-list-item-title>Cockpit</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>
      <!-- <v-list-item
          v-for="item in items"
          :key="item.title"
          link
          > -->
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>Views</v-list-item-title>
        </v-list-item-content>

        <v-list-item-icon>
          <v-icon>mdi-cog-outline</v-icon>
        </v-list-item-icon>
      </v-list-item>

      <v-list-item :to="{ name: 'overview' }">
        <v-list-item-icon>
          <v-icon>mdi-speedometer</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>Overview</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-list-item :to="{ name: 'comparison' }">
        <v-list-item-icon>
          <v-icon>mdi-database-search</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>Comparison</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-list-item :to="{ name: 'workload' }">
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
          <v-list-item v-on="{ ...menu }">
            <v-list-item-icon>
              <v-icon>mdi-database-plus</v-icon>
            </v-list-item-icon>
            <v-badge
              color="secondary primary--text"
              :content="databaseCount"
              offset-y="1"
              offset-x="40"
              bordered
            >
            </v-badge>

            <v-list-item-content>
              <v-list-item-title>Database</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
        <available-databases-list @addDatabase="showAddDatabaseDialog = true" />
      </v-menu>

      <workload-generation
        :open="showWorkloadDialog"
        @close="showWorkloadDialog = false"
      />

      <v-list-item @click="openWorkloadDialog()">
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

      <v-list-item @click="togglePluginEditor()">
        <v-list-item-icon>
          <v-icon>mdi-alpha-p-box</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>Plugins</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>
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
