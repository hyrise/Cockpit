<template>
  <div :id="graphId"></div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  watch,
  inject
} from "@vue/composition-api";
import * as Plotly from "plotly.js";
import { useUpdatingDatabases } from "../../meta/databases";
import { ChartConfiguration } from "../../types/metrics";
import { useChartReactivity, useResizingOnChange } from "../../meta/charts";
import { ChartProps, ChartPropsValidation } from "../../types/charts";
import { useFormatting } from "@/meta/formatting";

interface Props extends ChartProps {
  maxValue: number;
  timestamps: Date[];
}

export default defineComponent({
  props: {
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
    const { databasesUpdated } = context.root.$databaseController;
    const { updateLayout } = useResizingOnChange(props);
    const multipleDatabasesAllowed = inject<boolean>(
      "multipleDatabasesAllowed",
      true
    );

    const { getDataset, getLayout, getOptions } = useLineChartConfiguration(
      context,
      props,
      multipleDatabasesAllowed
    );

    onMounted(() => {
      Plotly.newPlot(
        props.graphId,
        getDatasets(),
        getLayout(props.maxValue),
        getOptions()
      );
      useChartReactivity(props, context, updateChartDatasets, updateLayout);

      watch(
        () => props.selectedDatabases,
        () => {
          if (databasesUpdated.value && multipleDatabasesAllowed) {
            handleDatabaseChange();
          }
        }
      );
    });

    function handleDatabaseChange(): void {
      Plotly.react(
        props.graphId,
        getDatasets(),
        getLayout(props.maxValue),
        getOptions()
      );
    }

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
  props: Props,
  multipleDatabasesAllowed: boolean
): {
  getDataset: (data?: number[], databaseId?: string) => Object;
  getLayout: (yMax: number, xMin?: number) => Object;
  getOptions: () => Object;
} {
  const { databases } = useUpdatingDatabases(props, context);
  const { formatDateWithoutMilliSec } = useFormatting();

  function getLayout(yMax: number, xMin: number = 1): Object {
    const currentTime = formatDateWithoutMilliSec(new Date()).getTime();
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
        range: [currentTime - (xMin - 1) * 1000, currentTime]
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
        range: [0, yMax * 1.05 > 0 ? yMax * 1.05 : 1]
        // linecolor: "#616161",
        // gridcolor: "#616161",
        // tickcolor: "#616161",
        // tickfont: {
        //   size: 12,
        //   color: "#FAFAFA"
        // },
        //linewidth: 2
      },
      autosize: true,
      showlegend: multipleDatabasesAllowed,
      legend: { x: 0, y: 1.3 }

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
    return { displayModeBar: false };
  }
  return { getDataset, getLayout, getOptions };
}
</script>
<style scoped></style>
