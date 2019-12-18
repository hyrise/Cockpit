<template>
  <div>
    <div class="linechart mx-12">
      <div class="mt-6 mb-2">
        <b> Throughput Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>

      <Throughput :preselectedDatabaseId="$route.params.id" />
      <div class="mt-6 mb-2">
        <b> CPU Monitoring </b>
      </div>
      <v-divider class="mb-4"></v-divider>
      <Cpu :preselectedDatabaseId="$route.params.id" class="mb-12" />
      <Treemap class="mt-10" />
    </div>
  </div>
</template>

<script lang="ts">
import { createComponent, SetupContext, onMounted } from "@vue/composition-api";
import Throughput from "../components/Throughput.vue";
import Treemap from "../components/Treemap.vue";
import Cpu from "../components/Cpu.vue";

export default createComponent({
  name: "DatabaseScreen",

  components: {
    Throughput,
    Treemap,
    Cpu
  }
});
</script>
<style scoped>
.linechart {
  max-width: 1800px;
  max-height: 1000px;
}
</style>
