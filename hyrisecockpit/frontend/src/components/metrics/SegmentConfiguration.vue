<template>
  <div>
    <row>
      <template #first>
        <metric-detailed-view metric="segmentConfiguration">
          <template #header>Access Frequency</template>
          <template #content>
            <row>
              <template #second>
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
              </template>
              <template #third>
                <v-btn-toggle v-model="selectedType" mandatory>
                  <v-btn
                    v-for="type in types"
                    :key="type.name"
                    :value="type.name"
                    :color="selectedType === type.name ? 'primary' : 'white'"
                  >
                    <v-icon
                      :color="selectedType === type.name ? 'white' : ''"
                      >{{ type.icon }}</v-icon
                    >
                  </v-btn>
                </v-btn-toggle>
              </template>
            </row>
            <Heatmap
              :graph-id="'detailed-' + graphId || 'segmentConfiguration'"
              :data="data"
              :chart-configuration="chartConfiguration"
              :autosize="false"
              :max-value="maxValue"
              :hover-template="hoverTemplate"
              :color-scale="colorScale"
              :color-bar="colorBar"
              :show-y="true"
            />
          </template>
        </metric-detailed-view>
      </template>
      <template #second>
        <v-select
          id="segment-select"
          v-model="selectedItem"
          style="width: 80%;"
          :items="selectionItems"
          dense
          label="table"
          outlined
          prepend-icon="mdi-table"
          hide-details
        />
      </template>
      <template #third>
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
      </template>
    </row>

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
      :show-y="true"
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
import { colorTreemapDefinition } from "@/meta/colors";
import { useDataWithSelection, UseDataWithSelection } from "@/meta/components";
import Row from "@/components/container/Row.vue";

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
    Row,
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
        const scaleLength = newData.valueToId.length;
        const colorTree = Object.values(colorTreemapDefinition);

        /* set static color scale */
        colorScale.value =
          newData.valueToId.length <= 1
            ? [
                [0, colorTree[0]],
                [0.5, colorTree[0]],
                [1, colorTree[0]],
              ]
            : newData.valueToId.concat("").reduce((colorScheme, _, idx) => {
                const percent = idx / scaleLength;
                if (idx === 0) {
                  colorScheme.push([percent, colorTree[idx]]);
                  return colorScheme;
                }
                if (idx === newData.valueToId.length) {
                  colorScheme.push([percent, colorTree[idx - 1]]);
                  return colorScheme;
                }
                /* push inner borders twice to apply discrete color scheme */
                colorScheme.push([percent, colorTree[idx - 1]]);
                colorScheme.push([percent, colorTree[idx]]);

                return colorScheme;
              }, [] as (number | string)[][]);

        /* set max value of scale */
        maxValue.value = Math.max(scaleLength - 1, 0);

        /* set color bar config */
        colorBar.value = {
          autotick: false,
          tick0: !0,
          dtick: 1,
          ticktext: newData.valueToId,
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
          `<b>segment: %{x}</b> <br>${selection.selectedType.value}: %{text} <extra></extra>`
      ),
      types: [
        { name: "encoding_type", icon: "mdi-barcode" },
        { name: "order_mode", icon: "mdi-sort" },
      ],
    };
  },
});
</script>
