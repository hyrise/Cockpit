<template>
  <div class="mx-12">
    <div class="mt-6 mb-2">
      <b> Workload Generation </b>
    </div>
    <v-divider />
    <v-col cols="12">
      <div class="mb-2">
        <b> generate and insert Data </b>
      </div>

      <v-btn-toggle>
        <v-btn @click="generateData('tpch')">
          tpch
        </v-btn>

        <v-btn @click="generateData('tpcds')">
          tpcds
        </v-btn>

        <v-btn @click="generateData('job')">
          job
        </v-btn>
      </v-btn-toggle>
    </v-col>
  </div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  onMounted,
  Ref,
  ref
} from "@vue/composition-api";
import Workload from "../components/Workload.vue";
import axios from "axios";
import { backendUrl } from "../types/services";

interface Props {}
interface Data {
  generateData: (benchmarkType: string) => void;
}

export default createComponent({
  name: "WorkloadScreen",

  components: {
    Workload
  },

  setup(props: Props, context: SetupContext): Data {
    function generateData(benchmarkType: string): void {
      axios.get(`${backendUrl}data/${benchmarkType}`);
    }

    return {
      generateData
    };
  }
});
</script>
<style scoped></style>
