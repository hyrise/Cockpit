<template>
  <div>
    <v-row class="mt-2 ml-n3" no-gutters align="center" justify="center">
      <v-col class="text-center">
        <metric-detailed-view metric="segmentConfiguration">
          <template #header>Access Frequency</template>
          <template #content>
            <v-select
              :id="'detailed-segment-select'"
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
            <v-btn-toggle v-model="selectedType" mandatory>
              <v-btn
                v-for="type in types"
                :key="type.name"
                :value="type.name"
                :color="selectedType === type.name ? 'primary' : 'white'"
              >
                <v-icon :color="selectedType === type.name ? 'white' : ''">{{
                  type.icon
                }}</v-icon>
              </v-btn>
            </v-btn-toggle>
            <Heatmap
              :graph-id="'detailed-' + graphId || 'segmentConfiguration'"
              :data="data"
              :chart-configuration="chartConfiguration"
              :autosize="false"
              :max-value="maxValue"
              :hover-template="hoverTemplate"
              :color-scale="colorScale"
              :color-bar="colorBar"
            />
          </template>
        </metric-detailed-view>
      </v-col>
      <v-col class="text-center">
        <v-select
          :id="'segment-select'"
          v-model="selectedItem"
          style="width: 80%;"
          :items="selectionItems"
          dense
          label="table"
          outlined
          prepend-icon="mdi-table"
          hide-details
        />
      </v-col>
      <v-col class="text-center">
        <v-btn-toggle v-model="selectedType" mandatory>
          <v-btn
            v-for="type in types"
            :key="type.name"
            :value="type.name"
            :color="selectedType === type.name ? 'primary' : 'white'"
          >
            <v-icon :color="selectedType === type.name ? 'white' : ''">{{
              type.icon
            }}</v-icon>
          </v-btn>
        </v-btn-toggle>
      </v-col>
    </v-row>

    <Heatmap
      :graph-id="graphId || 'segmentConfiguration'"
      :data="data"
      :chart-configuration="chartConfiguration"
      :selected-databases="selectedDatabases"
      :max-chart-width="maxChartWidth"
      :max-value="maxValue"
      :hover-template="hoverTemplate"
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
  SegmentData,
  BasicChartComponentData,
  Metric,
} from "@/types/metrics";
import { useUpdatingDatabases } from "@/meta/databases";
import { getMetricChartConfiguration, getMetricMetadata } from "@/meta/metrics";
import { eventBus } from "@/plugins/eventBus";
import { multiColors } from "@/meta/colors";
import { useDataWithSelection, UseDataWithSelection } from "@/meta/components";

interface Data
  extends BasicChartComponentData<SegmentData>,
    UseDataWithSelection {
  maxValue: Ref<number>;
  colorScale: Ref<(string | number)[][]>;
  colorBar: Ref<Object>;
  hoverTemplate: Ref<string>;
  types: { name: string; icon: string }[];
}

export default defineComponent({
  name: "SegmentConfiguration",
  components: {
    Heatmap,
    MetricDetailedView,
  },
  props: MetricPropsValidation,
  setup(props: MetricProps, context: SetupContext): Data {
    const colorScale = ref<(string | number)[][]>([]);
    const colorBar = ref({});
    const maxValue = ref(0);

    const { transformedData, selection } = useDataWithSelection<SegmentData>(
      props,
      context,
      "encoding_type",
      (newData) => {
        const scaleLength = Object.keys(newData.valueToId).length;

        /* set static color scale */
        colorScale.value = Object.values(newData.valueToId).map((id: any) => {
          return [id / (scaleLength - 1), multiColors[id]];
        });

        /* set max value of scale */
        maxValue.value = scaleLength - 1;

        /* set color bar config */
        colorBar.value = {
          autotick: false,
          tick0: !0,
          dtick: 1,
          ticktext: Object.keys(newData.valueToId).map((id) =>
            id.length > 3 ? id.substring(0, 3) + ".." : id
          ),
          tickvals: [...Array(scaleLength).keys()],
        };
      }
    );

    return {
      chartConfiguration: getMetricChartConfiguration(props.metric),
      maxValue,
      data: transformedData,
      colorScale,
      colorBar,
      ...selection,
      hoverTemplate: computed(
        () =>
          `<b>column: %{text.column}</b> <br><b>chunk: %{y}</b> <br>${selection.selectedType.value}: %{text.value} <extra></extra>`
      ),
      types: [
        { name: "encoding_type", icon: "mdi-barcode" },
        { name: "order_mode", icon: "mdi-sort" },
      ],
    };
  },
});
</script>
