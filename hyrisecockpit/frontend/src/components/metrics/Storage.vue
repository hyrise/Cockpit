<template>
  <div>
    <metric-details
      v-if="showDetails"
      metric="memoryFootprint"
      :databases="selectedDatabases"
      :decimal-digits="3"
      id-prefix="storage"
      :total-number-of-databases="totalNumberOfDatabases"
    />
    <row>
      <template #first>
        <metric-detailed-view metric="storage">
          <template #header>Data Size - Overview</template>
          <template #content>
            <Treemap
              :graph-id="'detailed-' + graphId || 'storage'"
              :data="data"
              :chart-configuration="chartConfiguration"
              :selected-databases="selectedDatabases"
              :max-chart-width="1330"
            />
          </template>
        </metric-detailed-view>
      </template>
    </row>
    <Treemap
      :graph-id="graphId || 'storage'"
      :data="data"
      :chart-configuration="chartConfiguration"
      :autosize="false"
      :max-chart-width="maxChartWidth"
    />
  </div>
</template>

<script lang="ts">
import { defineComponent, SetupContext } from "@vue/composition-api";
import Treemap from "@/components/charts/Treemap.vue";
import MetricDetailedView from "@/components/details/MetricDetailedView.vue";
import MetricDetails from "@/components/details/MetricDetails.vue";
import {
  MetricProps,
  MetricPropsValidation,
  StorageData,
  BasicChartComponentData,
} from "@/types/metrics";
import { useModifiedChartData } from "@/meta/components";
import Row from "@/components/container/Row.vue";

export default defineComponent({
  name: "Storage",
  components: {
    MetricDetailedView,
    MetricDetails,
    Row,
    Treemap,
  },
  props: MetricPropsValidation,
  setup(
    props: MetricProps,
    context: SetupContext
  ): BasicChartComponentData<StorageData> {
    return {
      ...useModifiedChartData(props, context),
    };
  },
});
</script>
