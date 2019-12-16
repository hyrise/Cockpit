<template>
  <div>
    <div class="chart mx-10 my-10">
      <v-row align="center">
        <v-col cols="6" class="mx-10">
          <v-select
            v-model="selectedDatabaseIds"
            :items="databases.map(database => database.id)"
            chips
            label="databases"
            multiple
            outlined
            prepend-icon="mdi-database"
          ></v-select>
        </v-col>
      </v-row>
      <div id="graph1"></div>
    </div>
  </div>
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
import { useGeneratingTestData } from "../helpers/testData";
import { useThroughputFetchService } from "../services/throughputService";
import { useThreadConfigurationService } from "../services/threadService";
import { useDatabaseFetchService } from "../services/databaseService";
import { useCpuFetchService } from "../services/cpuService";
import { ThroughputData } from "../types/throughput";
import { Database } from "../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";

interface Props {}

interface Data {
  cpuData: Ref<ThroughputData>;
  databases: Ref<Database[]>;
  selectedDatabaseIds: Ref<string[]>;
}

export default createComponent({
  setup(props: Props, context: SetupContext): Data {
    const databases = Vue.prototype.$databases;
    const { getCpu, cpuData, cpuQueryReadyState } = useCpuFetchService(
      onCPUChange
    );

    const { getDataset, getLayout } = useThroughputLineChartConfiguration(
      databases.value
    );

    const selectedDatabaseIds = ref<string[]>([]);

    onMounted(() => {
      console.log(cpuData.value);
      Plotly.newPlot("graph1", [getDataset()], getLayout());
      setInterval(checkState, 1000);

      // watch for changes in selected databases
      watch(
        () => selectedDatabaseIds.value,
        selectedDatabaseIds => {
          const newDatasets = selectedDatabaseIds.reduce((result, id): any => {
            return [
              ...result,
              getDataset(cpuData.value[id] ? cpuData.value[id] : [], id)
            ];
          }, []);
          Plotly.purge("graph1");
          Plotly.plot("graph1", newDatasets, getLayout());
        }
      );
    });

    function checkState(): void {
      if (cpuQueryReadyState.value) {
        getCpu();
      }
    }

    function onCPUChange() {
      updateChartDatasets();
    }

    function getMaxDatasetLength(): number {
      return selectedDatabaseIds.value.reduce((currentMax, id) => {
        return Math.max(cpuData.value[id].length, currentMax);
      }, 0);
    }

    function updateChartDatasets(): void {
      const newData = {
        y: Object.values(selectedDatabaseIds.value).map(id => cpuData.value[id])
      };
      const maxSelectedLength = getMaxDatasetLength();

      Plotly.update(
        "graph1",
        newData,
        getLayout(
          Math.max(maxSelectedLength - 30, 0),
          Math.max(maxSelectedLength, 30)
        )
      );
    }

    return {
      cpuData,
      databases,
      selectedDatabaseIds
    };
  }
});

function useThroughputLineChartConfiguration(
  databases: Database[]
): {
  getDataset: (throughputData?: number[], databaseId?: string) => Object;
  getLayout: (xMin?: number, xMax?: number) => Object;
} {
  function getLayout(xMin: number = 0, xMax: number = 30): Object {
    return {
      title: "CPU",
      xaxis: {
        title: "time in s",
        range: [xMin, xMax]
      },
      yaxis: {
        title: "Queries per second",
        rangemode: "tozero"
      }
    };
  }

  function getDatabaseById(databaseId: string): Database | undefined {
    return databases.find(element => element.id === databaseId);
  }

  function getDataset(
    throughputData: number[] = [],
    databaseId: string = ""
  ): Object {
    const database: Database | undefined = getDatabaseById(databaseId);
    return {
      y: throughputData,
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
