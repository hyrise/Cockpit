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
  labels: string[];
  parents: string[];
  values: number[];
  text: string[];
  graphId: string;
  chartConfiguration: ChartConfiguration;
  autosize: boolean;
}

export default defineComponent({
  props: {
    labels: {
      type: Array,
      default: null
    },
    parents: {
      type: Array,
      default: null
    },
    values: {
      type: Array,
      default: null
    },
    text: {
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
        if (
          props.labels.length > 0 &&
          props.parents.length > 0 &&
          props.values.length > 0
        ) {
          Plotly.deleteTraces(props.graphId, 0);
          Plotly.addTraces(
            props.graphId,
            getDataset(props.labels, props.parents, props.values, props.text)
          );
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
  getDataset: (
    labels?: string[],
    parents?: string[],
    values?: number[],
    text?: string[]
  ) => Object[];
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
      height: autosize ? 0 : 800
    };
  }
  function getDataset(
    labels: string[] = [],
    parents: string[] = [],
    values: number[] = [],
    text: string[] = []
  ): Object[] {
    return [
      {
        type: "treemap",
        labels: labels,
        parents: parents,
        values: values,
        text: text,
        hoverinfo: "label+text+percent parent+percent entry",
        texttemplate: "<b>%{label}</b> <br>%{value}MB",
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
