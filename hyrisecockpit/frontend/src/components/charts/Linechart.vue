<template>
  <div :id="graphId"></div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onUnmounted,
  onMounted,
  computed,
  Ref,
  ref,
  watch,
  inject
} from "@vue/composition-api";
import * as Plotly from "plotly.js";
import { useUpdatingDatabases } from "../../meta/databases";
import { ChartConfiguration } from "../../types/metrics";
import { useResizingOnDatabaseChange } from "../../meta/charts";
import { ChartProps, ChartPropsValidation } from "../../types/charts";

interface Props extends ChartProps {
  data: any;
  maxValue: number;
  timestamps: Date[];
}

export default defineComponent({
  props: {
    data: {
      type: Object,
      default: null
    },
    maxValue: {
      type: Number,
      default: 1
    },
    timestamps: {
      type: Array,
      default: null
    },
    ...ChartPropsValidation
  },
  setup(props: Props, context: SetupContext): void {
    const { getDataset, getLayout, getOptions } = useLineChartConfiguration(
      context,
      props
    );
    const { databasesUpdated } = context.root.$databaseController;
    const chartWidth = inject<Ref<number>>("width", ref(0));

    onMounted(() => {
      Plotly.newPlot(
        props.graphId,
        getDatasets(),
        getLayout(props.maxValue),
        getOptions()
      );

      //useResizingOnDatabaseChange(props.graphId, chartWidth, length);

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
          if (databasesUpdated.value && Object.keys(props.data).length) {
            updateChartDatasets();
          }
        }
      );
    });

    function getDatasets(): any[] {
      return props.selectedDatabases.reduce((result, id): any => {
        return [
          ...result,
          getDataset(props.data[id] ? props.data[id] : [], id)
        ];
      }, []);
    }

    function getMaxDatasetLength(): number {
      return props.selectedDatabases.reduce((currentMax, id) => {
        return Math.max(props.data[id].length, currentMax);
      }, 0);
    }

    function updateChartDatasets(): void {
      const timestamps = props.timestamps;
      const newData = {
        y: Object.values(props.selectedDatabases).map(id => props.data[id]),
        x: Object.values(props.selectedDatabases).map(() => timestamps)
      };
      const maxSelectedLength = getMaxDatasetLength();

      Plotly.update(
        props.graphId,
        newData,
        getLayout(props.maxValue, Math.min(maxSelectedLength, 30))
      );
    }
  }
});

function useLineChartConfiguration(
  context: SetupContext,
  props: Props
): {
  getDataset: (data?: number[], databaseId?: string) => Object;
  getLayout: (yMax: number, xMin?: number) => Object;
  getOptions: () => Object;
} {
  const { databases } = useUpdatingDatabases(props, context);
  function getLayout(yMax: number, xMin: number = 1): Object {
    const currentDate = Date.now();
    return {
      xaxis: {
        title: {
          text: props.chartConfiguration.xaxis,
          font: {
            //size: 16
            //color: "#FAFAFA"
          }
        },
        type: "date",
        tickformat: "%H:%M:%S",
        range: [currentDate - xMin * 1000, currentDate]
        // linecolor: "#616161",
        // gridcolor: "#616161",
        // tickcolor: "#616161",
        // tickfont: {
        //   size: 12,
        //   color: "#FAFAFA"
        // },
        //linewidth: 2
      },
      yaxis: {
        title: {
          text: props.chartConfiguration.yaxis,
          font: {
            // size: 16
            //color: "#FAFAFA"
          }
        },
        range: [0, yMax * 1.05]
        // linecolor: "#616161",
        // gridcolor: "#616161",
        // tickcolor: "#616161",
        // tickfont: {
        //   size: 12,
        //   color: "#FAFAFA"
        // },
        //linewidth: 2
      },
      autosize: true
      //  width: 100,
      //  height: 100

      // plot_bgcolor: "#424242",
      // paper_bgcolor: "#424242",
      // legend: {
      //   font: {
      //     family: "sans-serif",
      //     size: 12,
      //     color: "#FAFAFA"
      //   }
      // }
    };
  }

  function getDataset(data: number[] = [], databaseId: string = ""): Object {
    const database = databases.value.find(
      database => database.id === databaseId
    );
    return {
      y: data,
      mode: "lines+markers",
      line: database ? { color: database.color } : {},
      name: database ? database.id : {}
    };
  }

  function getOptions(): Object {
    return { displayModeBar: false, responsive: true };
  }
  return { getDataset, getLayout, getOptions };
}
</script>
<style scoped></style>
