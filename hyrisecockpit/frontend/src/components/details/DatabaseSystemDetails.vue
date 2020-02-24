<template>
  <div>
    <v-card class="card" color="primary" dark @click="togglePanelView()">
      <v-card-title>
        Databases
        <v-icon class="ml-1" v-if="!showDatabasePanels">
          mdi-chevron-down</v-icon
        >
        <v-icon class="ml-1" v-else> mdi-chevron-up</v-icon>
      </v-card-title>
    </v-card>
    <v-expansion-panels v-if="showDatabasePanels" multiple accordion>
      <v-expansion-panel v-for="database in databases" :key="database.id">
        <v-expansion-panel-header class="title">
          {{ database.id }}
        </v-expansion-panel-header>
        <v-expansion-panel-content>
          <div class="entry">
            <v-icon left> mdi-desktop-classic</v-icon> <b>host:</b>
            {{ database.systemDetails.host }}
          </div>
          <div class="entry">
            <v-icon left> mdi-memory</v-icon> <b>main memory capacity:</b>
            {{ database.systemDetails.mainMemoryCapacity }}
          </div>
          <div class="entry">
            <v-icon left> mdi-shoe-print</v-icon> <b>memory footprint:</b>
            {{ database.systemDetails.memoryFootprint }}
          </div>
          <div class="entry">
            <v-icon left> mdi-cpu-64-bit</v-icon> <b>number of CPUs:</b>
            {{ database.systemDetails.numberOfCPUs }}
          </div>
          <div class="entry">
            <v-icon left> mdi-worker</v-icon> <b>number of workers:</b>
            {{ database.systemDetails.numberOfWorkers }}
          </div>
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-expansion-panels>
  </div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref
} from "@vue/composition-api";
import { Database } from "../../types/database";

interface Props {
  databases: Database[];
}
interface Data {
  showDatabasePanels: Ref<boolean>;
  togglePanelView: () => void;
}

export default createComponent({
  name: "DatabaseSystemDetails",
  props: {
    databases: {
      type: Array,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): Data {
    const showDatabasePanels = ref(true);
    function togglePanelView(): void {
      showDatabasePanels.value = !showDatabasePanels.value;
    }
    return { showDatabasePanels, togglePanelView };
  }
});
</script>
<style>
.card {
  margin: 1%, 0%, 1%, 0%;
}
.entry {
  margin-top: 0.5%;
}
</style>
