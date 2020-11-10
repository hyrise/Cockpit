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
  showY: boolean;
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
    showY: {
      type: Boolean,
      default: true,
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
        tickangle: 45,
        automargin: true,
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
        // Removes the line  which is drawn along the 0 value of the y axis
        zeroline: false,
        rangemode: "tozero",
        // Sets the tick label formatting rule using d3 formatting mini-languages
        // ",d" means comma separated decimal
        tickformat: ",d",
        dtick: 1,
        title: {
          text: props.chartConfiguration.yaxis,
          font: {
            family: "Roboto, sans-serif",
            size: 13,
          },
        },
        visible: props.showY,
        fixedrange: true,
      },
      autosize: props.autosize,
      width: props.autosize ? 0 : 1300,
      height: props.autosize ? 0 : 600,
      margin: {
        l: 60,
        r: 10,
        b: 60,
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
      text: [],
    }
  ): Object {
    return {
      z: data.dataByChunks,
      x: data.columns,
      y: data.chunks,
      // xgap and ygap set the horizontal and vertical gap (in pixels) between bricks.
      ygap: 1,
      xgap: 1,
      zmin: 0,
      zmax: maxValue,
      text: data.text,
      type: "heatmap",
      colorscale: props.colorScale,
      cauto: false,
      hovermode: "closest",
      hovertemplate: props.hoverTemplate,
      colorbar: props.colorBar,
    };
  }
  function getOptions(): Object {
    return { displayModeBar: false, ygap: 10, xgap: 10 };
  }
  return { getDataset, getLayout, getOptions };
}
</script>
