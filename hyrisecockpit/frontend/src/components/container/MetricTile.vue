<template>
  <v-card>
    <v-card-title>
      <v-container fluid>
        <v-row no-gutters>
          <v-col>
            <database-chip v-if="!!tileDatabase" :database-id="tileDatabase" />
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
      class="metric-component"
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
import { defineComponent, SetupContext } from "@vue/composition-api";
import Throughput from "@/components/metrics/Throughput.vue";
import CPU from "@/components/metrics/CPU.vue";
import Latency from "@/components/metrics/Latency.vue";
import RAM from "@/components/metrics/RAM.vue";
import QueueLength from "@/components/metrics/QueueLength.vue";
import QueryTypeProportion from "@/components/metrics/QueryTypeProportion.vue";
import Storage from "@/components/metrics/Storage.vue";
import Access from "@/components/metrics/Access.vue";
import { getMetricTitle, getMetricComponent } from "../../meta/metrics";
import {
  Metric,
  MetricProps,
  MetricPropsValidation
} from "../../types/metrics";
import { Database } from "../../types/database";
import MetricDescriptionTooltip from "@/components/details/MetricDescriptionTooltip.vue";
import DatabaseChip from "@/components/details/DatabaseChip.vue";

interface Props extends MetricProps {
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
    Storage
  },
  props: {
    tileDatabase: {
      type: String,
      default: null
    },
    ...MetricPropsValidation
  },
  setup(props: Props, context: SetupContext): Data {
    const { getDatabasesByIds } = context.root.$databaseController;
    return {
      getMetricTitle,
      getMetricComponent
    };
  }
});
</script>
<style scoped>
.metric-component {
  margin-top: -20px;
}
.metric-title {
  display: flex;
  align-items: center;
  justify-content: center;
}
.metric-description {
  display: flex;
  align-items: flex-end;
  justify-content: flex-end;
}
</style>
