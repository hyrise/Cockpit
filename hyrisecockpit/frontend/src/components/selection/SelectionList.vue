<template>
  <v-card class="selection-list">
    <v-card-title>
      <div class="selection">{{ pageName }}</div>
    </v-card-title>
    <v-card-text>
      <v-container class="white container">
        <v-row no gutters>
          <v-col class="row">
            <database-selection
              :initial-databases="selectedDatabases"
              @selectionChanged="handleDatabaseChange"
            />
          </v-col>
          <v-col class="row">
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
  onMounted
} from "@vue/composition-api";

import { Database } from "@/types/database";
import DatabaseSelection from "@/components/selection/DatabaseSelection.vue";
import MetricSelection from "@/components/selection/MetricSelection.vue";
import { useDatabaseEvents, useMetricEvents } from "@/meta/events";
import { PageName } from "@/types/views";
import { Metric } from "@/types/metrics";

interface Data {
  selectedDatabases: Ref<readonly string[]>;
  availableMetrics: Ref<readonly Metric[]>;
  selectedMetrics: Ref<readonly Metric[]>;
  handleDatabaseChange: (databaseId: string, value: boolean) => void;
  handleMetricChange: (metric: Metric, value: boolean) => void;
  pageName: Ref<string>;
}

export default defineComponent({
  components: { DatabaseSelection, MetricSelection },
  setup(props: {}, context: SetupContext): Data {
    const { emitSelectedDatabasesChangedWithinEvent } = useDatabaseEvents();
    const {
      emitSelectedMetricsChangedWithinEvent,
      emitWatchedMetricsChangedEvent
    } = useMetricEvents();

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

    watch([selectedMetrics, page], () => {
      emitWatchedMetricsChangedEvent(selectedMetrics.value as Metric[]);
    });

    function handleDatabaseChange(databaseId: string, value: boolean): void {
      emitSelectedDatabasesChangedWithinEvent(page.value, databaseId, value);
    }
    function handleMetricChange(metric: Metric, value: boolean): void {
      emitSelectedMetricsChangedWithinEvent(page.value, metric, value);
    }

    return {
      handleDatabaseChange,
      handleMetricChange,
      selectedDatabases,
      availableMetrics,
      selectedMetrics,
      pageName: computed(
        () => page.value[0].toUpperCase() + page.value.substring(1)
      )
    };
  }
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
.selection-list {
  position: fixed;
  top: 100px;
  z-index: 10;
  min-width: 450px;
}
.selection {
  display: block;
  margin-left: auto !important;
  margin-right: auto !important;
}
</style>
