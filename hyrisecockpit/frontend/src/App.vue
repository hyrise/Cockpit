<template>
  <v-app :style="{ background: $vuetify.theme.themes['light'].background }">
    <AppDrawer :open="showNavigationDrawer" />
    <v-app-bar app color="primary" dark>
      <v-app-bar-nav-icon @click="toggleNavigationDrawer()">
      </v-app-bar-nav-icon>
      <b> Hyrise Cockpit </b>
      <v-spacer />
      <workload-generation :open="showWorkloadDialog" />
      <v-btn class=" white--text mr-5" @click="openWorkloadDialog()"
        >Generate Workload</v-btn
      >
    </v-app-bar>
    <v-content>
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
  onMounted,
  watch
} from "@vue/composition-api";
import AppDrawer from "./views/AppDrawer.vue";
import WorkloadGeneration from "./components/workload/WorkloadGeneration.vue";
import { eventBus } from "./plugins/eventBus";

interface Data {
  showNavigationDrawer: Ref<boolean>;
  toggleNavigationDrawer: () => void;
  showWorkloadDialog: Ref<boolean>;
  openWorkloadDialog: () => void;
}

export default defineComponent({
  components: { AppDrawer, WorkloadGeneration },
  setup(props: {}, context: SetupContext): Data {
    const showNavigationDrawer = ref<boolean>(true);
    const showWorkloadDialog = ref<boolean>(false);
    function toggleNavigationDrawer(): void {
      showNavigationDrawer.value = !showNavigationDrawer.value;
    }
    function openWorkloadDialog(): void {
      showWorkloadDialog.value = true;
    }

    onMounted(() => {
      eventBus.$on("close", (value: boolean) => {
        showWorkloadDialog.value = value;
      });
    });

    return {
      showNavigationDrawer,
      toggleNavigationDrawer,
      showWorkloadDialog,
      openWorkloadDialog
    };
  }
});
</script>
