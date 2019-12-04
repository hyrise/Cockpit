<template>
  <div class="chart mx-10 my-10">
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
</template>

<script lang="ts">
import Chart from "chart.js";
import {
  createComponent,
  SetupContext,
  onMounted,
  Ref,
  ref,
  watch
} from "@vue/composition-api";
import axios from "axios";
import { useGeneratingTestData } from "../helpers/testData";
import { useThroughputFetchService } from "../services/throughputService";
import { useThreadConfigurationService } from "../services/threadService";

interface Props {}

interface Data {
  throughputData: Ref<{ [id: string]: number[] }>;
  resetData: () => void;
  threads: Ref<number>;
  setNumberOfThreads: () => void;
}

export default createComponent({
  setup(props: Props, context: SetupContext): Data {
    const { threads, setNumberOfThreads } = useThreadConfigurationService();
    const {
      getThroughput,
      throughputData,
      throughputQueryReadyState
    } = useThroughputFetchService();
    console.log(throughputData);
    var relevantThroughputData = [];
    const chart = ref<Object>(null);
    const labels = ref<string[]>([]);
    const dataSet = ref<number[]>([1]);

    function updateChartData(): void {
     relevantThroughputData = throughputData.value["citadelle"] || [];
      if (relevantThroughputData.length === 0) {
        labels.value.length = 0;
        dataSet.value.length = 0;
      } else if (relevantThroughputData.length) {
        labels.value.push(labels.value.length.toString());
        dataSet.value.length = 0;
        for (let i = 0; i < relevantThroughputData.length; i++) {
          dataSet.value.push(relevantThroughputData[i]);
        }
      }
      if (relevantThroughputData.length > 5) {
        labels.value.length = 0;
        dataSet.value.length = 0;
        for (
          let i = relevantThroughputData.length - 5;
          i < relevantThroughputData.length;
          i++
        ) {
          labels.value.push(i.toString());
          dataSet.value.push(relevantThroughputData[i]);
        }
      }
      console.log(dataSet);
      chart.value ? chart.value.update() : null;
    }

    function onTPChange() {
      updateChartData();
    }

    watch(
      () => throughputData.value,
      () => {
        if(throughputData.value) {
          console.log("update");
          updateChartData();
        }
      }, { deep: true }
    );

    const { generateThroughputData } = useGeneratingTestData();

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
              label: "Database",
              backgroundColor: "#76baff",
              fill: true,
              borderColor: "#2a93ff",
              data: dataSet.value
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

    function addTestData(): void {
      throughputData.value.push(generateThroughputData());
    }

    function checkState(): void {
      if (throughputQueryReadyState.value) {
        getThroughput(["citadelle", "york"], onTPChange);
      }
    }

    function resetData(): void {
      throughputData.value.length = 0;
    }

    return { throughputData, resetData, threads, setNumberOfThreads };
  }
});
</script>
<style scoped>
.chart {
  max-width: 1200px;
  max-height: 600px;
}
</style>
