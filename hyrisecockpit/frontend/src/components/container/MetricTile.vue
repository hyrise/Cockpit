<template>
  <v-card
    :id="`${tileDatabase}-${metric}-tile`"
    class="card"
    :style="getBorderColor(tileDatabase)"
    tile
  >
    <v-card-title
      class="card-title font-weight-regular"
      :ref="`${tileDatabase}-${metric}-title`"
    >
      <v-container fluid>
        <v-row no-gutters>
          <v-col class="metric-title">
            <div>{{ getMetricTitle(metric) }}</div>
            <time-interval :metric="metric" />
          </v-col>
          <v-spacer />
          <v-col class="database-title">
            <database-chip
              class="database-chip"
              v-if="!!tileDatabase"
              :database-id="tileDatabase"
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
      :total-number-of-databases="totalNumberOfDatabases"
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
import OperatorProportion from "@/components/metrics/OperatorProportion.vue";
import { getMetricTitle, getMetricComponent } from "../../meta/metrics";
import {
  Metric,
  MetricProps,
  MetricPropsValidation,
} from "../../types/metrics";
import { Database } from "../../types/database";
import DatabaseChip from "@/components/details/DatabaseChip.vue";
import TimeInterval from "@/components/details/TimeInterval.vue";

interface Props extends MetricProps {
  tileDatabase: string;
}

interface Data {
  getMetricTitle: (metric: Metric) => string;
  getMetricComponent: (metric: Metric) => string;
  getBorderColor: (databaseId: string) => Object;
}

export default defineComponent({
  components: {
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
    OperatorProportion,
    TimeInterval,
  },
  props: {
    tileDatabase: {
      type: String,
      default: null,
    },
    ...MetricPropsValidation,
  },
  setup(props: Props, context: SetupContext): Data {
    function getBorderColor(databaseId: string): Object {
      if (!databaseId) return {};
      const database = getDatabasesByIds([databaseId])[0];

      return {
        borderLeft: `4px solid ${database.color}`,
        borderRight: `4px solid ${database.color}`,
      };
    }

    const { getDatabasesByIds } = context.root.$databaseController;
    return {
      getMetricTitle,
      getMetricComponent,
      getBorderColor,
    };
  },
});
</script>

<style scoped>
.card {
  margin-left: 6px;
  margin-right: 6px;
}
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
  margin-left: 6px;
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
#comparison-page .card {
  border-radius: 0px;
  box-shadow: 0px 0px;
}
#overview-page .card {
  border-radius: 4px;
}
</style>
