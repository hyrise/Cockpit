<template>
  <div class="metrics">
    <div class="metric-chart" v-for="metric in selectedMetrics" :key="metric">
      <metric-tile
        :metric="metric"
        :selected-databases="selectedDatabases"
        :show-details="showDetails"
        :graph-id="metric"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, SetupContext } from "@vue/composition-api";
import { Metric } from "../../types/metrics";
import { ContainerProps, ContainerPropsValidation } from "../../types/views";
import MetricTile from "@/components/container/MetricTile.vue";

interface Data {}

export default defineComponent({
  components: {
    MetricTile,
  },
  props: ContainerPropsValidation,
  setup(props: ContainerProps, context: SetupContext): Data {
    return {};
  },
});
</script>
<style scoped>
.metrics {
  margin-top: 6px;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.metric-chart {
  flex: 0 0 32.8%;
  margin: 0px 3px 6px 3px;
  padding: 0px;
}
@media (min-width: 2400px) {
  .metric-chart {
    flex: 0 0 24%;
    margin: 0px 3px 6px 3px;
    padding: 0px;
  }
}
</style>
