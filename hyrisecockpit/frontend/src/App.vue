<template>
  <v-app :style="{ background: $vuetify.theme.themes['light'].background }">
    <app-drawer
      @openPlugins="togglePluginEditor()"
      @toggleSelection="toggleSelectionList()"
      @closeSelection="showSelectionList = false"
    />
    <v-content>
      <selection-list v-show="showSelectionList" :open="showSelectionList" />
      <plugins-overview v-if="showPluginEditor" :onClose="togglePluginEditor" />
      <router-view />
    </v-content>
  </v-app>
</template>

<script lang="ts">
import {
  SetupContext,
  defineComponent,
  ref,
  Ref,
  computed,
} from "@vue/composition-api";
import AppDrawer from "./views/AppDrawer.vue";
import PluginsOverview from "./components/plugins/PluginsOverview.vue";
import SelectionList from "@/components/selection/SelectionList.vue";

interface Data {
  togglePluginEditor: () => void;
  showPluginEditor: Ref<boolean>;
  showSelectionList: Ref<boolean>;
  toggleSelectionList: () => void;
}

export default defineComponent({
  components: {
    AppDrawer,
    PluginsOverview,
    SelectionList,
  },
  setup(props: {}, context: SetupContext): Data {
    const showPluginEditor = ref<boolean>(false);

    function togglePluginEditor(): void {
      showPluginEditor.value = !showPluginEditor.value;
    }
    const showSelectionList = ref<boolean>(false);

    function toggleSelectionList(): void {
      showSelectionList.value = !showSelectionList.value;
    }
    return {
      togglePluginEditor,
      showPluginEditor,
      showSelectionList,
      toggleSelectionList,
    };
  },
});
</script>
<style scoped>
.icon {
  margin-right: 10px;
}
.tooltip {
  z-index: 10;
}
.db-tooltip {
  z-index: 1;
}
</style>
