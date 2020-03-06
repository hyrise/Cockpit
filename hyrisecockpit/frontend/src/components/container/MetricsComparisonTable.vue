<template>
  <div id="metric-comparison-table">
    <database-details-panel :selected-databases="selectedDatabases" />
    <div class="metrics-table">
      <div
        class="metrics-column"
        :style="databaseFlex"
        v-for="database in databases"
        :key="database.id"
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
            :selected-databases="[database.id]"
            :metric="metric"
            :metric-meta="getMetricMetadata(metric)"
            :graph-id="`${metric}-${database.id}`"
            :show-details="showDetails"
            :max-chart-width="maxChartWidth"
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
  onMounted,
  computed,
  provide
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

interface Data {
  databases: Ref<readonly Database[]>;
  getMetricMetadata: (metric: Metric) => MetricMetadata;
  getMetricComponent: (metric: Metric) => string;
  getMetricTitle: (metric: Metric) => string;
  uuid: () => string;
  databaseFlex: Readonly<Ref<Object>>;
  maxChartWidth: Readonly<Ref<number>>;
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
    DatabaseDetailsPanel
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
      uuid: uuid.v1, //TODO: remove uuid
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
