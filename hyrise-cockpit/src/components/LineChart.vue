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

    function addLabels(): void {
      labels.value.push(labels.value.length.toString());
      /*   if (labels.value.length > 10) {
        labels.value = [
          ...labels.value[(labels.value.length - 11, labels.value.length - 1)],
        ];
      } */
    }

    function addThroughput(): void {
      if (chart.value !== null) {
        addLabels();
        chart.value.update();
      }
    }

    watch(
      () => props.throughput,
      () => {
        if (props.throughput) {
          addThroughput();
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
                data: props.throughput,
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
