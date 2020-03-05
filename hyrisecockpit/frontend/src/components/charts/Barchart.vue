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
  watch,
  inject
} from "@vue/composition-api";
import * as Plotly from "plotly.js";
import { ChartConfiguration } from "../../types/metrics";
import { useResizingOnDatabaseChange } from "../../meta/charts";
import { ChartProps, ChartPropsValidation } from "../../types/charts";

interface Props extends ChartProps {
  data: any;
}

export default defineComponent({
  props: {
    data: {
      type: Array,
      default: null
    },
    ...ChartPropsValidation
  },
  setup(props: Props, context: SetupContext): void {
    const { getLayout, getOptions } = useBarChartConfiguration(
      context,
      props.chartConfiguration
    );
    const chartWidth = ref(inject<Ref<number>>("width", ref(0)));
    const length = inject<Ref<number>>("length", ref(0));

    onMounted(() => {
      Plotly.newPlot(
        props.graphId,
        props.data as any,
        getLayout(),
        getOptions()
      );

      watch(
        () => props.maxChartWidth,
        () =>
          Plotly.relayout(props.graphId, {
            width: props.maxChartWidth
          })
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
        Plotly.update(props.graphId, props.data as any, getLayout());
      }
    });
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
      autosize: true
    };
  }

  function getOptions(): Object {
    return { displayModeBar: false, responsive: true };
  }
  return { getLayout, getOptions };
}
</script>
<style scoped></style>
