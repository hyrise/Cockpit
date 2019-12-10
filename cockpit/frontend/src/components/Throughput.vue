<template>
  <div>
    <div class="chart mx-10 my-10">
      <v-row align="center">
        <v-col cols="6" class="mx-10">
          <v-select
            v-model="selectedDatabaseIds"
            :items="databaseIds"
            chips
            label="databases"
            multiple
            outlined
            prepend-icon="mdi-database"
          ></v-select>
        </v-col>
      </v-row>
      <div id="graph"></div>
      <div class="slider my-12">
        <v-slider
          v-model="threads"
          v-on:click="setNumberOfThreads"
          thumb-label="always"
          min="0"
          max="32"
          label="Number of Threads"
        >
        </v-slider>
        <v-btn outlined large color="#1E90FF" @click="resetData">
          Reset
        </v-btn>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Chart from "chart.js";
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
import { ThroughputData } from "../types/throughput";
import { Database } from "../types/database";
import * as Plotly from "plotly.js";

interface Props {}

interface Data {
  throughputData: Ref<ThroughputData>;
  resetData: () => void;
  threads: Ref<number>;
  setNumberOfThreads: () => void;
  databaseIds: Ref<string[]>;
  selectedDatabaseIds: Ref<string[]>;
}

export default createComponent({
  setup(props: Props, context: SetupContext): Data {
    const { threads, setNumberOfThreads } = useThreadConfigurationService();
    const {
      getThroughput,
      throughputData,
      throughputQueryReadyState
    } = useThroughputFetchService(onTPChange);

    // this should be fetched for the current db (router variable)
    const { databaseIds } = useDatabaseFetchService();
    var selectedDatabaseIds = ref<string[]>([]);
    const chart = ref<Object>(null);
    const labels = ref<string[]>([]);

    onMounted(() => {
      //let graphDiv = document.getElementById('graph');
      Plotly.newPlot("graph", [
        { y: [], mode: "lines", line: { color: "#80CAF6" } }
      ]);
    });

    watch(
      () => selectedDatabaseIds.value,
      selectedDatabaseIds => {
        const data = selectedDatabaseIds.reduce((result, id) => {
          return [
            ...result,
            {
              y: throughputData.value[id] ? throughputData.value[id].slice(Math.max(throughputData.value[id].length - 5, 1)) : [],
              mode: "lines",
              line: { color: "#80CAF6" }
            }
          ];
        }, []);
        Plotly.purge("graph");
        Plotly.plot("graph", data);
      }
    );

    function updateChartData(): void {
      const data = { y: Object.values(throughputData.value).map(throughput => (throughput.slice(Math.max(throughput.length - 5, 1))))};

      console.log(data, 'data');

      Plotly.update("graph", data, {});
    }

    function onTPChange() {
      updateChartData();
    }

    onMounted(() => setInterval(checkState, 1000));

    function checkState(): void {
      if (throughputQueryReadyState.value) {
        getThroughput(selectedDatabaseIds.value);
      }
    }

    function resetData(): void {
      throughputData.value = {};
    }

    return {
      throughputData,
      resetData,
      threads,
      setNumberOfThreads,
      databaseIds,
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
