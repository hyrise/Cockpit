<template>
  <div>
    <div>
      <metric-detailed-view metric="access">
        <template #header>Access Frequency</template>
        <template #content>
          <v-select
            :id="'detailed-access-select'"
            v-model="selectedItem"
            class="select"
            :items="tables"
            dense
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
        class="select mt-n12"
        :items="tables"
        dense
        label="table"
        outlined
        prepend-icon="mdi-table"
      />
      <Heatmap
        class="mt-n8"
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
  Metric,
} from "@/types/metrics";
import { useUpdatingDatabases } from "@/meta/databases";
import { getMetricChartConfiguration, getMetricMetadata } from "@/meta/metrics";
import { eventBus } from "@/plugins/eventBus";

interface Data
  extends BasicChartComponentData<AccessData>,
    UseDataWithSelection {
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
    const { transformedData, selection } = useDataWithSelection(props, context);
    return {
      chartConfiguration: getMetricChartConfiguration(props.metric),
      data: transformedData,
      maxValue: context.root.$metricController.maxValueData[props.metric],
      ...selection,
    };
  },
});

interface UseDataWithSelection {
  selectionItems: Ref<readonly string[]>;
  selectedItem: Ref<string>;
}

function useDataWithSelection(
  props: MetricProps,
  context: SetupContext
): { selection: UseDataWithSelection; transformedData: Ref<AccessData> } {
  const metricMeta = getMetricMetadata(props.metric);
  const data = context.root.$metricController.data[props.metric];
  const { databases } = useUpdatingDatabases(props, context);

  const selectedTable = usePreSelect(props.metric);
  const accessData = ref<AccessData>(({} as unknown) as AccessData);

  /** update access data on base data and selection change */
  watch(
    [data, selectedTable],
    () => {
      if (Object.keys(data.value).length) {
        accessData.value = metricMeta.transformationService(
          data.value,
          databases.value[0].id,
          selectedTable.value
        );
      }
    },
    { immediate: true }
  );

  return {
    selection: {
      selectionItems: computed(() => databases.value[0].tables),
      selectedItem: selectedTable,
    },
    transformedData: accessData,
  };
}

/** Use reactive selected item with preselection depending on metric */
function usePreSelect(metric: Metric): Ref<string> {
  const selectedItem = ref("");

  eventBus.$on(`PRESELECT_${metric.toUpperCase()}`, (item: string) => {
    selectedItem.value = item;
    eventBus.$off(`PRESELECT_${metric.toUpperCase()}`);
  });

  return selectedItem;
}
</script>
<style scoped>
.select {
  z-index: 2;
  width: 30%;
  margin: auto;
}
.v-application .mt-n12 {
  margin-top: -90px !important;
}
</style>
