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
import { Database } from "../../types/database";
import * as Plotly from "plotly.js";

interface Props {
  data: any;
  selectedDatabases: Database[];
  graphId: string;
  chartConfiguration: string[];
  maxValue: number;
  timestamps: Date[];
}

export default defineComponent({
  props: {
    data: {
      type: Object,
      default: null
    },
    selectedDatabases: {
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
    },
    maxValue: {
      type: Number,
      default: 1
    },
    timestamps: {
      type: Array,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): void {
    const selectedDatabaseIds = computed(() =>
      props.selectedDatabases.map(database => database.id)
    );
    const data = computed(() => props.data);
    const graphId = props.graphId;
    const { getDataset, getLayout, getOptions } = useLineChartConfiguration(
      context,
      props.chartConfiguration
    );
    const { isReady } = context.root.$databaseService;

    onMounted(() => {
      watch(isReady, () => {
        if (isReady.value) {
          Plotly.newPlot(
            graphId,
            getDatasets(),
            getLayout(props.maxValue),
            getOptions()
          );
        }
      });
      watch(selectedDatabaseIds, () => {
        if (isReady.value) {
          handleDatabaseChange();
        }
      });
      watch(data, () => {
        if (isReady.value && Object.keys(data.value).length) {
          updateChartDatasets();
        }
      });
    });

    function getDatasets(): any[] {
      return selectedDatabaseIds.value.reduce((result, id): any => {
        return [
          ...result,
          getDataset(data.value[id] ? data.value[id] : [], id)
        ];
      }, []);
    }

    function handleDatabaseChange(): void {
      Plotly.purge(graphId);
      Plotly.plot(
        graphId,
        getDatasets(),
        getLayout(props.maxValue),
        getOptions()
      );
    }

    function getMaxDatasetLength(): number {
      return selectedDatabaseIds.value.reduce((currentMax, id) => {
        return Math.max(data.value[id].length, currentMax);
      }, 0);
    }

    function updateChartDatasets(): void {
      const timestamps = props.timestamps;
      const newData = {
        y: Object.values(selectedDatabaseIds.value).map(id => data.value[id]),
        x: Object.values(selectedDatabaseIds.value).map(() => timestamps)
      };
      const maxSelectedLength = getMaxDatasetLength();

      Plotly.update(
        graphId,
        newData,
        getLayout(props.maxValue, Math.min(maxSelectedLength, 30))
      );
    }
  }
});

function useLineChartConfiguration(
  context: SetupContext,
  chartConfiguration: string[]
): {
  getDataset: (data?: number[], databaseId?: string) => Object;
  getLayout: (yMax: number, xMin?: number) => Object;
  getOptions: () => Object;
} {
  const databases: Ref<Database[]> = context.root.$databaseService.databases;
  function getLayout(yMax: number, xMin: number = 1): Object {
    const currentDate = Date.now();
    return {
      xaxis: {
        title: {
          text: chartConfiguration[1],
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
          text: chartConfiguration[2],
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
      }
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

  function getDatabaseById(databaseId: string): Database | undefined {
    return databases.value.find(element => element.id === databaseId);
  }

  function getDataset(data: number[] = [], databaseId: string = ""): Object {
    const database: Database | undefined = getDatabaseById(databaseId);
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
