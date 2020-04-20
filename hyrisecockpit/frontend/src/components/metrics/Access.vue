<template>
  <div>
    <div>
      <metric-detailed-view>
        <template #header>
          Access Frequency
        </template>
        <template #content>
          <v-select
            :id="'1' + 'access-select'"
            v-model="selectedTable"
            class="select"
            :items="tables"
            chips
            label="table"
            outlined
            prepend-icon="mdi-table"
            width="100"
          />
          <Heatmap
            :graph-id="'1' + graphId || 'access'"
            :data="accessData"
            :chart-configuration="chartConfiguration"
            :autosize="false"
          />
        </template>
      </metric-detailed-view>
      <v-select
        :id="'2' + 'access-select'"
        v-model="selectedTable"
        class="select"
        :items="tables"
        chips
        label="table"
        outlined
        prepend-icon="mdi-table"
      />
      <Heatmap
        :graph-id="'2' + graphId || 'access'"
        :data="accessData"
        :chart-configuration="chartConfiguration"
        :selected-databases="selectedDatabases"
        :max-chart-width="maxChartWidth"
      />
    </div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  computed,
  Ref,
  ref,
  watch,
} from "@vue/composition-api";
import Heatmap from "../charts/Heatmap.vue";
import MetricDetailedView from "@/components/details/MetricDetailedView.vue";
import {
  MetricProps,
  MetricPropsValidation,
  ChartConfiguration,
  AccessData,
} from "../../types/metrics";
import { useUpdatingDatabases } from "../../meta/databases";
import {
  getMetricChartConfiguration,
  getMetricMetadata,
} from "../../meta/metrics";

interface Data {
  tables: Ref<readonly string[]>;
  accessData: Ref<AccessData>;
  chartConfiguration: ChartConfiguration;
  selectedTable: Ref<string>;
}

export default defineComponent({
  name: "Access",
  components: {
    Heatmap,
    MetricDetailedView,
  },
  props: MetricPropsValidation,
  setup(props: MetricProps, context: SetupContext): Data {
    const metricMeta = getMetricMetadata(props.metric);
    const selectedTable = ref<string>("");
    const data = context.root.$metricController.data[props.metric];
    const watchedDatabase = useUpdatingDatabases(props, context).databases
      .value[0];

    const accessData = ref<AccessData>({});

    watch([data, selectedTable], () => {
      if (Object.keys(data.value).length && selectedTable.value != "") {
        accessData.value = metricMeta.transformationService(
          data.value,
          watchedDatabase.id,
          selectedTable.value
        );
      }
    });

    return {
      chartConfiguration: getMetricChartConfiguration(props.metric),
      tables: computed(() => watchedDatabase.tables),
      accessData,
      selectedTable,
    };
  },
});
</script>
<style scoped>
.select {
  z-index: 2;
  width: 50%;
  margin: auto;
}
</style>
