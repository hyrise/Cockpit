<template>
  <div :id="graphId"></div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  watch,
  computed,
  inject
} from "@vue/composition-api";
import * as Plotly from "plotly.js";
import { useUpdatingDatabases } from "../../meta/databases";
import { ChartConfiguration } from "../../types/metrics";
import { useChartReactivity, useResizingOnChange } from "../../meta/charts";
import { ChartProps, ChartPropsValidation } from "../../types/charts";
import { useFormatting } from "@/meta/formatting";
import colors from "vuetify/lib/util/colors";
import { eventBus } from "@/plugins/eventBus";

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
    pluginEventData: {
      type: Object,
      default: null
    },
    ...ChartPropsValidation
  },
  setup(props: Props, context: SetupContext): void {
    const { databasesUpdated } = context.root.$databaseController;
    const { pluginEventData } = context.root.$pluginService;
    const { updateLayout } = useResizingOnChange(props);
    const multipleDatabasesAllowed = inject<boolean>(
      "multipleDatabasesAllowed",
      true
    );
    const { formatDateWithoutMilliSec } = useFormatting();

    const { getDataset, getLayout, getOptions } = useLineChartConfiguration(
      context,
      props,
      multipleDatabasesAllowed
    );

    // eventBus.$on("PLUGIN_DEACTIVATED", (pluginInfo: any) => {
    //   Plotly.extendTraces(
    //     props.graphId,
    //     {
    //       y: [[props.maxValue + 1]],
    //       x: [[formatDateWithoutMilliSec(new Date())]],
    //       textinfo: "text"
    //     },
    //     [-1]
    //   );
    // });

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

      watch(
        () => props.pluginEventData,
        () => {
          if(props.pluginEventData){
            
          const currentPluginEventData = props.pluginEventData[props.selectedDatabases[0]];
          if(currentPluginEventData) {
            Plotly.restyle(
              props.graphId,
              {
                y: 
                  currentPluginEventData.timestamps.map(
                    x => props.maxValue+1
                  )
                ,
                x: currentPluginEventData.timestamps.map(
                    x => new Date().getTime()
                  )
              },
              [0]
            );
          }
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
      return [
        ...props.selectedDatabases.map((id: string) =>
          getDataset(props.data[id] ? props.data[id] : [], id)
        ),
        {
          y: [],
          x: [],
          type: "bar",
          name: "plugin events",
          width: 1,
          marker: {
            color: colors.grey.lighten1
          }
        }
      ];
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
        getLayout(props.maxValue, Math.min(maxSelectedLength, 30)),
        props.selectedDatabases.map((x, index) => index)
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
      height: multipleDatabasesAllowed ? 300 : 225,
      xaxis: {
        type: "date",
        tickformat: "%H:%M:%S",
        range: [currentTime - (xMin - 1) * 1000, currentTime]
      },
      yaxis: {
        title: {
          text: props.chartConfiguration.yaxis
        },
        range: [0, yMax * 1.05 > 0 ? yMax * 1.05 : 1]
      },
      autosize: true,
      showlegend: multipleDatabasesAllowed,
      legend: { x: 0, y: 1.1, orientation: "h" },
      margin: {
        l: 70,
        r: 40,
        b: 30,
        t: multipleDatabasesAllowed ? 0 : 10,
        pad: 0
      },
      paper_bgcolor: "rgba(0,0,0,0)"
    };
  }

  function getDataset(data: number[] = [], databaseId: string = ""): any {
    const database = databases.value.find(
      database => database.id === databaseId
    );
    return {
      y: data,
      type: "scatter",
      mode: "lines+markers",
      fill: multipleDatabasesAllowed || "tonexty",
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
