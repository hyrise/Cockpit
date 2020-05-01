<template>
  <v-card id="selection-list" class="selection-list">
    <v-card-title>
      <div class="header">{{ pageName }}</div>
    </v-card-title>
    <v-card-text>
      <v-container class="white container flex">
        <v-row class="top-row" no gutters>
          <v-col class="flex-item select">
            <range-selection />
          </v-col>
          <v-col class="flex-item select">
            <precision-selection />
          </v-col>
        </v-row>
      </v-container>
      <v-container class="white container flex">
        <v-row no gutters>
          <v-col class="flex-item">
            <database-selection
              :initial-databases="selectedDatabases"
              @selectionChanged="handleDatabaseChange"
            />
          </v-col>
          <v-col class="flex-item">
            <metric-selection
              :initial-metrics="selectedMetrics"
              :available-metrics="availableMetrics"
              @selectionChanged="handleMetricChange"
            />
          </v-col>
        </v-row>
      </v-container>
    </v-card-text>
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
import RangeSelection from "@/components/selection/RangeSelection.vue";
import PrecisionSelection from "@/components/selection/PrecisionSelection.vue";
import {
  useDatabaseEvents,
  useMetricEvents,
  useWindowEvents,
} from "@/meta/events";
import { PageName } from "@/types/views";
import { Metric } from "@/types/metrics";

interface Data extends UseUpdatingInstances, UseChangeHandling {
  pageName: Ref<string>;
}

export default defineComponent({
  components: {
    DatabaseSelection,
    MetricSelection,
    RangeSelection,
    PrecisionSelection,
  },
  setup(props: {}, context: SetupContext): Data {
    const page = computed(() => context.root.$route.name! as PageName);

    return {
      pageName: computed(
        () => page.value[0].toUpperCase() + page.value.substring(1)
      ),
      ...useChangeHandling(context, page),
      ...useUpdatingInstances(context, page),
    };
  },
});

interface UseUpdatingInstances {
  selectedDatabases: Ref<readonly string[]>;
  availableMetrics: Ref<readonly Metric[]>;
  selectedMetrics: Ref<readonly Metric[]>;
}

function useUpdatingInstances(
  context: SetupContext,
  page: Ref<PageName>
): UseUpdatingInstances {
  return {
    selectedDatabases: context.root.$selectionController.selectedDatabases,
    selectedMetrics: context.root.$selectionController.selectedMetrics,
    availableMetrics: computed(
      () => context.root.$selectionController.availableMetrics[page.value]
    ),
  };
}

interface UseChangeHandling {
  handleDatabaseChange: (databaseId: string, value: boolean) => void;
  handleMetricChange: (metric: Metric, value: boolean) => void;
}

function useChangeHandling(
  context: SetupContext,
  page: Ref<PageName>
): UseChangeHandling {
  const { emitSelectedDatabasesChangedWithinEvent } = useDatabaseEvents();
  const { emitSelectedMetricsChangedWithinEvent } = useMetricEvents();
  const { emitPageChangedEvent } = useWindowEvents();

  watch(page, () => {
    emitPageChangedEvent(page.value);
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
  };
}
</script>
<style scoped>
.container {
  padding: 0px !important;
  margin: 0px !important;
  margin-top: -20px !important;
}
.flex {
  margin-top: 6px;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.flex-item {
  flex: 0 0 45%;
  margin-left: auto !important;
  margin-right: auto !important;
}
.selection-list {
  position: fixed;
  top: 100px;
  z-index: 10;
  min-width: 500px;
}
.top-row {
  margin-top: 6px;
}
.select {
  max-width: 200px;
}
.header {
  display: block;
  margin-left: auto !important;
  margin-right: auto !important;
}
</style>
