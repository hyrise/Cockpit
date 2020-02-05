<template>
  <div :id="graphId"></div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  onMounted,
  watch,
  Ref,
  ref
} from "@vue/composition-api";
import * as Plotly from "plotly.js";

interface Props {
  labels: string[];
  parents: string[];
  values: number[];
  graphId: string;
  chartConfiguration: string[];
}

export default createComponent({
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
    graphId: {
      type: String,
      default: null
    },
    chartConfiguration: {
      type: Array,
      default: null
    }
  },
  setup(props: Props, context: SetupContext) {
    const { getLayout, getDataset, getOptions } = useTreemapConfiguration(
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
            getDataset(props.labels, props.parents, props.values)
          );
        }
      });
    });
  }
});
function useTreemapConfiguration(
  chartConfiguration: string[]
): {
  getLayout: () => Object;
  getDataset: (
    labels?: string[],
    parents?: string[],
    values?: number[]
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
      autosize: false,
      width: 1200,
      height: 900
    };
  }
  function getDataset(
    labels: string[] = [],
    parents: string[] = [],
    values: number[] = []
  ): Object[] {
    return [
      {
        type: "treemap",
        labels: labels,
        parents: parents,
        values: values,
        textinfo: "label+value+percent parent+percent entry",
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
