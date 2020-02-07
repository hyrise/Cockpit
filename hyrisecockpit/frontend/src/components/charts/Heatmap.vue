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

import * as Plotly from "plotly.js";
import Vue from "vue";

interface Props {
  data: number[][];
  xValues: string[];
  yValues: string[];
  graphId: string;
  chartConfiguration: string[];
}

export default createComponent({
  name: "Heatmap",
  props: {
    data: {
      type: Array,
      default: null
    },
    xValues: {
      type: Array,
      default: null
    },
    yValues: {
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
    const mapData = computed(() => props.data);
    const xData = computed(() => props.xValues);
    const yData = computed(() => props.yValues);

    const { getDataset, getLayout, getOptions } = useHeatMapConfiguration(
      props.chartConfiguration
    );

    onMounted(() => {
      Plotly.newPlot(props.graphId, [getDataset()], getLayout(), getOptions());
      watch([mapData, xData, yData], () => {
        Plotly.deleteTraces(props.graphId, 0);
        Plotly.addTraces(
          props.graphId,
          getDataset(mapData.value, xData.value, yData.value)
        );
      });
    });
  }
});
function useHeatMapConfiguration(
  chartConfiguration: string[]
): {
  getDataset: (
    data?: readonly number[][],
    columns?: readonly string[],
    chunks?: readonly string[]
  ) => Object;
  getLayout: () => Object;
  getOptions: () => Object;
} {
  function getLayout(): Object {
    return {};
  }

  function getDataset(
    data: readonly number[][] = [],
    columns: readonly string[] = [],
    chunks: readonly string[] = []
  ): Object {
    return {
      z: data,
      x: columns,
      y: chunks,
      type: "heatmap"
    };
  }
  function getOptions(): Object {
    return { displayModeBar: false };
  }
  return { getDataset, getLayout, getOptions };
}
</script>
