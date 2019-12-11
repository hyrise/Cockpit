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

    const { databaseIds, getDatabaseColor } = useDatabaseFetchService();
    var selectedDatabaseIds = ref<string[]>([]);
    const chart = ref<Object>(null);
    const labels = ref<string[]>([]);
    const layout: any = {
      title: "Throughput",
      xaxis: {
        title: "time in s",
        range: [0, 30]
      },
      yaxis: {
        title: "1000 queries per second",
        rangemode: "tozero"
      }
    };

    onMounted(() => {
      Plotly.newPlot("graph", [{ y: [], mode: "lines+markers" }], layout);
    });

    watch(
      () => selectedDatabaseIds.value,
      selectedDatabaseIds => {
        const data = selectedDatabaseIds.reduce((result, id): any => {
          return [
            ...result,
            {
              y: throughputData.value[id] ? throughputData.value[id] : [],
              mode: "lines+markers",
              line: { color: getDatabaseColor(id) },
              name: id
            }
          ];
        }, []);
        Plotly.purge("graph");
        Plotly.plot("graph", data, layout);
      }
    );

    function getMaxLength(): number {
      return selectedDatabaseIds.value.reduce((currentMax, id) => {
        return Math.max(throughputData.value[id].length, currentMax);
      }, 0);
    }

    function updateChartData(): void {
      const data = {
        y: Object.values(selectedDatabaseIds.value).map(
          id => throughputData.value[id]
        )
      };
      const maxSelectedLength = getMaxLength();
      const xMax = Math.max(maxSelectedLength, 30);
      const xMin = Math.max(maxSelectedLength - 30, 0);
      const xAxisLayout: any = {
        xaxis: {
          title: "time in s",
          range: [xMin, xMax]
        },
        yaxis: {
          title: "1000 queries per second",
          rangemode: "tozero"
        }
      };

      Plotly.update("graph", data, xAxisLayout);
    }

    function onTPChange() {
      updateChartData();
    }

    onMounted(() => setInterval(checkState, 1000));

    function checkState(): void {
      if (throughputQueryReadyState.value) {
        getThroughput();
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
