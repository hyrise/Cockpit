<template>
  <v-app :style="{ background: $vuetify.theme.themes['light'].background }">
    <AppDrawer :open="showNavigationDrawer" />
    <v-app-bar app color="primary" dark>
      <v-app-bar-nav-icon @click="toggleNavigationDrawer()">
      </v-app-bar-nav-icon>
      <b> Hyrise Cockpit </b>
      <v-icon class="mt-2 plugin-icon">
        mdi-widgets
      </v-icon>
    </v-app-bar>
    <v-content>
      <router-view />
    </v-content>
  </v-app>
</template>

<script lang="ts">
import { SetupContext, defineComponent, ref, Ref } from "@vue/composition-api";
import AppDrawer from "./views/AppDrawer.vue";

interface Data {
  toggleNavigationDrawer: () => void;
  showNavigationDrawer: Ref<boolean>;
}

export default defineComponent({
  components: { AppDrawer },
  setup(props: {}, context: SetupContext): Data {
    const showNavigationDrawer = ref<boolean>(true);

    function toggleNavigationDrawer(): void {
      showNavigationDrawer.value = !showNavigationDrawer.value;
    }
    return { showNavigationDrawer, toggleNavigationDrawer };
  }
});
</script>
<style scoped>
.plugin-icon {
  margin-left: auto;
}
</style>
