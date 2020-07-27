<template>
  <v-card :id="`${tileDatabase}-${metric}-tile`" class="card mt-2 mx-2">
    <v-card-title
      class="card subtitle-1 font-weight-regular mb-n7"
      :ref="`${tileDatabase}-${metric}-title`"
    >
      <v-container fluid class="mt-n4">
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
              :onlyIcon="maxChartWidth <= 450"
            />
          </v-col>
        </v-row>
      </v-container>
    </v-card-title>
    <plugin-log-popup
      v-if="showPluginPopup"
      :current-plugin-log="currentPluginLog"
      :database-color="popupColor"
      :metric-id="tileDatabase + metric"
      @close="onLogPopupClose"
    />
    <component
      :is="getMetricComponent(metric)"
      :selected-databases="selectedDatabases"
      :metric="metric"
      :graph-id="graphId"
      :show-details="showDetails"
      :max-chart-width="maxChartWidth"
      :total-number-of-databases="totalNumberOfDatabases"
      :activate-plugin-event-click="activatePluginEventOnClick"
    />
  </v-card>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  ref,
  Ref,
} from "@vue/composition-api";
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
import { PlotlyHTMLElement, PlotMouseEvent } from "plotly.js";
import PluginLogPopup from "@/components/plugins/PluginLogPopup.vue";

interface Props extends MetricProps {
  tileDatabase: string;
  showPluginPopup: boolean;
  popupColor: string;
}

interface Data {
  getMetricTitle: (metric: Metric) => string;
  getMetricComponent: (metric: Metric) => string;
  activatePluginEventOnClick: (graphId: string, database: any) => void;
  currentPluginLog: Ref<any>;
  onLogPopupClose: () => void;
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
    PluginLogPopup,
  },
  props: {
    tileDatabase: {
      type: String,
      default: null,
    },
    showPluginPopup: {
      type: Boolean,
      default: false,
    },
    popupColor: {
      type: String,
      default: null,
    },
    ...MetricPropsValidation,
  },
  setup(props: Props, context: SetupContext): Data {
    const { getDatabasesByIds } = context.root.$databaseController;

    const currentPluginLog: Ref<any> = ref(null);

    function activatePluginEventOnClick(graphId: string, database: Database) {
      const graphElement = document.getElementById(
        graphId
      ) as PlotlyHTMLElement;
      graphElement.on("plotly_click", (data: PlotMouseEvent) => {
        data.points.forEach((point: any) => {
          if (point.curveNumber === 1) {
            currentPluginLog.value = point.fullData.text[point.pointIndex];
          }
        });
      });
    }

    function onLogPopupClose() {
      currentPluginLog.value = null;
    }

    return {
      getMetricTitle,
      getMetricComponent,
      activatePluginEventOnClick,
      currentPluginLog,
      onLogPopupClose,
    };
  },
});
</script>

<style scoped>
.card {
  max-width: 97.5%;
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
</style>
