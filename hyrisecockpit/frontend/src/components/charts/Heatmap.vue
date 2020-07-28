<template>
  <div :id="graphId"></div>
</template>

<script lang="ts">
import { defineComponent, SetupContext, onMounted } from "@vue/composition-api";
import Plotly from "@/../plotlyBundle.ts";
import { ChartConfiguration, AccessData } from "@/types/metrics";
import { ChartProps, ChartPropsValidation } from "@/types/charts";
import { useChartReactivity, useResizingOnChange } from "@/meta/charts";
import { colorValueDefinition } from "@/meta/colors";

interface Props extends ChartProps {
  autosize: boolean;
  hoverTemplate: string;
  maxValue: number;
  colorScale: (string | number)[][];
  colorBar: Object;
}

export default defineComponent({
  name: "Heatmap",
  props: {
    autosize: {
      type: Boolean,
      default: true,
    },
    colorScale: {
      type: Array,
      default: () => [
        [0.0, colorValueDefinition.darkblue],
        [0.25, colorValueDefinition.blue],
        [0.5, "#F5F5F5"],
        [0.75, colorValueDefinition.red],
        [1, colorValueDefinition.darkred],
      ],
    },
    colorBar: {
      type: Object,
      default: () => {},
    },
    maxValue: {
      type: Number,
      default: 0,
    },
    hoverTemplate: {
      type: String,
      default: "",
    },
    ...ChartPropsValidation,
  },
  setup(props: Props, context: SetupContext): void {
    const { getDataset, getLayout, getOptions } = useHeatMapConfiguration(
      props
    );
    const { updateLayout } = useResizingOnChange(props);

    onMounted(() => {
      Plotly.newPlot(
        props.graphId,
        [getDataset(props.maxValue)],
        getLayout(),
        getOptions()
      );
      useChartReactivity(props, context, updateDataset, updateLayout);
    });

    function updateDataset(): void {
      Plotly.addTraces(props.graphId, getDataset(props.maxValue, props.data));
      Plotly.deleteTraces(props.graphId, 0);
    }
  },
});

function useHeatMapConfiguration(
  props: Props
): {
  getDataset: (maxValue: number, data?: AccessData) => Object;
  getLayout: () => Object;
  getOptions: () => Object;
} {
  function getLayout(): Object {
    return {
      xaxis: {
        rangemode: "tozero",
        title: {
          text: props.chartConfiguration.xaxis,
          font: {
            family: "Roboto, sans-serif",
            size: 13,
          },
        },
        fixedrange: true,
      },
      yaxis: {
        rangemode: "tozero",
        title: {
          text: props.chartConfiguration.yaxis,
          font: {
            family: "Roboto, sans-serif",
            size: 13,
          },
        },
        fixedrange: true,
      },
      autosize: props.autosize,
      width: props.autosize ? 0 : 1300,
      height: props.autosize ? 0 : 600,

      margin: {
        l: 100,
        r: 50,
        b: 50,
        t: 20,
      },
    };
  }

  function getDataset(
    maxValue: number,
    data: AccessData = {
      dataByChunks: [],
      descriptions: [],
      chunks: [],
      columns: [],
    }
  ): Object {
    return {
      z: data.dataByChunks,
      x: data.columns,
      y: data.chunks,
      zmin: 0,
      zmax: maxValue,
      text: data.descriptions,
      type: "heatmap",
      colorscale: props.colorScale,
      cauto: false,
      hovermode: "closest",
      hovertemplate: props.hoverTemplate,
      colorbar: props.colorBar,
    };
  }
  function getOptions(): Object {
    return { displayModeBar: false };
  }
  return { getDataset, getLayout, getOptions };
}
</script>
