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

interface Props {
  data: any;
  graphId: string;
  chartConfiguration: string[];
}

export default defineComponent({
  props: {
    data: {
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
  setup(props: Props, context: SetupContext): void {
    const { getLayout, getOptions } = useBarChartConfiguration(
      context,
      props.chartConfiguration
    );

    onMounted(() => {
      Plotly.newPlot(
        props.graphId,
        props.data as any,
        getLayout(),
        getOptions()
      );

      watch(
        () => props.data,
        () => {
          if (props.data.length) {
            updateChartDatasets();
          }
        }
      );
      function updateChartDatasets(): void {
        Plotly.react(
          props.graphId,
          props.data as any,
          getLayout(),
          getOptions()
        );
      }
    });
  }
});

function useBarChartConfiguration(
  context: SetupContext,
  chartConfiguration: string[]
): {
  getLayout: () => Object;
  getOptions: () => Object;
} {
  function getLayout(): Object {
    return {
      xaxis: {
        title: {
          text: chartConfiguration[1]
        },
        rangemode: "tozero"
      },
      yaxis: {
        title: {
          text: chartConfiguration[2]
        },
        rangemode: "tozero"
      },
      barmode: "stack"
    };
  }

  function getOptions(): Object {
    return { displayModeBar: false };
  }
  return { getLayout, getOptions };
}
</script>
<style scoped></style>
