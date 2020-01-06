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
  selectedDatabaseIds: string[];
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
    selectedDatabaseIds: {
      type: Array,
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

    const data: any = [
      {
        z: [
          [1, 20, 30],
          [20, 1, 60],
          [30, 60, 1]
        ],
        type: "heatmap"
      }
    ];
    onMounted(() => {
      Plotly.newPlot(props.graphId, data);
    });
  }
});
</script>
