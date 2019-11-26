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
  ref,
} from '@vue/composition-api';
import axios from 'axios';
import LineChart from './LineChart.vue';

interface Props {}

interface Data {
  dataSet: Ref<number[]>;
}

export default createComponent({
  components: {
    LineChart,
  },
  setup(props: Props, context: SetupContext): Data {
    const dataSet = ref<number[]>([]);

    onMounted(() => setInterval(addTestData, 1000));

    function addTestData(): void {
      dataSet.value.push(10);
    }

    return { dataSet };
  },
});
</script>
<style scoped>
.chart {
  max-width: 1200px;
  max-height: 600px;
}
</style>
