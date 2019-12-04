<template>
    <div class="workload">
        <v-btn class="green white--text">start</v-btn>
        <v-btn class="red white--text">stop</v-btn>
    </div>
</template>



<script lang="ts">
import { createComponent, SetupContext, onMounted } from "@vue/composition-api";
import Workload from "../components/Workload.vue";


export default createComponent({
  name: "WorkloadScreen",

  components: {
    Workload
  }
});

</script>
<style scoped>

</style>