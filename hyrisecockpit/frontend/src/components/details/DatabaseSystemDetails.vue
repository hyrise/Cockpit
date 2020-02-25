<template>
  <div id="details">
    <v-card class="card" color="primary" dark @click="togglePanelView()">
      <v-card-title>
        Databases
        <v-icon class="ml-1" v-if="!showDatabasePanels">
          mdi-chevron-down
        </v-icon>
        <v-icon class="ml-1" v-else> mdi-chevron-up</v-icon>
      </v-card-title>
    </v-card>
    <v-expansion-panels
      class="panels"
      v-if="showDatabasePanels"
      multiple
      accordion
    >
      <v-expansion-panel v-for="database in databases" :key="database.id">
        <v-expansion-panel-header class="title">
          <v-avatar
            class="mr-2"
            size="20"
            max-width="20"
            max-height="20"
            :color="database.color"
          />
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
  handleScroll: boolean;
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
    },
    handleScroll: {
      type: Boolean,
      default: true
    }
  },
  setup(props: Props, context: SetupContext): Data {
    const showDatabasePanels = ref(true);
    let details: any = null;
    let detailsPageOffset = 0;

    onMounted(() => {
      details = document.getElementById("details");
      detailsPageOffset = details!.offsetTop;
      if (props.handleScroll)
        window.onscroll = function() {
          handleScrollEvent();
        };
    });

    function handleScrollEvent(): void {
      if (window.pageYOffset > detailsPageOffset) {
        details.classList.add("sticky");
      } else {
        details.classList.remove("sticky");
      }
    }

    function togglePanelView(): void {
      showDatabasePanels.value = !showDatabasePanels.value;
    }
    return { showDatabasePanels, togglePanelView };
  }
});
</script>
<style>
.panels {
  margin-top: 0.5%;
}
.card {
  margin: 1%, 0%, 1%, 0%;
}
.entry {
  margin-top: 0.5%;
}
.sticky {
  position: fixed;
  top: 70px;
  z-index: 10;
  width: 500px;
  right: 0px;
}
</style>
