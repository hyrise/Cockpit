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
          <div class="plugin" v-for="plugin in plugins" :key="plugin">
            <div class="plugin-name">
              {{ plugin }}
            </div>
            <v-switch
              :disabled="disableAll"
              :loading="isLoading[database.id + '_' + plugin]"
              v-model="activePlugins"
              :value="database.id + '_' + plugin"
              @change="onClickPluginSwitch(database.id, plugin)"
            />
          </div>
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
  onClose: () => void;
}

interface Data {
  showDatabasePanels: Ref<boolean>;
  togglePanelView: () => void;
  databases: Ref<Database[]>;
  plugins: Ref<string[]>;
  activePlugins: Ref<string[]>;
  onClickPluginSwitch: (databaseId: string, plugin: string) => void;
  isLoading: Ref<any>;
  disableAll: Ref<boolean>;
}

export default defineComponent({
  name: "PluginOverview",
  props: {
    onClose: {
      type: Function,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): Data {
    var { databases } = context.root.$databaseService;
    const showDatabasePanels = ref(true);
    const disableAll = ref(false);
    const isLoading: Ref<any> = ref({});
    const plugins: Ref<string[]> = ref([
      "auto-index",
      "ki-stuff",
      "no-more-problems"
    ]);
    const activePlugins: Ref<string[]> = ref([]);
    function togglePanelView(): void {
      showDatabasePanels.value = !showDatabasePanels.value;
    }

    function onClickPluginSwitch(databaseId: string, plugin: string): void {
      isLoading.value[databaseId + "_" + plugin] = true;
      disableAll.value = true;
      const currentPluginIndex = activePlugins.value.findIndex(
        x => x === databaseId + "_" + plugin
      );
      if (currentPluginIndex) {
        // toggle to not active
      } else {
        // toggle to active
      }
      isLoading.value[databaseId + "_" + plugin] = false;
      disableAll.value = false;
    }

    return {
      showDatabasePanels,
      togglePanelView,
      databases,
      plugins,
      onClickPluginSwitch,
      activePlugins,
      isLoading,
      disableAll
    };
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
.plugin-name {
  flex: 0 0 50%;
}
.plugin-overview {
  height: 600px;
  overflow: scroll;
  position: fixed;
  top: 70px;
  z-index: 11;
  width: 500px;
  left: 0px;
}
.close-icon {
  margin-left: auto;
}
.plugin {
  height: 35px;
  display: flex;
  flex-direction: row;
  align-items: center;
}
</style>
