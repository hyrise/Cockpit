<template>
  <div id="metric-comparison-table" class="metrics-table">
    <div
      class="metrics-column"
      :style="databaseFlex"
      v-for="database in selectedDatabases"
      :key="database"
    >
      <div v-for="metric in selectedMetrics" :key="metric">
        <metric-tile
          class="metric-card"
          :metric="metric"
          :tile-database="database"
          :selected-databases="[database]"
          :show-details="showDetails"
          :graph-id="`${metric}-${database}`"
          :max-chart-width="maxChartWidth"
        />
      </div>
      <s-q-l-editor :databaseId="database" />
    </div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  onMounted,
  computed,
  provide,
} from "@vue/composition-api";
import { ContainerProps, ContainerPropsValidation } from "../../types/views";
import { useDatabaseFlex } from "../../meta/components";
import MetricTile from "@/components/container/MetricTile.vue";
import SQLEditor from "../databases/SQLEditor.vue";

interface Data {
  databaseFlex: Readonly<Ref<Object>>;
  maxChartWidth: Readonly<Ref<number>>;
}

export default defineComponent({
  components: {
    MetricTile,
    SQLEditor,
  },
  props: ContainerPropsValidation,
  setup(props: ContainerProps, context: SetupContext): Data {
    const totalViewWidth = ref(0);
    const maxChartWidth = computed(
      () =>
        Math.floor(totalViewWidth.value / props.selectedDatabases.length) - 10
    );
    provide("multipleDatabasesAllowed", false);

    onMounted(() => {
      totalViewWidth.value = document.getElementById(
        "metric-comparison-table"
      )!.offsetWidth;
    });

    return {
      ...useDatabaseFlex(props),
      maxChartWidth,
    };
  },
});
</script>
<style scoped>
.metrics-table {
  display: flex;
  flex-direction: row;
  margin-top: 6px;
}
.metrics-column {
  margin-right: 4px;
  display: flex;
  flex-direction: column;
}
.metric-card {
  margin-top: 4px;
}
</style>
