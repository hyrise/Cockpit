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

import { QueryData } from "../../types/genericQueryData";
import { Database } from "../../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";
import { useGeneratingTestData } from "../../helpers/testData";

interface Props {
  data: QueryData;
  selectedDatabaseId: string;
  selectedTable: string;
  graphId: string;
  chartConfiguration: string[];
}

export default createComponent({
  name: "Heatmap",
  props: {
    data: {
      type: Object,
      default: null
    },
    selectedDatabaseId: {
      type: String,
      default: null
    },
    selectedTable: {
      type: String,
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
    const { generateAccessData } = useGeneratingTestData();

    const testData = generateAccessData();
    const mapData = ref<number[][]>([]);
    const table = computed(() => props.selectedTable);
    const instance = computed(() => props.selectedDatabaseId);

    onMounted(() => {
      // when selecting different table page gets smaller because of purge
      Plotly.newPlot(props.graphId, [
        {
          z: mapData.value,
          type: "heatmap"
        }
      ]); // refactor to getLayout function (use lable for axis)
      watch([table, instance], () => {
        updateHeatMapDataset();
        Plotly.purge(props.graphId);
        Plotly.newPlot(props.graphId, [
          {
            z: mapData.value,
            type: "heatmap"
          }
        ]);
      });
    });

    function updateHeatMapDataset() {
      // out source to access component to keep generic functionality (maybe pass function by prop)
      const dataByColumns: number[][] = [];
      const dataByChunks: number[][] = [];

      Object.keys(
        testData.body.chunks_data[instance.value][table.value]
      ).forEach(column => {
        dataByColumns.push(
          testData.body.chunks_data[instance.value][table.value][column]
        );
      });

      const numberOfChunks = dataByColumns[0].length;

      for (let i = 0; i < numberOfChunks; i++) {
        let chunk: number[] = [];
        dataByColumns.forEach(column => {
          chunk.push(column[i]);
        });
        dataByChunks.push(chunk);
      }
      mapData.value = dataByChunks;
    }
  }
});
</script>
