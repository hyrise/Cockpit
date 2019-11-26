<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      <b> Hyrise Cockpit </b>
    </v-app-bar>

    <v-content>
      <Throughput />
    </v-content>
  </v-app>
</template>

<script lang="ts">
import { createComponent, SetupContext, onMounted } from "@vue/composition-api";
import Throughput from "./components/Throughput.vue";

export default createComponent({
  name: "App",

  components: {
    Throughput
  }
});
</script>
