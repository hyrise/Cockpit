<template>
  <div>
    <metric-detailed-view>
      <template #header>
        Storage
      </template>
      <template #content>
        <Treemap
          :graph-id="'1' + graphId || 'storage'"
          :data="storageData"
          :chart-configuration="chartConfiguration"
          :selected-databases="selectedDatabases"
          :max-chart-width="1600"
        />
      </template>
    </metric-detailed-view>
    <Treemap
      :graph-id="'2' + graphId || 'storage'"
      :data="storageData"
      :chart-configuration="chartConfiguration"
      :autosize="false"
      :max-chart-width="maxChartWidth"
    />
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  watch,
  Ref,
  ref
} from "@vue/composition-api";
import Treemap from "../charts/Treemap.vue";
import MetricDetailedView from "@/components/details/MetricDetailedView.vue";
import {
  MetricProps,
  MetricPropsValidation,
  ChartConfiguration,
  StorageData
} from "../../types/metrics";
import {
  getMetricChartConfiguration,
  getMetricMetadata
} from "../../meta/metrics";

interface Data {
  storageData: Ref<StorageData>;
  chartConfiguration: ChartConfiguration;
}

export default defineComponent({
  name: "Storage",
  components: {
    Treemap,
    MetricDetailedView
  },
  props: MetricPropsValidation,
  setup(props: MetricProps, context: SetupContext): Data {
    const data = context.root.$metricController.data[props.metric];
    const storageData = ref<StorageData>({});
    const metricMeta = getMetricMetadata(props.metric);

    watch(data, () => {
      if (Object.keys(data.value).length) {
        console.log(data);
        storageData.value = metricMeta.transformationService(
          data.value,
          props.selectedDatabases[0]
        );
      }
    });

    return {
      storageData,
      chartConfiguration: getMetricChartConfiguration(props.metric)
    };
  }
});
</script>
