<template>
  <div id="plugin-overview" class="plugin-overview">
    <v-card class="card" color="primary" dark>
      <v-card-title>
        Plugins
        <v-icon class="close-icon" @click="onClose()">
          mdi-close
        </v-icon>
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
          <v-switch loading />
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-expansion-panels>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref
} from "@vue/composition-api";
import { Database } from "../../types/database";

interface Props {
  handleScroll: boolean;
  onClose: () => void;
}
interface Data {
  showDatabasePanels: Ref<boolean>;
  togglePanelView: () => void;
  databases: Ref<Database[]>;
}

export default defineComponent({
  name: "PluginOverview",
  props: {
    handleScroll: {
      type: Boolean,
      default: true
    },
    onClose: {
      type: Function,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): Data {
    var { databases } = context.root.$databaseService;
    const showDatabasePanels = ref(true);

    function togglePanelView(): void {
      showDatabasePanels.value = !showDatabasePanels.value;
    }
    return { showDatabasePanels, togglePanelView, databases };
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
.plugin-overview {
  position: fixed;
  top: 70px;
  z-index: 11;
  width: 500px;
  left: 0px;
}
.close-icon {
  margin-left: auto;
}
</style>
