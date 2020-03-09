<template>
  <div :id="graphId"></div>
</template>

<script lang="ts">
import { defineComponent, SetupContext, onMounted } from "@vue/composition-api";
import * as Plotly from "plotly.js";
import { ChartConfiguration, AccessData } from "../../types/metrics";
import { ChartProps, ChartPropsValidation } from "../../types/charts";
import { useChartReactivity, useResizingOnChange } from "../../meta/charts";

interface Props extends ChartProps {
  autosize: boolean;
}

export default defineComponent({
  name: "Heatmap",
  props: {
    autosize: {
      type: Boolean,
      default: true
    },
    ...ChartPropsValidation
  },
  setup(props: Props, context: SetupContext): void {
    const { getDataset, getLayout, getOptions } = useHeatMapConfiguration(
      props.chartConfiguration,
      props.autosize
    );
    const { updateLayout } = useResizingOnChange(props);

    onMounted(() => {
      Plotly.newPlot(props.graphId, [getDataset()], getLayout(), getOptions());
      useChartReactivity(props, context, updateDataset, updateLayout);
    });

    function updateDataset(): void {
      Plotly.addTraces(props.graphId, getDataset(props.data));
      Plotly.deleteTraces(props.graphId, 0);
    }
  }
});

function useHeatMapConfiguration(
  chartConfiguration: ChartConfiguration,
  autosize: boolean
): {
  getDataset: (data?: AccessData) => Object;
  getLayout: () => Object;
  getOptions: () => Object;
} {
  function getLayout(): Object {
    return {
      xaxis: {
        rangemode: "tozero",
        title: {
          text: chartConfiguration.xaxis
        }
      },
      yaxis: {
        rangemode: "tozero",
        title: {
          text: chartConfiguration.yaxis
        }
      },
      autosize: autosize,
      width: autosize ? 0 : 1400,
      height: autosize ? 0 : 700,
      margin: {
        l: 80,
        r: 50,
        b: 100,
        t: 50,
        pad: 10
      }
    };
  }

  function getDataset(
    data: AccessData = {
      dataByChunks: [],
      descriptions: [],
      chunks: [],
      columns: []
    }
  ): Object {
    return {
      z: data.dataByChunks,
      x: data.columns,
      y: data.chunks,
      text: data.descriptions,
      type: "heatmap",
      hovermode: "closest",
      hovertemplate:
        "<b>column: %{text}</b> <br><b>chunk: %{y}</b> <br>%{z} accesses <extra></extra>"
    };
  }
  function getOptions(): Object {
    return { displayModeBar: false };
  }
  return { getDataset, getLayout, getOptions };
}
</script>
