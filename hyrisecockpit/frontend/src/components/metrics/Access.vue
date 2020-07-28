<template>
  <div>
    <v-row class="mt-2 ml-n3" no-gutters align="center" justify="center">
      <v-col class="text-center">
        <metric-detailed-view metric="access">
          <template #header>Access Frequency</template>
          <template #content>
            <v-select
              :id="'detailed-access-select'"
              v-model="selectedItem"
              style="width: 80%;"
              :items="selectionItems"
              dense
              label="table"
              outlined
              hide-details
              prepend-icon="mdi-table"
              width="100"
            />
            <Heatmap
              :graph-id="'detailed-' + graphId || 'access'"
              :data="data"
              :chart-configuration="chartConfiguration"
              :autosize="false"
              :max-value="maxValue"
              :hover-template="'<b>column: %{text}</b> <br><b>chunk: %{y}</b> <br>%{z} accesses <extra></extra>'"
              :max-chart-width="1300"
            />
          </template>
        </metric-detailed-view>
      </v-col>
      <v-col class="text-center">
        <v-select
          :id="'access-select'"
          v-model="selectedItem"
          style="width: 80%;"
          :items="selectionItems"
          dense
          label="table"
          outlined
          hide-details
          prepend-icon="mdi-table"
        />
      </v-col>
      <v-col class="text-center"></v-col>
    </v-row>

    <Heatmap
      :graph-id="graphId || 'access'"
      :data="data"
      :chart-configuration="chartConfiguration"
      :selected-databases="selectedDatabases"
      :max-chart-width="maxChartWidth"
      :max-value="maxValue"
      :hover-template="'<b>column: %{text}</b> <br><b>chunk: %{y}</b> <br>%{z} accesses <extra></extra>'"
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
import { useDataWithSelection, UseDataWithSelection } from "@/meta/components";

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
    const { transformedData, selection } = useDataWithSelection<AccessData>(
      props,
      context
    );
    return {
      chartConfiguration: getMetricChartConfiguration(props.metric),
      data: transformedData,
      maxValue: context.root.$metricController.maxValueData[props.metric],
      ...selection,
    };
  },
});
</script>
