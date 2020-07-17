<template>
  <div>
    <div>
      <metric-detailed-view metric="access">
        <template #header>Access Frequency</template>
        <template #content>
          <v-select
            :id="'detailed-access-select'"
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
            :graph-id="'detailed-' + graphId || 'access'"
            :data="data"
            :chart-configuration="chartConfiguration"
            :autosize="false"
            :max-value="maxValue"
          />
        </template>
      </metric-detailed-view>
      <v-select
        :id="'access-select'"
        v-model="selectedTable"
        class="select"
        :items="tables"
        chips
        label="table"
        outlined
        prepend-icon="mdi-table"
      />
      <Heatmap
        :graph-id="graphId || 'access'"
        :data="data"
        :chart-configuration="chartConfiguration"
        :selected-databases="selectedDatabases"
        :max-chart-width="maxChartWidth"
        :max-value="maxValue"
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
import Heatmap from "@/components/charts/Heatmap.vue";
import MetricDetailedView from "@/components/details/MetricDetailedView.vue";
import {
  MetricProps,
  MetricPropsValidation,
  ChartConfiguration,
  AccessData,
  BasicChartComponentData,
} from "@/types/metrics";
import { useUpdatingDatabases } from "@/meta/databases";
import { getMetricChartConfiguration, getMetricMetadata } from "@/meta/metrics";

interface Data extends BasicChartComponentData<AccessData> {
  tables: Ref<readonly string[]>;
  selectedTable: Ref<string>;
  maxValue: Ref<number>;
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

    const accessData = ref<AccessData>(({} as unknown) as AccessData);

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
      data: accessData,
      selectedTable,
      maxValue: context.root.$metricController.maxValueData[props.metric],
    };
  },
});
</script>
<style scoped>
.select {
  z-index: 2;
  width: 30%;
  margin: auto;
}
</style>
