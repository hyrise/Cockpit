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
      <div id="graph"></div>
      <div class="slider my-12">
        <v-slider
          v-model="threads"
          v-on:click="setNumberOfThreads"
          thumb-label="always"
          min="0"
          max="32"
          label="Number of Threads"
        >
        </v-slider>
        <v-btn outlined large color="#1E90FF" @click="resetData">
          Reset
        </v-btn>
      </div>
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
import { ThroughputData } from "../types/throughput";
import { Database } from "../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";

interface Props {
  preselectedDatabaseId: string;
}


interface Data {
  throughputData: Ref<ThroughputData>;
  resetData: () => void;
  threads: Ref<number>;
  setNumberOfThreads: () => void;
  databases: Ref<Database[]>;
  selectedDatabaseIds: Ref<string[]>;
}

export default createComponent({
  props: {
    preselectedDatabaseId: { type: String }
  },
  setup(props: Props, context: SetupContext): Data {
    const { threads, setNumberOfThreads } = useThreadConfigurationService();
    const {
      getThroughput,
      throughputData,
      throughputQueryReadyState
    } = useThroughputFetchService(onTPChange);

    const databases = Vue.prototype.$databases;

    const { getDataset, getLayout } = useThroughputLineChartConfiguration(
      databases.value
    );

    const selectedDatabaseIds = ref<string[]>(
      props.preselectedDatabaseId ? [props.preselectedDatabaseId] : []
    );

    onMounted(() => {
      Plotly.newPlot("graph", [getDataset()], getLayout());
      setInterval(checkState, 1000);
      // watch for changes in selected databases
      watch(
        () => selectedDatabaseIds.value,
        selectedDatabaseIds => {
          const newDatasets = selectedDatabaseIds.reduce((result, id): any => {
            return [
              ...result,
              getDataset(
                throughputData.value[id] ? throughputData.value[id] : [],
                id
              )
            ];
          }, []);
          Plotly.purge("graph");
          Plotly.plot("graph", newDatasets, getLayout());
        }
      );

    });

    function checkState(): void {
      if (throughputQueryReadyState.value) {
        getThroughput();
      }
    }

    function resetData(): void {
      throughputData.value = {};
    }

    function onTPChange() {
      updateChartDatasets();
    }

    function getMaxDatasetLength(): number {
      return selectedDatabaseIds.value.reduce((currentMax, id) => {
        return Math.max(throughputData.value[id].length, currentMax);
      }, 0);
    }

    function updateChartDatasets(): void {
      const newData = {
        y: Object.values(selectedDatabaseIds.value).map(
          id => throughputData.value[id]
        )
      };
      const maxSelectedLength = getMaxDatasetLength();

      Plotly.update(
        "graph",
        newData,
        getLayout(
          Math.max(maxSelectedLength - 30, 0),
          Math.max(maxSelectedLength, 30)
        )
      );
    }

    return {
      throughputData,
      resetData,
      threads,
      databases,
      setNumberOfThreads,
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
      title: "Throughput",
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
