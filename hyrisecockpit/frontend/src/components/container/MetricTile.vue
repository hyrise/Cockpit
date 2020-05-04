<template>
  <v-card :id="`${tileDatabase}-${metric}-tile`">
    <v-card-title class="card-title" :ref="`${tileDatabase}-${metric}-title`">
      <v-container fluid>
        <v-row no-gutters class="card-title-row">
          <v-col class="metric-title-container">
            <div :class="isThin && 'metric-title'">
              {{ getMetricTitle(metric) }}
            </div>
            <time-interval :metric="metric" />
            <!--  Think about where to add this  <metric-description-tooltip :metric="metric" /> -->
          </v-col>
          <v-spacer v-if="!isThin" />
          <v-col class="database-title">
            <database-chip
              class="database-chip"
              v-if="!!tileDatabase"
              :database-id="tileDatabase"
              :onlyIcon="isThin"
            />
          </v-col>
        </v-row>
      </v-container>
    </v-card-title>
    <component
      :is="getMetricComponent(metric)"
      :selected-databases="selectedDatabases"
      :metric="metric"
      :graph-id="graphId"
      :show-details="showDetails"
      :max-chart-width="maxChartWidth"
    />
  </v-card>
</template>

<script lang="ts">
import { defineComponent, SetupContext, onMounted } from "@vue/composition-api";
import Throughput from "@/components/metrics/Throughput.vue";
import CPU from "@/components/metrics/CPU.vue";
import Latency from "@/components/metrics/Latency.vue";
import RAM from "@/components/metrics/RAM.vue";
import QueueLength from "@/components/metrics/QueueLength.vue";
import QueryTypeProportion from "@/components/metrics/QueryTypeProportion.vue";
import Storage from "@/components/metrics/Storage.vue";
import Access from "@/components/metrics/Access.vue";
import MemoryFootprint from "@/components/metrics/MemoryFootprint.vue";
import { getMetricTitle, getMetricComponent } from "../../meta/metrics";
import {
  Metric,
  MetricProps,
  MetricPropsValidation,
} from "../../types/metrics";
import { Database } from "../../types/database";
import MetricDescriptionTooltip from "@/components/details/MetricDescriptionTooltip.vue";
import DatabaseChip from "@/components/details/DatabaseChip.vue";
import TimeInterval from "@/components/details/TimeInterval.vue";
import { eventBus } from "@/plugins/eventBus";

interface Props extends MetricProps {
  isThin: boolean;
  tileDatabase: string;
}

interface Data {
  getMetricTitle: (metric: Metric) => string;
  getMetricComponent: (metric: Metric) => string;
}

export default defineComponent({
  components: {
    MetricDescriptionTooltip,
    DatabaseChip,
    Throughput,
    CPU,
    Latency,
    RAM,
    QueueLength,
    QueryTypeProportion,
    Access,
    Storage,
    MemoryFootprint,
    TimeInterval,
  },
  props: {
    isThin: {
      type: Boolean,
      default: null,
    },
    tileDatabase: {
      type: String,
      default: null,
    },
    ...MetricPropsValidation,
  },
  setup(props: Props, context: SetupContext): Data {
    const { getDatabasesByIds } = context.root.$databaseController;
    return {
      getMetricTitle,
      getMetricComponent,
    };
  },
});
</script>
<style scoped>
.card-title {
  padding-bottom: 0 !important;
  padding-top: 0 !important;
}

.database-title {
  display: flex;
  align-items: baseline;
  justify-content: flex-start;
}
.database-chip {
  margin-left: auto;
}
.metric-title {
  width: 65%;
  overflow: hidden;
  text-overflow: ellipsis;
}
.metric-title-container {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  white-space: nowrap;
}
.metric-description {
  display: flex;
  align-items: flex-start;
  justify-content: flex-end;
}
</style>
