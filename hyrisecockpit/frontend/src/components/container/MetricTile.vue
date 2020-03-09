<template>
  <v-card>
    <v-card-title>
      <v-container fluid>
        <v-row no-gutters>
          <v-col>
            <v-chip
              v-if="!!selectedDatabase.id"
              :color="selectedDatabase.color"
              class="white--text"
            >
              {{ selectedDatabase.id }}
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
      class="metric-component"
      :is="getMetricComponent(metric)"
      :selected-databases="selectedDatabases"
      :metric="metric"
      :metric-meta="getMetricMetadata(metric)"
      :graph-id="graphId"
      :show-details="showDetails"
      :max-chart-width="maxChartWidth"
    />
  </v-card>
</template>

<script lang="ts">
import { defineComponent, SetupContext } from "@vue/composition-api";
import Throughput from "../metrics/Throughput.vue";
import CPU from "../metrics/CPU.vue";
import Latency from "../metrics/Latency.vue";
import RAM from "../metrics/RAM.vue";
import QueueLength from "../metrics/QueueLength.vue";
import QueryTypeProportion from "../metrics/QueryTypeProportion.vue";
import Storage from "../metrics/Storage.vue";
import Access from "../metrics/Access.vue";
import {
  getMetricMetadata,
  getMetricTitle,
  getMetricComponent
} from "../../meta/metrics";
import { Metric, MetricMetadata } from "../../types/metrics";
import { Database } from "../../types/database";
import MetricDescriptionTooltip from "@/components/details/MetricDescriptionTooltip.vue";

interface Props {
  database: string;
  metric: Metric;
  selectedDatabases: string[];
  showDetails: boolean;
  graphId: string;
  maxChartWidth: number;
}

interface Data {
  getMetricMetadata: (metric: Metric) => MetricMetadata;
  getMetricTitle: (metric: Metric) => string;
  getMetricComponent: (metric: Metric) => string;
  selectedDatabase: Database | { id: string; color: string };
}

export default defineComponent({
  components: {
    Throughput,
    CPU,
    Latency,
    RAM,
    QueueLength,
    QueryTypeProportion,
    Access,
    Storage,
    MetricDescriptionTooltip
  },
  props: {
    database: {
      type: String,
      default: null
    },
    metric: {
      type: String,
      default: null
    },
    selectedDatabases: {
      type: Array,
      default: null
    },
    showDetails: {
      type: Boolean,
      default: false
    },
    graphId: {
      type: String,
      default: null
    },
    maxChartWidth: {
      type: Number,
      default: 0
    }
  },
  setup(props: Props, context: SetupContext): Data {
    const { getDatabasesByIds } = context.root.$databaseController;
    return {
      getMetricMetadata,
      getMetricTitle,
      getMetricComponent,
      selectedDatabase: props.database
        ? getDatabasesByIds([props.database])[0]
        : { id: "", color: "" }
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
