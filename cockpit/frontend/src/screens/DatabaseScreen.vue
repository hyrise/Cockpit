<template> 
    <div>
      <div class="linechart">
        <Throughput />
      </div>
      <div class="treemap">
        <Treemap class="mt-10" />
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
