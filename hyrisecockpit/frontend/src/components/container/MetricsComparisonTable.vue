<template>
  <div id="metric-comparison-table" class="metrics-table">
    <plugin-log-popup
      :current-plugin-log="currentPluginLog"
      :current-plugin-log-database="currentPluginLogDatabase"
    />
    <div
      class="metrics-column"
      :style="databaseFlex"
      v-for="database in databases"
      :key="database.id"
      :color="database.color"
    >
      <v-card
        v-if="showHeader"
        tile
        class="column-top-border"
        :color="database.color"
        flat
      >
        <v-card-text class="white--text text-center">
          <strong>
            {{ database.id }}
          </strong>
        </v-card-text>
      </v-card>
      <div v-for="metric in selectedMetrics" :key="metric">
        <metric-tile
          class="metric-card"
          :metric="metric"
          :tile-database="database.id"
          :selected-databases="[database.id]"
          :total-number-of-databases="databases.length"
          :show-details="showDetails"
          :graph-id="`${metric}-${database.id}`"
          :max-chart-width="maxChartWidth"
          :activate-plugin-event-click="activatePluginEventClick"
        />
      </div>
      <v-card tile class="column-bottom-border" :color="database.color">
        <v-card-text class="white--text text-center">
          {{ database.id }}
        </v-card-text>
      </v-card>
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
import { Database } from "@/types/database";
import { useUpdatingDatabases } from "@/meta/databases";
import PluginLogPopup from "@/components/plugins/PluginLogPopup.vue";
import { PlotlyHTMLElement, PlotMouseEvent } from "plotly.js";

interface Data {
  databaseFlex: Readonly<Ref<Object>>;
  maxChartWidth: Readonly<Ref<number>>;
  databases: Ref<readonly Database[]>;
  currentPluginLog: Ref<string>;
  activatePluginEventClick: (graphId: string, database: any) => void;
  currentPluginLogDatabase: Ref<any>;
}

export default defineComponent({
  components: {
    MetricTile,
    PluginLogPopup,
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

    const currentPluginLog: Ref<string> = ref("");
    const currentPluginLogDatabase: Ref<any> = ref({});

    const activatePluginEventClick = (graphId: string, database: any) => {
      const graphElement = document.getElementById(
        graphId
      ) as PlotlyHTMLElement;
      graphElement.on("plotly_click", (data: PlotMouseEvent) => {
        data.points.forEach((point: any) => {
          if (point.curveNumber === 1) {
            currentPluginLog.value = point.fullData.text[point.pointIndex];
            currentPluginLogDatabase.value = database;
          }
        });
      });
    };

    return {
      ...useDatabaseFlex(props),
      maxChartWidth,
      ...useUpdatingDatabases(props, context),
      currentPluginLog,
      activatePluginEventClick,
      currentPluginLogDatabase,
    };
  },
});
</script>
<style scoped>
.metrics-table {
  display: flex;
  flex-direction: row;
}
.metrics-column {
  display: flex;
  flex-direction: column;
}
.column-bottom-border {
  margin: 0px 6px 6px 6px;
  border-radius: 0px 0px 4px 4px;
}
.column-top-border {
  margin: 0px 6px -2px 6px;
  border-radius: 0px 0px 4px 4px;
}
</style>
