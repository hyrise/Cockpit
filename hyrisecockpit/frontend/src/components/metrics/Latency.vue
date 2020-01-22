<template>
  <div>
    <v-row v-if="enableComparison" align="center">
      <v-col cols="6" class="mx-10">
        <v-select
          v-model="selectedDatabaseIds"
          :items="$databaseData.databases.value.map(database => database.id)"
          chips
          label="databases"
          multiple
          outlined
          prepend-icon="mdi-database"
        ></v-select>
      </v-col>
    </v-row>
    <Linechart
      :selected-databases="selectedDatabases"
      :data="data"
      graph-id="latency"
      :chart-configuration="chartConfiguration"
    />
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
import { Database } from "../../types/database";
import * as Plotly from "plotly.js";
import Vue from "vue";
import Linechart from "../charts/Linechart.vue";
import {
  MetricProps,
  MetricPropsValidation,
  ComparisonMetricData
} from "../../types/metrics";

export default createComponent({
  name: "Latency",
  props: MetricPropsValidation,
  components: { Linechart },
  setup(props: MetricProps, context: SetupContext): ComparisonMetricData {
    const { checkState, data } = useGenericFetchService(props.metricMeta);
    const selectedDatabaseIds = ref<string[]>(props.selectedDatabases);

    const chartConfiguration = [
      "Throughput",
      "time in s",
      "queries per second"
    ];

    onMounted(() => {
      setInterval(checkState, 1000);
    });

    return {
      data,
      chartConfiguration,
      selectedDatabaseIds
    };
  }
});
</script>
