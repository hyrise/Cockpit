<template>
  <div>
    <div>
      <!-- This needs refactoring: Maybe move container into an own component -->
      <v-container fluid justify="center" align="center">
        <v-row no-gutters>
          <v-col>
            <metric-detailed-view>
              <template #header>
                Access Frequency
              </template>
              <template #content>
                <v-select
                  v-model="selectedTable"
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
          </v-col>
          <v-col class="metric-title">
            <v-select
              v-model="selectedTable"
              :items="tables"
              chips
              label="table"
              outlined
              prepend-icon="mdi-table"
            />
          </v-col>
          <v-col class="metric-description">
            <time-interval :metric="metric" />
          </v-col>
        </v-row>
      </v-container>

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
  watch
} from "@vue/composition-api";
import Heatmap from "../charts/Heatmap.vue";
import MetricDetailedView from "@/components/details/MetricDetailedView.vue";
import {
  MetricProps,
  MetricPropsValidation,
  ChartConfiguration,
  AccessData
} from "../../types/metrics";
import { useUpdatingDatabases } from "../../meta/databases";
import {
  getMetricChartConfiguration,
  getMetricMetadata
} from "../../meta/metrics";
import TimeInterval from "@/components/details/TimeInterval.vue";

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
    TimeInterval
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
      selectedTable
    };
  }
});
</script>
<style scoped>
.metric-title {
  display: flex;
  align-items: center !important;
  justify-content: center;
  white-space: nowrap;
}
.metric-description {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  margin-right: 1%;
}
</style>
