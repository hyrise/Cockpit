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
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch
} from "@vue/composition-api";
import Heatmap from "../charts/Heatmap.vue";
import {
  MetricProps,
  MetricPropsValidation,
  ChartConfiguration
} from "../../types/metrics";
import { useUpdatingDatabases } from "../../meta/databases";
import { getMetricChartConfiguration } from "../../meta/metrics";

interface Data {
  tables: Ref<readonly string[]>;
  mapData: Ref<number[][]>;
  columns: Ref<string[]>;
  chunks: Ref<string[]>;
  chartConfiguration: ChartConfiguration;
  selectedTable: Ref<string>;
}

export default defineComponent({
  name: "Access",
  components: {
    Heatmap
  },
  props: MetricPropsValidation,
  setup(props: MetricProps, context: SetupContext): Data {
    const selectedTable = ref<string>("");
    const data = context.root.$metricController.data[props.metric];
    const watchedDatabase = useUpdatingDatabases(props, context).databases
      .value[0];

    const mapData = ref<number[][]>([]);
    const columns = ref<string[]>([]);
    const chunks = ref<string[]>([]);

    watch([data, selectedTable], () => {
      if (Object.keys(data.value).length && selectedTable.value != "") {
        const {
          newColumns,
          newChunks,
          dataByChunks
        } = props.metricMeta.transformationService(
          data.value,
          watchedDatabase.id,
          selectedTable.value
        );
        chunks.value = newChunks;
        columns.value = newColumns;
        mapData.value = dataByChunks;
      }
    });

    return {
      chartConfiguration: getMetricChartConfiguration(props.metric),
      tables: computed(() => watchedDatabase.tables),
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
