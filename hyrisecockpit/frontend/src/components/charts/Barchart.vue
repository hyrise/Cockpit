<template>
  <div :id="graphId"></div>
</template>

<script lang="ts">
import { defineComponent, SetupContext, onMounted } from "@vue/composition-api";
import * as Plotly from "plotly.js";
import { ChartConfiguration } from "../../types/metrics";
import { useChartReactivity, useResizingOnChange } from "../../meta/charts";
import { ChartProps, ChartPropsValidation } from "../../types/charts";

export default defineComponent({
  props: ChartPropsValidation,
  setup(props: ChartProps, context: SetupContext): void {
    const { getLayout, getOptions } = useBarChartConfiguration(
      context,
      props.chartConfiguration
    );
    const { updateLayout } = useResizingOnChange(props);

    onMounted(() => {
      Plotly.newPlot(props.graphId, props.data, getLayout(), getOptions());
      useChartReactivity(props, context, updateChartDatasets, updateLayout);
    });

    function updateChartDatasets(): void {
      Plotly.react(props.graphId, props.data, getLayout(), getOptions());
    }
  }
});

function useBarChartConfiguration(
  context: SetupContext,
  chartConfiguration: ChartConfiguration
): {
  getLayout: () => Object;
  getOptions: () => Object;
} {
  function getLayout(): Object {
    return {
      xaxis: {
        title: {
          text: chartConfiguration.xaxis
        },
        rangemode: "tozero"
      },
      yaxis: {
        title: {
          text: chartConfiguration.yaxis
        },
        rangemode: "tozero"
      },
      barmode: "stack",
      autosize: true,
      margin: {
        l: 70,
        r: 40,
        b: 70,
        t: 30,
        pad: 0
      },
      paper_bgcolor: "rgba(0,0,0,0)",
      plot_bgcolor: "rgba(0,0,0,0)"
    };
  }

  function getOptions(): Object {
    return { displayModeBar: false };
  }
  return { getLayout, getOptions };
}
</script>
