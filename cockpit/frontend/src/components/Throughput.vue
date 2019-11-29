<template>
  <div class="chart mx-10 my-10">
    <LineChart :throughput="throughputData" />
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
import {
  createComponent,
  SetupContext,
  onMounted,
  Ref,
  ref
} from "@vue/composition-api";
import axios from "axios";
import LineChart from "./LineChart.vue";
import { useGeneratingTestData } from "../helpers/testData";
import { useThroughputFetchService } from "../services/throughputService";
import { useThreadConfigurationService } from "../services/threadService";

interface Props {}

interface Data {
  throughputData: Ref<number[]>;
  resetData: () => void;
  threads: Ref<number>;
  setNumberOfThreads: () => void;
}

export default createComponent({
  components: {
    LineChart
  },
  setup(props: Props, context: SetupContext): Data {
    const { threads, setNumberOfThreads } = useThreadConfigurationService();
    const {
      getThroughput,
      throughputData,
      throughputQueryReadyState
    } = useThroughputFetchService();

    const { generateThroughputData } = useGeneratingTestData();

    // onMounted(() => setInterval(checkState, 1000));
    onMounted(() => setInterval(addTestData, 1000));

    function addTestData(): void {
      throughputData.value.push(generateThroughputData());
    }

    function checkState(): void {
      if (throughputQueryReadyState) {
        getThroughput();
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
