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
      <div class="graph">
        <canvas id="canvas" width="1200" height="600"></canvas>
      </div>
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

    const dataMap= ref<ThroughputData>({});
    dataMap.value[databaseIds.value[1]] = [];
    dataMap.value[databaseIds.value[2]] = [];

    function initializeDataSets(databases: string[]): ThroughputData {
      const dataSets: ThroughputData = {};
      databases.forEach(id => {
        dataSets[id]= [];
      })
      return dataSets;
    }


    function updateDataset(
      throughputData: ThroughputData,
      databaseId: string
    ): void {
      const throughputDataSet = throughputData[databaseId];
      const chartDataSet = dataMap.value[databaseId];
      if (throughputDataSet.length === 0) {
        chartDataSet.length = 0;
      } else if (throughputDataSet.length) {
        chartDataSet.length = 0;
        for (let i = 0; i < throughputDataSet.length; i++) {
          chartDataSet.push(throughputDataSet[i]);
        }
      }
      if (throughputDataSet.length > 5) {
        chartDataSet.length = 0;
        for (
          let i = throughputDataSet.length - 5;
          i < throughputDataSet.length;
          i++
        ) {
          chartDataSet.push(throughputDataSet[i]);
        }
      }
    }

    watch(
      () => selectedDatabaseIds.value,
      ids => {
       // console.log(ids); // do updating here
       console.log(initializeDataSets(ids))
       //dataMap.value=initializeDataSets(ids.length==0?["citadelle", "york"]:ids);
       //updateChartData();
      }
    );

    function updateLabels(throughputLength: number): void {
      if (throughputLength === 0) {
        labels.value.length = 0;
      } else if (throughputLength) {
        labels.value.push(labels.value.length.toString());
      }
      if (throughputLength > 5) {
        labels.value.length = 0;
        for (let i = throughputLength - 5; i < throughputLength; i++) {
          labels.value.push(i.toString());
        }
      }
    }

    function updateChartData(): void {
      const ThroughputDataSet = throughputData.value;
      const databaseIds = Object.keys(dataMap.value);

      databaseIds.forEach(id => {
        updateDataset(ThroughputDataSet, id);
      });
      updateLabels(ThroughputDataSet[databaseIds[0]].length);

      chart.value ? chart.value.update() : null;
    }

    function onTPChange() {
      updateChartData();
    }

    onMounted(() => setInterval(checkState, 1000));

    onMounted(() => {
      const canvas: any = document.getElementById("canvas");
      const ctx: any = canvas.getContext("2d");
      chart.value = new Chart(ctx, {
        type: "line",
        data: {
          labels: labels.value,
          datasets: [
            {
              label: Object.keys(dataMap.value)[0],
              backgroundColor: "#76baff",
              fill: false,
              borderColor: "#2a93ff",
              data: dataMap.value.citadelle
            },
            {
              label: Object.keys(dataMap.value)[1],
              backgroundColor: "lightblue",
              fill: false,
              borderColor: "lightblue",
              data: dataMap.value.york
            }
          ]
        },
        options: {
          scales: {
            yAxes: [
              {
                scaleLabel: {
                  display: true,
                  labelString: "Throughput (in Queries /s)",
                  fontSize: 16
                },
                ticks: {
                  beginAtZero: true,
                  fontSize: 16
                },
                gridLines: {
                  display: true
                }
              }
            ],
            xAxes: [
              {
                scaleLabel: {
                  display: true,
                  labelString: "Time (in s)",
                  fontSize: 16
                },
                ticks: {
                  beginAtZero: true,
                  fontSize: 16
                },
                gridLines: {
                  display: true
                }
              }
            ]
          }
        }
      });
    });

    function checkState(): void {
      if (throughputQueryReadyState.value) {
        getThroughput(Object.keys(dataMap.value));
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
