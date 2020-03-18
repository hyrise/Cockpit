<template>
  <div :id="pluginDraggableId" class="plugin-overview">
    <v-card :id="pluginDraggerId" class="card" color="primary" dark>
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
      <v-expansion-panel v-for="database in databases" :key="database">
        <v-expansion-panel-header class="title">
          {{ database }}
        </v-expansion-panel-header>
        <v-expansion-panel-content>
          <div v-for="plugin in plugins" :key="plugin">
            <div class="plugin">
              <div class="plugin-name">
                {{ plugin }}
              </div>
              <v-switch
                :disabled="disableAll"
                :loading="isLoading[database + '_' + plugin]"
                v-model="activePlugins"
                :value="database + '_' + plugin"
                @change="onClickPluginSwitch(database, plugin)"
              />
              <v-icon
                @click="
                  showSettings[database + '_' + plugin] = !showSettings[
                    database + '_' + plugin
                  ]
                "
              >
                mdi-cog
              </v-icon>
            </div>
            <div v-show="showSettings[database + '_' + plugin]">
              test
            </div>
          </div>
          <PluginsLog :logText="pluginLogs[database]" />
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
  ref,
  reactive
} from "@vue/composition-api";
import { Database } from "../../types/database";
import PluginsLog from "./PluginsLog.vue";
import useDragElement from "../../meta/draggable";

interface Props {
  onClose: () => void;
}

interface Data {
  showDatabasePanels: Ref<boolean>;
  togglePanelView: () => void;
  databases: Ref<readonly string[]>;
  plugins: Ref<string[]>;
  activePlugins: Ref<string[]>;
  onClickPluginSwitch: (databaseId: string, plugin: string) => void;
  isLoading: Ref<any>;
  disableAll: Ref<boolean>;
  pluginDraggableId: string;
  pluginDraggerId: string;
  pluginLogs: Ref<any>;
  showSettings: any;
}

export default defineComponent({
  name: "PluginOverview",
  components: {
    PluginsLog
  },
  props: {
    onClose: {
      type: Function,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): Data {
    var { availableDatabasesById } = context.root.$databaseController;
    const showDatabasePanels = ref(true);
    const disableAll = ref(false);
    const isLoading: Ref<any> = ref({});
    const pluginDraggableId: string = "plugin-overview";
    const pluginDraggerId: string = "plugin-card";
    const {
      plugins,
      activePlugins,
      updatePlugins,
      pluginLogs
    } = context.root.$pluginService;
    const showSettings: any = reactive([]);

    function togglePanelView(): void {
      showDatabasePanels.value = !showDatabasePanels.value;
    }

    onMounted(() => {
      // Make the DIV element draggable:
      useDragElement(pluginDraggableId, pluginDraggerId);
    });

    function onClickPluginSwitch(databaseId: string, plugin: string): void {
      isLoading.value[databaseId + "_" + plugin] = true;
      disableAll.value = true;
      updatePlugins(databaseId, plugin).then(() => {
        isLoading.value[databaseId + "_" + plugin] = false;
        disableAll.value = false;
      });
    }

    return {
      showDatabasePanels,
      togglePanelView,
      databases: availableDatabasesById,
      plugins,
      onClickPluginSwitch,
      activePlugins,
      isLoading,
      disableAll,
      pluginDraggableId,
      pluginDraggerId,
      pluginLogs,
      showSettings
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
  position: fixed;
  top: 70px;
  z-index: 11;
  width: 500px;
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
