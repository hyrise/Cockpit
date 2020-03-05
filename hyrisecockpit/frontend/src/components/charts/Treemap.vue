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
import { ChartConfiguration } from "../../types/metrics";

interface Props {
  storageData: Object; //TODO: add storage type
  graphId: string;
  chartConfiguration: ChartConfiguration;
  autosize: boolean;
}

export default defineComponent({
  props: {
    graphId: {
      type: String,
      default: null
    },
    chartConfiguration: {
      type: Object,
      default: null
    },
    storageData: {
      type: Object,
      default: null
    },
    autosize: {
      type: Boolean,
      default: true
    }
  },
  setup(props: Props, context: SetupContext) {
    const { getLayout, getDataset, getOptions } = useTreemapConfiguration(
      props.autosize,
      props.chartConfiguration
    );

    onMounted(() => {
      Plotly.newPlot(props.graphId, getDataset(), getLayout(), getOptions());
      watch(() => {
        if (Object.keys(props.storageData).length) {
          console.log(props.storageData);
          Plotly.deleteTraces(props.graphId, 0);
          Plotly.addTraces(props.graphId, getDataset(props.storageData));
        }
      });
    });
  }
});
function useTreemapConfiguration(
  autosize: boolean,
  chartConfiguration: ChartConfiguration
): {
  getLayout: () => Object;
  getDataset: (data?: Object) => Object[];
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
      autosize: autosize,
      width: autosize ? 0 : 1600,
      height: autosize ? 0 : 800,
      hovermode: "closest",
      hoverlabel: { bgcolor: "#FFF" }
    };
  }
  function getDataset(data: Object = {}): Object[] {
    return [
      {
        type: "treemap",
        labels: data.labels,
        parents: data.parents,
        values: data.sizes,
        text: data.texts,
        hovertemplate:
          "<b>%{label}</b> <br>size: %{text.size}  <br>%{text.percentOfDatabase} <br>%{text.percentOfTable} <br>%{text.dataType} <br>%{text.encoding}<extra></extra>",
        texttemplate:
          "<b>%{label}</b> <br>size:%{text.size} <br>%{text.dataType} <br>%{text.encoding}", //TODO: data type and encoding
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
  width: 100%;
}
</style>
