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
        :selected-database-id="$route.params.id"
        :data="data"
        :chart-configuration="chartConfiguration"
        :selected-table="selectedTable"
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


import { useGenericDataService } from "../services/genericDataService";
import { useDatabaseFetchService } from "../services/databaseService";
import { Database } from "../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";
import Heatmap from "./charts/Heatmap.vue";

interface Props {
  preselectedDatabaseId: string;
}

interface Data {
  data: Ref<Object| null>;
  databases: Ref<Database[]>;
  tables: Ref<string[]>;
  selectedTable: Ref<string>;
  selectedDatabaseIds: Ref<string[]>;
  chartConfiguration: string[];
}

export default createComponent({
  name: "Access",
  components: {
    Heatmap
  },
  setup(props: Props, context: SetupContext): Data {
  
    const databases = ref<Database[]>([]);
    const selectedDatabaseIds = ref<string[]>([]);
    const selectedTable = ref<string>("");
    const chartConfiguration: string[] = [];
    const { tables } = useDatabaseFetchService();
    const { data, getData } = useGenericDataService("access");

    onMounted(()=> {
      setInterval(getData, 5000);
    })

    return {
      data,
      databases,
      selectedDatabaseIds,
      chartConfiguration,
      selectedTable,
      tables
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
