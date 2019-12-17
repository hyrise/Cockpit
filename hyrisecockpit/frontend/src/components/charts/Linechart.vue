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

import { QueryData } from "../../types/queryData";
import { Database } from "../../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";

interface Props {
  data: QueryData;
  selectedDatabaseIds: string[];
  graphId: string;
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
    }
  },
  setup(props: Props, context: SetupContext): void {
    const selectedDatabaseIds = computed(() => props.selectedDatabaseIds);
    const data = computed(() => props.data);
    const graphId = props.graphId;
    const { getDataset, getLayout } = useLineChartConfiguration(
      "CPU",
      "Time ins s",
      "Workload"
    );

    onMounted(() => {
      Plotly.newPlot(graphId, [getDataset()], getLayout());
      watch(selectedDatabaseIds, () => {
        handleDatabaseChange();
      });
      watch(data, () => {
        updateChartDatasets();
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
      Plotly.plot(graphId, newDatasets, getLayout());
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
  mainTitle: string,
  xTitle: string,
  yTitle: string
): {
  getDataset: (data?: number[], databaseId?: string) => Object;
  getLayout: (xMin?: number, xMax?: number) => Object;
} {
  const databases: Ref<Database[]> = Vue.prototype.$databases;
  function getLayout(xMin: number = 0, xMax: number = 30): Object {
    return {
      title: mainTitle,
      xaxis: {
        title: xTitle,
        range: [xMin, xMax]
      },
      yaxis: {
        title: yTitle,
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
<style scoped>
.chart {
  max-width: 1200px;
  max-height: 900px;
}
</style>
