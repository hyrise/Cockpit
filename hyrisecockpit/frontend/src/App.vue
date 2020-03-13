<template>
  <v-app :style="{ background: $vuetify.theme.themes['light'].background }">
    <AppDrawer />
    <v-app-bar app color="primary" dark>
      <b> Hyrise Cockpit </b>
      <add-database />
    </v-app-bar>
    <v-content>
      <router-view />
    </v-content>
  </v-app>
</template>

<script lang="ts">
import { SetupContext, defineComponent, ref, Ref } from "@vue/composition-api";
import AppDrawer from "./views/AppDrawer.vue";
import addDatabase from "./meta/addDatabase.vue";

interface Data {}

export default defineComponent({
  components: { AppDrawer, addDatabase },
  setup(props: {}, context: SetupContext): Data {
    return {};
  }
});
</script>
