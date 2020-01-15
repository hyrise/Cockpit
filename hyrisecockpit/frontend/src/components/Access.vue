<template>
  <div>
    <div class="chart mx-10 my-10">
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
        graph-id="access"
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

import { useGenericFetchService } from "../services/genericFetchService";
import { useDatabaseFetchService } from "../services/databaseService";
import Heatmap from "./charts/Heatmap.vue";
import { useDataTransformation } from "../services/transformationService";
import { componentMap } from "./components";

interface Props {
  preselectedDatabaseId: string;
}
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
  props: {
    preselectedDatabaseId: {
      type: String,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): Data {
    const component = componentMap["access"];
    const selectedTable = ref<string>("");
    const { tables } = useDatabaseFetchService();
    const { data, checkState } = useGenericFetchService(component);

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
        } = component.transformationService(
          data.value,
          props.preselectedDatabaseId,
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
<style scoped>
.chart {
  max-width: 1200px;
  max-height: 900px;
}
</style>
