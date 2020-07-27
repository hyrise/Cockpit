<template>
  <div>
    <metric-detailed-view metric="access">
      <template #header>Access Frequency</template>
      <template #content>
        <v-select
          :id="'detailed-access-select'"
          v-model="selectedItem"
          class="select"
          :items="selectionItems"
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
          :hover-template="'<b>column: %{text.column}</b> <br><b>chunk: %{y}</b> <br>%{text.value} <extra></extra>'"
          :color-scale="colorScale"
          :color-bar="colorBar"
        />
      </template>
    </metric-detailed-view>
    <v-select
      :id="'access-select'"
      class="select"
      v-model="selectedItem"
      :items="selectionItems"
      dense
      label="table"
      outlined
      prepend-icon="mdi-table"
    />

    <v-btn-toggle class="select-type" v-model="selectedType">
      <v-btn value="encoding_type">E</v-btn>
      <v-btn value="order_mode">O</v-btn>
    </v-btn-toggle>

    <Heatmap
      class="mt-n8"
      :graph-id="graphId || 'access'"
      :data="data"
      :chart-configuration="chartConfiguration"
      :selected-databases="selectedDatabases"
      :max-chart-width="maxChartWidth"
      :max-value="maxValue"
      :hover-template="'<b>column: %{text.column}</b> <br><b>chunk: %{y}</b> <br>%{text.value} %{z} <extra></extra>'"
      :color-scale="colorScale"
      :color-bar="colorBar"
    />
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
import { multiColors } from "@/meta/colors";

interface Data extends BasicChartComponentData<any>, UseDataWithSelection {
  maxValue: Ref<number>;
  colorScale: Ref<(string | number)[][]>;
  colorBar: Ref<Object>;
  selectedType: Ref<string>;
}

export default defineComponent({
  name: "SegmentConfiguration",
  components: {
    Heatmap,
    MetricDetailedView,
  },
  props: MetricPropsValidation,
  setup(props: MetricProps, context: SetupContext): Data {
    const metricMeta = getMetricMetadata(props.metric);
    const data = context.root.$metricController.data[props.metric];
    const { databases } = useUpdatingDatabases(props, context);

    //TODO: preselect table
    const selectedTable = ref("table-0");
    const selectedType = ref("encoding_type");
    const transformedData = ref<any>({});
    const colorScale = ref<(string | number)[][]>([]);
    const colorBar = ref({});
    const maxValue = ref(0);

    /** update access data on base data and selection change */
    watch(
      [data, selectedTable, selectedType],
      () => {
        if (Object.keys(data.value).length) {
          transformedData.value = metricMeta.transformationService(
            data.value,
            databases.value[0].id,
            selectedTable.value,
            selectedType.value
          );
          const scaleLength = Object.keys(transformedData.value.valueToId)
            .length;
          colorScale.value = Object.values(transformedData.value.valueToId).map(
            (id: any) => {
              return [id / (scaleLength - 1), multiColors[id]];
            }
          );

          maxValue.value = scaleLength - 1;
          colorBar.value = {
            autotick: false,
            tick0: !0,
            dtick: 1,
            ticktext: Object.keys(transformedData.value.valueToId).map((id) =>
              id.length > 3 ? id.substring(0, 3) + ".." : id
            ),
            tickvals: [...Array(scaleLength).keys()],
          };
        }
      },
      { immediate: true }
    );

    return {
      chartConfiguration: getMetricChartConfiguration(props.metric),
      maxValue,
      data: transformedData,
      selectedItem: selectedTable,
      selectionItems: computed(() => databases.value[0].tables),
      colorScale,
      colorBar,
      selectedType,
    };
  },
});

interface UseDataWithSelection {
  selectionItems: Ref<readonly string[]>;
  selectedItem: Ref<string>;
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
  margin-top: -90px;
}
.select-type {
}
</style>
