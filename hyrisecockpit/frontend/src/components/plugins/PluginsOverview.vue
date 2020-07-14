<template>
  <div :id="pluginDraggableId" class="plugin-overview">
    <v-card :id="pluginDraggerId" class="card" color="primary" dark>
      <v-card-title>
        Plugins
        <v-icon class="close-icon" @click="$emit('close')">mdi-close</v-icon>
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
          <div v-for="plugin in availablePlugins" :key="plugin">
            <div class="plugin">
              <div class="plugin-name">{{ plugin }}</div>
              <v-switch
                :id="`${plugin}-switch-button`"
                v-model="activePlugins"
                :disabled="disableAll"
                :loading="isLoading[database + '_' + plugin]"
                :value="database + '_' + plugin"
                @change="onClickPluginSwitch(database, plugin)"
              />
              <v-btn
                :id="`${plugin}-change-button`"
                v-if="canSettingsBeChanged(database, plugin)"
                text
                @click="toggleSettingsView(database, plugin)"
              >
                <v-icon>mdi-cog</v-icon>
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
  reactive,
} from "@vue/composition-api";
import { Database } from "@/types/database";
import PluginsLog from "./PluginsLog.vue";
import PluginSetting from "./PluginSetting.vue";
import useDragElement from "@/meta/draggable";
import DatabaseChip from "@/components/details/DatabaseChip.vue";
import { PluginController } from "@/types/controller";

interface Props {}

interface Data
  extends UsePluginSwitching,
    UsePluginPanelRendering,
    PluginController {
  databases: Ref<readonly string[]>;
  pluginDraggableId: string;
  pluginDraggerId: string;
}

export default defineComponent({
  name: "PluginOverview",
  components: {
    PluginsLog,
    PluginSetting,
    DatabaseChip,
  },
  props: {},
  setup(props: Props, context: SetupContext): Data {
    const pluginDraggableId = "plugin-overview";
    const pluginDraggerId = "plugin-card";

    // Make the DIV element draggable
    onMounted(() => {
      useDragElement(pluginDraggableId, pluginDraggerId);
    });

    return {
      pluginDraggableId,
      pluginDraggerId,
      databases: context.root.$databaseController.availableDatabasesById,
      ...context.root.$pluginController,
      ...usePluginSwitching(context),
      ...usePluginPanelRendering(),
    };
  },
});

interface UsePluginSwitching {
  disableAll: Ref<boolean>;
  isLoading: Ref<Object>;
  canSettingsBeChanged: (databseId: string, pluginId: string) => boolean;
  onClickPluginSwitch: (databaseId: string, plugin: string) => void;
}

function usePluginSwitching(context: SetupContext): UsePluginSwitching {
  const disableAll = ref(false);
  const isLoading: Ref<any> = ref({});

  const {
    pluginSettings,
    changePlugin,
    isActivated,
  } = context.root.$pluginController;

  function canSettingsBeChanged(databseId: string, pluginId: string): boolean {
    return (
      isActivated(databseId, pluginId) &&
      pluginSettings.value[databseId] &&
      pluginSettings.value[databseId][pluginId]
    );
  }

  function onClickPluginSwitch(databaseId: string, plugin: string): void {
    isLoading.value[databaseId + "_" + plugin] = true;
    disableAll.value = true;
    changePlugin(databaseId, plugin).then(() => {
      isLoading.value[databaseId + "_" + plugin] = false;
      disableAll.value = false;
    });
  }

  return { disableAll, isLoading, canSettingsBeChanged, onClickPluginSwitch };
}

interface UsePluginPanelRendering {
  showDatabasePanels: Ref<boolean>;
  showSettings: Ref<Object>;
  togglePanelView: () => void;
  toggleSettingsView: (database: string, plugin: string) => void;
}

function usePluginPanelRendering(): UsePluginPanelRendering {
  const showDatabasePanels = ref(true);
  const showSettings: any = ref({});

  function togglePanelView(): void {
    showDatabasePanels.value = !showDatabasePanels.value;
  }

  function toggleSettingsView(database: string, plugin: string): void {
    showSettings.value[database + "_" + plugin] = !showSettings.value[
      database + "_" + plugin
    ];
  }

  return {
    showDatabasePanels,
    showSettings,
    togglePanelView,
    toggleSettingsView,
  };
}
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
