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
        graph-id="cpu"
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
import { Database } from "../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";
import Linechart from "./charts/Linechart.vue";
import { componentMap } from "./components";

interface Props {
  preselectedDatabaseId: string;
}

interface Data {
  data: Ref<any>;
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
    const component = componentMap["cpu"];
    const { databases } = context.root.$databaseData;
    const { checkState, data } = useGenericFetchService(component);

    const selectedDatabaseIds = ref<string[]>(
      props.preselectedDatabaseId ? [props.preselectedDatabaseId] : []
    );

    const chartConfiguration = ["CPU", "time in s", "workload in %"];

    onMounted(() => {
      setInterval(checkState, 1000);
    });

    return {
      data,
      databases,
      selectedDatabaseIds,
      chartConfiguration
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
