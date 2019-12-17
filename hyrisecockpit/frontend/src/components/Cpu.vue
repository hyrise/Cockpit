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
        graph-id="graph1"
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

import { useThroughputFetchService } from "../services/throughputService";
import { useGenericFetchService } from "../services/genericFetchService";
import { CPUData } from "../types/cpu";
import { Database } from "../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";
import Linechart from "./charts/Linechart.vue";

interface Props {}

interface Data {
  data: Ref<CPUData>;
  databases: Ref<Database[]>;
  selectedDatabaseIds: Ref<string[]>;
}

export default createComponent({
  components: { Linechart },
  setup(props: Props, context: SetupContext): Data {
    const databases = Vue.prototype.$databases;
    const { getData, data, queryReadyState } = useGenericFetchService("cpu");
    const selectedDatabaseIds = ref<string[]>([]);

    onMounted(() => {
      setInterval(checkState, 10000);
    });

    function checkState(): void {
      if (queryReadyState.value) {
        getData();
      }
    }

    return {
      data,
      databases,
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
