<template>
  <div>
    <div class="mx-10 my-10">
      <v-row align="center">
        <v-col cols="6" class="mx-10">
          <v-select
            v-model="selectedTable"
            :items="tables"
            chips
            label="table"
            outlined
            prepend-icon="mdi-table"
          ></v-select>
        </v-col>
      </v-row>
      <Heatmap
        :graph-id="graphId || 'access'"
        :data="mapData"
        :x-values="columns"
        :y-values="chunks"
        :chart-configuration="chartConfiguration"
      />
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

import { useGenericFetchService } from "../../services/genericFetchService";
import Heatmap from "../charts/Heatmap.vue";
import { MetricProps, MetricPropsValidation } from "../../types/metrics";

interface Data {
  tables: Ref<string[]>;
  mapData: Ref<number[][]>;
  columns: Ref<string[]>;
  chunks: Ref<string[]>;
  chartConfiguration: string[];
  selectedTable: Ref<string>;
}

export default createComponent({
  name: "Access",
  components: {
    Heatmap
  },
  props: MetricPropsValidation,
  setup(props: MetricProps, context: SetupContext): Data {
    const selectedTable = ref<string>("");
    const { tables } = context.root.$databaseData;
    const { data, checkState } = useGenericFetchService(props.metricMeta);

    const table = computed(() => selectedTable.value);

    const mapData = ref<number[][]>([]);
    const columns = ref<string[]>([]);
    const chunks = ref<string[]>([]);
    const chartConfiguration: string[] = ["Access frequency"];

    watch([data, table], () => {
      if (data.value != {} && table.value != "") {
        const {
          newColumns,
          newChunks,
          dataByChunks
        } = props.metricMeta.transformationService(
          data.value,
          props.selectedDatabases[0],
          table.value
        );
        chunks.value = newChunks;
        columns.value = newColumns;
        mapData.value = dataByChunks;
      }
    });

    checkState();
    onMounted(() => {
      setInterval(checkState, 5000);
    });

    return {
      chartConfiguration,
      tables,
      mapData,
      columns,
      chunks,
      selectedTable
    };
  }
});
</script>
