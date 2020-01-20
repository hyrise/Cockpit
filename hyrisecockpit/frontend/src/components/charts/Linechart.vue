<template>
  <div :id="graphId"></div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch
} from "@vue/composition-api";
import axios from "axios";
import { Database } from "../../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";

interface Props {
  data: any;
  selectedDatabaseIds: string[];
  graphId: string;
  chartConfiguration: string[];
}

export default createComponent({
  props: {
    data: {
      type: Object,
      default: null
    },
    selectedDatabaseIds: {
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
    const selectedDatabaseIds = computed(() => props.selectedDatabaseIds);
    const data = computed(() => props.data);
    const graphId = props.graphId;
    const { getDataset, getLayout } = useLineChartConfiguration(
      context,
      props.chartConfiguration
    );
    const { isReady } = context.root.$databaseData;
    console.log(selectedDatabaseIds);

    onMounted(() => {
      watch(isReady, () => {
        if (isReady.value) {
          Plotly.newPlot(
            graphId,
            [getDataset([], context.root.$route.params.id)],
            getLayout(),
            { displayModeBar: false }
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

    function handleDatabaseChange(): void {
      const newDatasets = selectedDatabaseIds.value.reduce(
        (result, id): any => {
          return [
            ...result,
            getDataset(data.value[id] ? data.value[id] : [], id)
          ];
        },
        []
      );
      Plotly.purge(graphId);
      Plotly.plot(graphId, newDatasets, getLayout(), { displayModeBar: false });
    }

    function getMaxDatasetLength(): number {
      return selectedDatabaseIds.value.reduce((currentMax, id) => {
        return Math.max(data.value[id].length, currentMax);
      }, 0);
    }

    function updateChartDatasets(): void {
      const newData = {
        y: Object.values(selectedDatabaseIds.value).map(id => data.value[id])
      };
      const maxSelectedLength = getMaxDatasetLength();

      Plotly.update(
        graphId,
        newData,
        getLayout(
          Math.max(maxSelectedLength - 30, 0),
          Math.max(maxSelectedLength, 30)
        )
      );
    }
  }
});

function useLineChartConfiguration(
  context: SetupContext,
  chartConfiguration: string[]
): {
  getDataset: (data?: number[], databaseId?: string) => Object;
  getLayout: (xMin?: number, xMax?: number) => Object;
} {
  const databases: Ref<Database[]> = context.root.$databaseData.databases;
  function getLayout(xMin: number = 0, xMax: number = 30): Object {
    return {
      xaxis: {
        title: chartConfiguration[1],
        range: [xMin, xMax]
      },
      yaxis: {
        title: chartConfiguration[2],
        rangemode: "tozero"
      }
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
  return { getDataset, getLayout };
}
</script>
<style scoped></style>
