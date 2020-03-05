<template>
  <div :id="graphId"></div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  watch,
  Ref,
  ref
} from "@vue/composition-api";
import * as Plotly from "plotly.js";
import { ChartConfiguration, StorageData } from "../../types/metrics";
import { ChartProps, ChartPropsValidation } from "../../types/charts";

interface Props extends ChartProps {
  storageData: StorageData;
  autosize: boolean;
}

export default defineComponent({
  props: {
    storageData: {
      type: Object,
      default: null
    },
    autosize: {
      type: Boolean,
      default: true
    },
    ...ChartPropsValidation
  },
  setup(props: Props, context: SetupContext) {
    const { getLayout, getDataset, getOptions } = useTreemapConfiguration(
      props.autosize,
      props.chartConfiguration,
      props.maxChartWidth
    );

    onMounted(() => {
      Plotly.newPlot(props.graphId, getDataset(), getLayout(), getOptions());
      watch(() => {
        if (Object.keys(props.storageData).length) {
          Plotly.deleteTraces(props.graphId, 0);
          Plotly.addTraces(props.graphId, getDataset(props.storageData));
        }
      });

      watch(
        () => props.maxChartWidth,
        () => {
          if (props.maxChartWidth != 0) {
            console.log(props.maxChartWidth, props.autosize);
            Plotly.relayout(props.graphId, {
              width: 0.8 * props.maxChartWidth
            });
          }
        }
      );
    });
  }
});
function useTreemapConfiguration(
  autosize: boolean,
  chartConfiguration: ChartConfiguration,
  width: number
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
      autosize: false,
      width: width,
      height: width / 2,
      hovermode: "closest",
      hoverlabel: { bgcolor: "#FFF" }
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
    return { displayModeBar: false, responsive: true };
  }
  return { getLayout, getDataset, getOptions };
}
</script>
<style>
.treemap {
  width: 100%;
}
</style>
