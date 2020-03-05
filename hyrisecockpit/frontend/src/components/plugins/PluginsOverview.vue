<template>
  <Moveable
    v-bind="moveable"
    @drag="handleDrag"
    class="moveable"
    className="box"
  >
    <div id="plugin-overview" class="plugin-overview">
      <v-card class="card" color="primary">
        <v-card-title class="white--text">
          Plugins
          <v-icon class="close-icon white--text" @click="onClose()">
            mdi-close
          </v-icon>
        </v-card-title>
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
              <PluginsLog />
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
      </v-card>
    </div>
  </Moveable>
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
import PluginsLog from "./PluginsLog.vue";
import Moveable from "vue-moveable";

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
  handleDrag: any;
  moveable: any;
}

export default defineComponent({
  name: "PluginOverview",
  components: {
    PluginsLog,
    Moveable
  },
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
    const {
      plugins,
      activePlugins,
      updatePlugins
    } = context.root.$pluginService;

    const moveable = {
      draggable: true,
      throttleDrag: 1,
      origin: false,
      edge: false
    };

    function togglePanelView(): void {
      showDatabasePanels.value = !showDatabasePanels.value;
    }

    function onClickPluginSwitch(databaseId: string, plugin: string): void {
      isLoading.value[databaseId + "_" + plugin] = true;
      disableAll.value = true;
      updatePlugins(activePlugins.value);
      isLoading.value[databaseId + "_" + plugin] = false;
      disableAll.value = false;
    }

    function handleDrag({ target, transform }) {
      target.style.transform = transform;
    }

    return {
      showDatabasePanels,
      togglePanelView,
      databases,
      plugins,
      onClickPluginSwitch,
      activePlugins,
      isLoading,
      disableAll,
      handleDrag,
      moveable
    };
  }
});
</script>
<style>
.box {
  color: transparent !important;
  visibility: hidden !important;
}
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
  z-index: 11;
  width: 500px;
  position: fixed;
}
.moveable {
  z-index: 11;
  position: absolute;
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
