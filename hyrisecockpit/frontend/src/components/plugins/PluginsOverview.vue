<template>
  <div id="plugin-overview" class="plugin-overview">
    <v-card id="plugin-card" class="card" color="primary" dark>
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
          <PluginsLog />
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
import PluginsLog from "./PluginsLog.vue";

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
    var { databases } = context.root.$databaseService;
    const showDatabasePanels = ref(true);
    const disableAll = ref(false);
    const isLoading: Ref<any> = ref({});
    const {
      plugins,
      activePlugins,
      updatePlugins
    } = context.root.$pluginService;

    function togglePanelView(): void {
      showDatabasePanels.value = !showDatabasePanels.value;
    }

    onMounted(() => {
      // Make the DIV element draggable:
      dragElement(document.getElementById("plugin-overview"));

      function dragElement(elmnt) {
        var pos1 = 0,
          pos2 = 0,
          pos3 = 0,
          pos4 = 0;
        if (document.getElementById("plugin-card")) {
          // if present, the header is where you move the DIV from:
          document.getElementById("plugin-card").onmousedown = dragMouseDown;
        } else {
          // otherwise, move the DIV from anywhere inside the DIV:
          elmnt.onmousedown = dragMouseDown;
        }

        function dragMouseDown(e) {
          e = e || window.event;
          e.preventDefault();
          // get the mouse cursor position at startup:
          pos3 = e.clientX;
          pos4 = e.clientY;
          document.onmouseup = closeDragElement;
          // call a function whenever the cursor moves:
          document.onmousemove = elementDrag;
        }

        function elementDrag(e) {
          e = e || window.event;
          e.preventDefault();
          // calculate the new cursor position:
          pos1 = pos3 - e.clientX;
          pos2 = pos4 - e.clientY;
          pos3 = e.clientX;
          pos4 = e.clientY;
          // set the element's new position:
          elmnt.style.top = elmnt.offsetTop - pos2 + "px";
          elmnt.style.left = elmnt.offsetLeft - pos1 + "px";
        }

        function closeDragElement() {
          // stop moving when mouse button is released:
          document.onmouseup = null;
          document.onmousemove = null;
        }
      }
    });

    function onClickPluginSwitch(databaseId: string, plugin: string): void {
      isLoading.value[databaseId + "_" + plugin] = true;
      disableAll.value = true;
      updatePlugins(activePlugins.value);
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
