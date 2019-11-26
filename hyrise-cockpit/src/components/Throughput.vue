<template>
  <div class="chart mx-10 my-10">
    <LineChart :throughput="dataSet" />
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

interface ThroughputResult {}

interface Props {}

interface Data {
  dataSet: Ref<number[]>;
  resetData: () => void;
  threads: Ref<number>;
  setNumberOfThreads: () => void;
}

export default createComponent({
  components: {
    LineChart
  },
  setup(props: Props, context: SetupContext): Data {
    const { threads, setNumberOfThreads } = useThreadConfiguration();
    const { getThroughput, dataSet, isReady } = useThroughputFetching();

    onMounted(() => setInterval(checkState, 1000));

    function addTestData(): void {
      dataSet.value.push(10);
    }

    function checkState(): void {
      if (isReady) {
        getThroughput();
      }
    }

    function resetData(): void {
      dataSet.value = [];
    }

    return { dataSet, resetData, threads, setNumberOfThreads };
  }
});

function useThroughputFetching(): {
  getThroughput: () => void;
  dataSet: Ref<number[]>;
  isReady: Ref<boolean>;
} {
  const isReady = ref<boolean>(true);
  const dataSet = ref<number[]>([]);

  function getThroughput(): void {
    fetchThroughput().then(result => {
      addThroughputData(result.total_throughput);
    });
  }

  function addThroughputData(data: number): void {
    isReady.value = false;
    dataSet.value.push(data);
    isReady.value = true;
  }

  function fetchThroughput(): Promise<Object> {
    return new Promise((resolve, reject) => {
      axios
        .get("http://192.168.30.126:5000/throughput/total")
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          reject(error);
        });
    });
  }
  return { getThroughput, isReady, dataSet };
}

function useThreadConfiguration(): {
  threads: Ref<number>;
  setNumberOfThreads: () => void;
} {
  const threads = ref<number>(getThreadNumber());

  function getThreadNumber(): number {
    let threads = 0;
    axios.get("http://192.168.30.126:5000/threads").then(response => {
      threads = response.data.threads;
    });
    return threads;
  }

  function setNumberOfThreads(): void {
    axios
      .get("http://192.168.30.126:5000/threads/" + threads.value)
      .then(response => {
        console.log(response.data.threads);
      });
  }

  return { threads, setNumberOfThreads };
}
</script>
<style scoped>
.chart {
  max-width: 1200px;
  max-height: 600px;
}
</style>
