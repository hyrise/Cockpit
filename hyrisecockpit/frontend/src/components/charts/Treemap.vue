<template>
  <div class="treemap" :id="graphId"></div>
</template>

<script lang="ts">
import { defineComponent, SetupContext, onMounted } from "@vue/composition-api";
import * as Plotly from "plotly.js";
import { ChartConfiguration, StorageData } from "../../types/metrics";
import { ChartProps, ChartPropsValidation } from "../../types/charts";
import { useChartReactivity } from "../../meta/charts";

interface Props extends ChartProps {
  autosize: boolean;
}

export default defineComponent({
  props: {
    autosize: {
      type: Boolean,
      default: true
    },
    ...ChartPropsValidation
  },
  setup(props: Props, context: SetupContext) {
    const { getLayout, getDataset, getOptions } = useTreemapConfiguration(
      props
    );

    onMounted(() => {
      Plotly.newPlot(props.graphId, getDataset(), getLayout(), getOptions());
      useChartReactivity(props, context, updateDatasets, updateLayout);
    });

    function updateDatasets(): void {
      Plotly.addTraces(props.graphId, getDataset(props.data));
      Plotly.deleteTraces(props.graphId, 0);
    }

    function getHeight(autosize: boolean): number {
      return autosize ? 1.75 : 1.25;
    }

    function updateLayout(): void {
      Plotly.relayout(props.graphId, {
        width: 0.8 * props.maxChartWidth,
        height: (0.8 * props.maxChartWidth) / getHeight(props.autosize)
      });
    }
  }
});
function useTreemapConfiguration(
  props: Props
): {
  getLayout: () => Object;
  getDataset: (data?: StorageData) => Object[];
  getOptions: () => Object;
} {
  function getLayout(): Object {
    return {
      annotations: [
        {
          showarrow: false,
          text: "",
          x: 0.25,
          xanchor: "center",
          y: 1.1,
          yanchor: "bottom"
        }
      ],
      autosize: props.autosize,
      width: props.autosize ? 0 : 1400,
      height: props.autosize ? 0 : 700,
      hovermode: "closest",
      hoverlabel: { bgcolor: "#FFF" },
      margin: {
        l: 0,
        r: 0,
        b: 20,
        t: 0,
        pad: 0
      }
    };
  }
  function getDataset(
    data: StorageData = { labels: [], parents: [], sizes: [], descriptions: [] }
  ): Object[] {
    return [
      {
        type: "treemap",
        labels: data.labels,
        parents: data.parents,
        values: data.sizes,
        text: data.descriptions,
        hovertemplate:
          "<b>%{label}</b> <br>size: %{text.size}  <br>%{text.percentOfDatabase} <br>%{text.percentOfTable}" +
          "<br>%{text.dataType} <br>%{text.encoding}<extra></extra>",
        texttemplate:
          "<b>%{label}</b> <br>size:%{text.size} <br>%{text.dataType} <br>%{text.encoding}",
        outsidetextfont: { size: 20, color: "#377eb8" },
        marker: { line: { width: 2 } },
        pathbar: { visible: false }
      }
    ];
  }
  function getOptions(): Object {
    return { displayModeBar: false };
  }
  return { getLayout, getDataset, getOptions };
}
</script>
<style>
.treemap {
  margin: 1% 1% 3% 10%;
}
</style>
