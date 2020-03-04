<template>
  <div :id="graphId"></div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch
} from "@vue/composition-api";
import * as Plotly from "plotly.js";
import { ChartConfiguration } from "../../types/metrics";

interface Props {
  data: number[][];
  xValues: string[];
  yValues: string[];
  graphId: string;
  chartConfiguration: ChartConfiguration;
}

export default defineComponent({
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
      type: Object,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): void {
    const { getDataset, getLayout, getOptions } = useHeatMapConfiguration(
      props.chartConfiguration
    );

    onMounted(() => {
      Plotly.newPlot(props.graphId, [getDataset()], getLayout(), getOptions());
      watch(() => {
        if (props.data && props.xValues && props.yValues) {
          Plotly.deleteTraces(props.graphId, 0);
          Plotly.addTraces(
            props.graphId,
            getDataset(props.data, props.xValues, props.yValues)
          );
        }
      });
    });
  }
});
function useHeatMapConfiguration(
  chartConfiguration: ChartConfiguration
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
    return {
      xaxis: {
        rangemode: "tozero"
      },
      yaxis: {
        rangemode: "tozero"
      }
    };
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
    return { displayModeBar: false, responsive: true };
  }
  return { getDataset, getLayout, getOptions };
}
</script>
