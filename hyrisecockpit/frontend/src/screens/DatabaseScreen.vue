<template>
  <div>
    <div class="linechart mx-12">
      <div class="mt-6 mb-2">
        <b> Throughput Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Throughput />
    </div>
    <div class="treemap mx-12">
      <Treemap />
    </div>
  </div>
</template>

<script lang="ts">
import { createComponent, SetupContext, onMounted } from "@vue/composition-api";
import Throughput from "../components/Throughput.vue";
import Treemap from "../components/Treemap.vue";

export default createComponent({
  name: "DatabaseScreen",

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
  margin-left: 10px;
  margin-right: 100px;
  margin-bottom: 50px;
  margin-top: 150px;
}
</style>
