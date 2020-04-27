<template>
  <v-card id="selection-list" class="selection-list">
    <v-card-title>
      <div class="selection">{{ pageName }}</div>
      <v-select
        id="historic-range-selection"
        v-model="selectedHistoricRange"
        class="historic-range-selection"
        :items="availableHistoricRanges"
        label="Request intervals"
        @change="handleHistoricRangeChange()"
      ></v-select>
    </v-card-title>
    <v-card-text>
      <v-container class="white container flex">
        <v-row no gutters>
          <v-col class="row flex-item">
            <database-selection
              :initial-databases="selectedDatabases"
              @selectionChanged="handleDatabaseChange"
            />
          </v-col>
          <v-col class="row flex-item">
            <metric-selection
              :initial-metrics="selectedMetrics"
              :available-metrics="availableMetrics"
              @selectionChanged="handleMetricChange"
            />
          </v-col>
        </v-row> </v-container
    ></v-card-text>
  </v-card>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  watch,
  computed,
  reactive,
  Ref,
  ref,
  onMounted,
} from "@vue/composition-api";

import { Database } from "@/types/database";
import DatabaseSelection from "@/components/selection/DatabaseSelection.vue";
import MetricSelection from "@/components/selection/MetricSelection.vue";
import {
  useDatabaseEvents,
  useMetricEvents,
  useWindowEvents,
} from "@/meta/events";
import { PageName } from "@/types/views";
import { Metric } from "@/types/metrics";
import { useFormatting } from "@/meta/formatting";

interface Data {
  selectedDatabases: Ref<readonly string[]>;
  availableMetrics: Ref<readonly Metric[]>;
  selectedMetrics: Ref<readonly Metric[]>;
  handleDatabaseChange: (databaseId: string, value: boolean) => void;
  handleMetricChange: (metric: Metric, value: boolean) => void;
  handleHistoricRangeChange: () => void;
  selectedHistoricRange: Ref<Number>;
  availableHistoricRanges: any;
  pageName: Ref<string>;
}

export default defineComponent({
  components: { DatabaseSelection, MetricSelection },
  setup(props: {}, context: SetupContext): Data {
    const { gethistoricRangeSeconds } = context.root.$metricController;
    const { emitSelectedDatabasesChangedWithinEvent } = useDatabaseEvents();
    const {
      emitSelectedMetricsChangedWithinEvent,
      emitWatchedMetricsChangedEvent,
    } = useMetricEvents();
    const {
      emitPageChangedEvent,
      emitHistoricRangeChangedEvent,
    } = useWindowEvents();
    const { formatMinutesToSeconds } = useFormatting();

    const availableHistoricRanges = [
      { text: "last 30 seconds", value: formatMinutesToSeconds(0.5) },
      { text: "last minute", value: formatMinutesToSeconds(1) },
      { text: "last 5 minutes", value: formatMinutesToSeconds(5) },
      { text: "last 10 minutes", value: formatMinutesToSeconds(10) },
      { text: "last 30 minutes", value: formatMinutesToSeconds(30) },
      { text: "last 60 minutes", value: formatMinutesToSeconds(60) },
    ];

    const selectedHistoricRange = ref<number>(gethistoricRangeSeconds());

    const page = computed(() => context.root.$route.name! as PageName);

    const selectedDatabases = computed(
      () => context.root.$selectionController.selectedDatabases[page.value]
    );
    const availableMetrics = computed(
      () => context.root.$selectionController.availableMetrics[page.value]
    );
    const selectedMetrics = computed(
      () => context.root.$selectionController.selectedMetrics[page.value]
    );

    watch(selectedMetrics, () => {
      emitWatchedMetricsChangedEvent(selectedMetrics.value as Metric[]);
    });

    watch(page, () => {
      emitPageChangedEvent(selectedMetrics.value as Metric[]);
    });

    //TODO: add historic range selection

    function handleHistoricRangeChange() {
      emitHistoricRangeChangedEvent(
        selectedMetrics.value as Metric[],
        selectedHistoricRange.value!
      );
    }

    function handleDatabaseChange(databaseId: string, value: boolean): void {
      emitSelectedDatabasesChangedWithinEvent(page.value, databaseId, value);
    }
    function handleMetricChange(metric: Metric, value: boolean): void {
      emitSelectedMetricsChangedWithinEvent(page.value, metric, value);
    }

    return {
      handleDatabaseChange,
      handleMetricChange,
      handleHistoricRangeChange,
      selectedDatabases,
      availableMetrics,
      selectedMetrics,
      availableHistoricRanges,
      selectedHistoricRange,
      pageName: computed(
        () => page.value[0].toUpperCase() + page.value.substring(1)
      ),
    };
  },
});
</script>
<style scoped>
.container {
  padding: 0px !important;
  margin: 0px !important;
  margin-top: -20px !important;
}
.row {
  padding: 0px 20px 0px 20px !important;
}
.flex {
  margin-top: 6px;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.flex-item {
  flex: 0 0 45%;
}
.selection-list {
  position: fixed;
  top: 100px;
  z-index: 10;
  min-width: 450px;
}
.selection {
  display: block;
  margin-right: auto !important;
}
.historic-range-selection {
  flex: 0 0 40%;
}
</style>
