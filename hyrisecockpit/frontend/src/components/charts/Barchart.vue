<template>
  <div :id="graphId"></div>
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
import { Database } from "../../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";

interface Props {
  data: any;
  graphId: string;
  chartConfiguration: string[];
}

export default createComponent({
  props: {
    data: {
      type: Array,
      default: null
    },
    graphId: {
      type: String,
      default: null
    },
    chartConfiguration: {
      type: Array,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): void {
    const data = computed(() => props.data);
    const graphId = props.graphId;
    const { getLayout, getOptions } = useBarChartConfiguration(
      context,
      props.chartConfiguration
    );

    onMounted(() => {
      Plotly.newPlot(graphId, data.value, getLayout(), getOptions());
      watch(data, () => {
        updateChartDatasets();
        if (data.value.length) {
          updateChartDatasets();
        }
      });

      function updateChartDatasets(): void {
        Plotly.react(graphId, data.value, getLayout(), getOptions());
      }
    });
  }
});

function useBarChartConfiguration(
  context: SetupContext,
  chartConfiguration: string[]
): {
  getLayout: (xMin?: number, xMax?: number) => Object;
  getOptions: () => Object;
} {
  function getLayout(xMin: number = 0, xMax: number = 30): Object {
    return {
      xaxis: {
        title: {
          text: chartConfiguration[1]
        }
      },
      yaxis: {
        title: {
          text: chartConfiguration[2]
        },
        rangemode: "tozero"
      },
      barmode: "stack"
    };
  }

  function getOptions(): Object {
    return { displayModeBar: false };
  }
  return { getLayout, getOptions };
}
</script>
<style scoped></style>
