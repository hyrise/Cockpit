<template>
  <div>
    <div class="mt-12">
      <v-select
        v-model="selectedTable"
        :items="tables"
        class="select"
        chips
        label="table"
        outlined
        prepend-icon="mdi-table"
        width="100"
      />
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

import Heatmap from "../charts/Heatmap.vue";
import { MetricProps, MetricPropsValidation } from "../../types/metrics";
import { equals } from "../../helpers/methods";

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
    const data = context.root.$metricController.data[props.metric];
    const watchedDatabase = props.selectedDatabases.map(
      database => database.id
    )[0];
    const tables = ref<string[]>(props.selectedDatabases[0].tables);
    const { isReady } = context.root.$databaseService;
    console.log(tables);

    const mapData = ref<number[][]>([]);
    const columns = ref<string[]>([]);
    const chunks = ref<string[]>([]);
    const chartConfiguration: string[] = ["Access frequency"];

    watch(
      () => props.selectedDatabases[0].tables,
      () => {
        if (isReady) {
          tables.value = props.selectedDatabases[0].tables;
        }
      }
    );

    watch([data, selectedTable], () => {
      if (Object.keys(data.value).length && selectedTable.value != "") {
        const {
          newColumns,
          newChunks,
          dataByChunks
        } = props.metricMeta.transformationService(
          data.value,
          watchedDatabase,
          selectedTable.value
        );
        chunks.value = newChunks;
        columns.value = newColumns;
        mapData.value = dataByChunks;
      }
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
<style scoped>
.select {
  z-index: 2;
  width: 50%;
  margin: auto;
}
</style>
