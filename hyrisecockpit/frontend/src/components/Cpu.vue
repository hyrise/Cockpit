<template>
  <div>
    <div class="chart mx-10 my-10">
      <v-row align="center">
        <v-col cols="6" class="mx-10">
          <v-select
            v-model="selectedDatabaseIds"
            :items="databases.map(database => database.id)"
            chips
            label="databases"
            multiple
            outlined
            prepend-icon="mdi-database"
          ></v-select>
        </v-col>
      </v-row>
      <Linechart :selected-database-ids="selectedDatabaseIds" :data="cpuData" graph-id="graph1" />
    </div>
  </div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch
} from "@vue/composition-api";
import axios from "axios";
import { useGeneratingTestData } from "../helpers/testData";
import { useThroughputFetchService } from "../services/throughputService";
import { useThreadConfigurationService } from "../services/threadService";
import { useDatabaseFetchService } from "../services/databaseService";
import { useCpuFetchService } from "../services/cpuService";
import { ThroughputData } from "../types/throughput";
import { Database } from "../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";
import Linechart from "./charts/Linechart.vue";

interface Props {}

interface Data {
  cpuData: Ref<ThroughputData>;
  databases: Ref<Database[]>;
  selectedDatabaseIds: Ref<string[]>;
}

export default createComponent({
  components: { Linechart },
  setup(props: Props, context: SetupContext): Data {
    const databases = Vue.prototype.$databases;
    const { getCpu, cpuData, cpuQueryReadyState } = useCpuFetchService();
    const selectedDatabaseIds = ref<string[]>([]);

    onMounted(() => {
      setInterval(checkState, 10000);
    });

    function checkState(): void {
      if (cpuQueryReadyState.value) {
        getCpu();
      }
    }

    return {
      cpuData,
      databases,
      selectedDatabaseIds
    };
  }
});
</script>
<style scoped>
.chart {
  max-width: 1200px;
  max-height: 900px;
}
</style>
