<template>
  <div class="graph">
    <canvas id="canvas" width="1200" height="600"></canvas>
  </div>
</template>

<script lang="ts">
import Chart from 'chart.js';
import {
  createComponent,
  SetupContext,
  onMounted,
  watch,
  Ref,
  ref,
} from '@vue/composition-api';

interface Props {
  throughput: number[];
}
export default createComponent({
  props: {
    throughput: { type: Array, default: [] },
  },
  setup(props: Props, context: SetupContext) {
    const chart = ref<Object>(null);
    const labels = ref<string[]>([]);
    const chartData = ref<number[]>([]);

    function addLabels(): void {
      labels.value.push(labels.value.length.toString());
    }

    function updateChartData(): void {
      chartData.value = props.throughput;
      addLabels();
      chart.value.update();
    }

    watch(
      () => props.throughput,
      () => {
        if (props.throughput) {
          updateChartData();
        }
      },
    ),
      onMounted(() => {
        const canvas: any = document.getElementById('canvas');
        const ctx: any = canvas.getContext('2d');
        chart.value = new Chart(ctx, {
          type: 'line',
          data: {
            labels: labels.value,
            datasets: [
              {
                label: 'Database',
                backgroundColor: '#1E90FF',
                fill: false,
                borderColor: '#1E90FF',
                data: chartData.value,
              },
            ],
          },
          options: {
            scales: {
              yAxes: [
                {
                  scaleLabel: {
                    display: true,
                    labelString: 'Throughput (in Queries /s)',
                    fontSize: 16,
                  },
                  ticks: {
                    beginAtZero: true,
                    fontSize: 16,
                  },
                  gridLines: {
                    display: true,
                  },
                },
              ],
              xAxes: [
                {
                  scaleLabel: {
                    display: true,
                    labelString: 'Time (in s)',
                    fontSize: 16,
                  },
                  ticks: {
                    beginAtZero: true,
                    fontSize: 16,
                  },
                  gridLines: {
                    display: true,
                  },
                },
              ],
            },
          },
        });
      });
  },
});
</script>
