<template>
  <div id="metric-comparison-table">
    <database-details-panel :selected-databases="selectedDatabases" />
    <div class="metrics-table">
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
            :database="database"
            :selected-databases="[database]"
            :show-details="showDetails"
            :graph-id="`${metric}-${database}`"
            :max-chart-width="maxChartWidth"
          />
        </div>
        <!-- <v-card
          v-for="metric in selectedMetrics"
          :key="metric"
          class="metric-card"
        >
          <v-card-title>
            <v-container fluid>
              <v-row no-gutters>
                <v-col>
                  <v-chip :color="database.color" class="white--text">
                    {{ database.id }}
                  </v-chip>
                </v-col>
                <v-col class="metric-title">
                  {{ getMetricTitle(metric) }}
                </v-col>
                <v-col class="metric-description">
                  <metric-description-tooltip :metric="metric" />
                </v-col>
              </v-row>
            </v-container>
          </v-card-title>
          <component
            :is="getMetricComponent(metric)"
            :selected-databases="[database.id]"
            :metric="metric"
            :metric-meta="getMetricMetadata(metric)"
            :graph-id="`${metric}-${database.id}`"
            :show-details="showDetails"
            :max-chart-width="maxChartWidth"
          />
        </v-card> -->
      </div>
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
  provide
} from "@vue/composition-api";
import Throughput from "../metrics/Throughput.vue";
import CPU from "../metrics/CPU.vue";
import Latency from "../metrics/Latency.vue";
import RAM from "../metrics/RAM.vue";
import QueueLength from "../metrics/QueueLength.vue";
import {
  getMetricMetadata,
  getMetricTitle,
  getMetricComponent
} from "../../meta/metrics";
import { Metric, MetricMetadata } from "../../types/metrics";
import { ContainerProps, ContainerPropsValidation } from "../../types/views";
import DatabaseDetailsPanel from "../details/DatabaseDetailsPanel.vue";
import { Database } from "../../types/database";
import { useUpdatingDatabases } from "../../meta/databases";
import { useDatabaseFlex } from "../../meta/components";
import MetricTile from "@/components/container/MetricTile.vue";

interface Data {
  databases: Ref<readonly Database[]>;
  getMetricMetadata: (metric: Metric) => MetricMetadata;
  getMetricComponent: (metric: Metric) => string;
  getMetricTitle: (metric: Metric) => string;
  databaseFlex: Readonly<Ref<Object>>;
  maxChartWidth: Readonly<Ref<number>>;
}

export default defineComponent({
  components: {
    DatabaseDetailsPanel,
    MetricTile
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
      ...useUpdatingDatabases(props, context),
      getMetricMetadata,
      getMetricComponent,
      getMetricTitle,
      ...useDatabaseFlex(props),
      maxChartWidth
    };
  }
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
