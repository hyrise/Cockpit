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
      <Linechart
        :selected-database-ids="selectedDatabaseIds"
        :data="data"
        graph-id="throughput"
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
import { ThroughputData } from "../types/throughput";
import { Database } from "../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";
import Linechart from "./charts/Linechart.vue";

interface Props {
  preselectedDatabaseId: string;
}

interface Data {
  data: Ref<ThroughputData>;
  databases: Ref<Database[]>;
  selectedDatabaseIds: Ref<string[]>;
  chartConfiguration: string[];
}

export default createComponent({
  props: {
    preselectedDatabaseId: { type: String }
  },
  components: { Linechart },
  setup(props: Props, context: SetupContext): Data {
    const { databases } = context.root.$databaseData;
    const { getData, data, queryReadyState } = useGenericFetchService(
      "throughput"
    );
    const selectedDatabaseIds = ref<string[]>(
      props.preselectedDatabaseId ? [props.preselectedDatabaseId] : []
    );

    const chartConfiguration = [
      "throughput",
      "time in s",
      "queries per second"
    ];

    onMounted(() => {
      setInterval(checkState, 1000);
    });

    function checkState(): void {
      if (queryReadyState.value) {
        getData();
      }
    }

    return {
      data,
      databases,
      chartConfiguration,
      selectedDatabaseIds
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
