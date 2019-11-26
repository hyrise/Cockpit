<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      <b> Hyrise Cockpit </b>
    </v-app-bar>

    <v-content>
      <div class="linechart">
        <Throughput />
      </div>
      <div class="treemap">
        <Treemap />
      </div>
    </v-content>
  </v-app>
</template>

<script lang="ts">
import { createComponent, SetupContext, onMounted } from "@vue/composition-api";
import Throughput from "./components/Throughput.vue";
import Treemap from "./components/Treemap.vue";

export default createComponent({
  name: "App",

  components: {
    Throughput,
    Treemap
  }
});
</script>
<style scoped>
.linechart {
  max-width: 1800px;
  max-height: 1000px;
}
.treemap {
  margin-left: 100px;
  margin-right: 100px;
  margin-bottom: 50px;
  margin-top: 50px;
}
</style>
