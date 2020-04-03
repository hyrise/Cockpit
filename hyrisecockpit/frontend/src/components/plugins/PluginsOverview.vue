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
          <v-list-item class="item">
            <database-chip :database-id="database" />
          </v-list-item>
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
              <v-btn
                v-if="canSettingsBeChanged(database, plugin)"
                @click="toggleSettingsView(database, plugin)"
                text
              >
                <v-icon>
                  mdi-cog
                </v-icon>
              </v-btn>
            </div>
            <v-expand-transition>
              <div v-if="showSettings[database + '_' + plugin]">
                <div
                  v-for="setting in pluginSettings[database][plugin]"
                  :key="setting.name"
                >
                  <PluginSetting
                    :setting="setting"
                    :databaseId="database"
                    :pluginId="plugin"
                  />
                </div>
              </div>
            </v-expand-transition>
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
import PluginSetting from "./PluginSetting.vue";
import useDragElement from "../../meta/draggable";
import DatabaseChip from "../details/DatabaseChip.vue";

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
  toggleSettingsView: (database: string, plugin: string) => void;
  pluginSettings: Ref<any>;
  canSettingsBeChanged: (databseId: string, pluginId: string) => boolean;
}

export default defineComponent({
  name: "PluginOverview",
  components: {
    PluginsLog,
    PluginSetting,
    DatabaseChip
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
      pluginLogs,
      pluginSettings
    } = context.root.$pluginService;

    const showSettings: any = reactive({});

    function toggleSettingsView(database: string, plugin: string): void {
      showSettings[database + "_" + plugin] = !showSettings[
        database + "_" + plugin
      ];
    }

    function canSettingsBeChanged(
      databseId: string,
      pluginId: string
    ): boolean {
      return (
        activePlugins.value.find(x => x === databseId + "_" + pluginId) &&
        pluginSettings.value[databseId] &&
        pluginSettings.value[databseId][pluginId]
      );
    }

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
      showSettings,
      toggleSettingsView,
      pluginSettings,
      canSettingsBeChanged
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
  top: 20px;
  right: 10px;
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
.item {
  padding: 0px;
}
</style>
