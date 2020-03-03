<template>
  <div>
    <database-system-details :databases="selectedDatabases" />
    <div class="metrics-table">
      <div
        class="metrics-column"
        :style="{ flex: `1 0 ${100 / selectedDatabases.length}%` }"
        v-for="database in selectedDatabases"
        :key="`${uuid()}-${database.id}`"
      >
        <v-card
          v-for="metric in selectedMetrics"
          :key="metric"
          class="metric-card"
        >
          <v-card-title class="metric-title">
            {{ getMetricTitle(metric) }}
          </v-card-title>
          <v-card-subtitle>
            <v-chip :color="database.color" class="white--text">
              {{ database.id }}
            </v-chip>
          </v-card-subtitle>
          <component
            :is="getMetricComponent(metric)"
            :selected-databases="[database]"
            :metric="metric"
            :metric-meta="getMetadata(metric)"
            :graph-id="`${metric}-${database.id}`"
            :show-details="showDetails"
          />
        </v-card>
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
  onMounted
} from "@vue/composition-api";
import Throughput from "../metrics/Throughput.vue";
import CPU from "../metrics/CPU.vue";
import Latency from "../metrics/Latency.vue";
import RAM from "../metrics/RAM.vue";
import QueueLength from "../metrics/QueueLength.vue";
import Storage from "../metrics/Storage.vue";
import Access from "../metrics/Access.vue";
import QueryTypeProportion from "../metrics/QueryTypeProportion.vue";
import { uuid } from "vue-uuid";
import {
  getMetadata,
  getMetricTitle,
  getMetricComponent
} from "../../meta/metrics";
import { Metric, MetricMetadata } from "../../types/metrics";
import { ContainerProps, ContainerPropsValidation } from "../../types/views";
import DatabaseSystemDetails from "../details/DatabaseSystemDetails.vue";

interface Data {
  getMetadata: (metric: Metric) => MetricMetadata;
  getMetricComponent: (metric: Metric) => string;
  getMetricTitle: (metric: Metric) => string;
  uuid: () => string;
}

export default defineComponent({
  components: {
    Throughput,
    CPU,
    Latency,
    RAM,
    QueueLength,
    Storage,
    Access,
    QueryTypeProportion,
    DatabaseSystemDetails
  },
  props: ContainerPropsValidation,
  setup(props: ContainerProps, context: SetupContext): Data {
    return {
      uuid: uuid.v1,
      getMetadata,
      getMetricComponent,
      getMetricTitle
    };
  }
});
</script>
<style scoped>
.database-title {
  justify-content: center;
}
.database {
  margin-bottom: 0.5%;
}
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
.metric-title {
  z-index: 2;
  position: relative;
  margin-bottom: -40px;
  justify-content: center;
}

.metric-card {
  margin-top: 4px;
}
</style>
