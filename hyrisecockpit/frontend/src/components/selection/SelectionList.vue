<template>
  <v-card id="selection-list" class="selection-list">
    <v-card-title>
      <div class="header">{{ pageName }}</div>
    </v-card-title>
    <v-card-text>
      <v-tabs v-model="tab" grow background-color="white">
        <v-tab>DATA</v-tab>
        <v-tab>TIME</v-tab>
      </v-tabs>
      <v-tabs-items v-model="tab" color="primary">
        <v-tab-item>
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
        </v-tab-item>
        <v-tab-item>
          <v-window v-model="window">
            <v-window-item :value="1">
              <v-subheader class="mt-2">
                CONTINUOUS RANGE
                <v-badge class="ml-2 mt-1" :color="!staticRange ? 'green' : 'red'" dot />
              </v-subheader>
              <v-sheet height="330">
                <v-container class="white container flex">
                  <v-row class="top-row" no gutters>
                    <v-col class="flex-item select">
                      <range-selection :disabled="staticRange" />
                    </v-col>
                    <v-col class="flex-item select">
                      <precision-selection
                        :available-precisions="availablePrecisions"
                        :disabled="staticRange"
                      />
                    </v-col>
                  </v-row>
                </v-container>
                <v-btn
                  id="reset-time-range"
                  color="primary"
                  block
                  :disabled="!staticRange"
                  @click="resetTimeRange"
                >Set Continuous Time Range</v-btn>
              </v-sheet>
            </v-window-item>
            <v-window-item :value="2">
              <v-subheader class="mt-2">
                STATIC RANGE
                <v-badge class="ml-2 mt-1" :color="staticRange ? 'green' : 'red'" dot />
              </v-subheader>
              <v-sheet height="330">
                <v-container class="white container flex">
                  <v-row no gutters>
                    <v-col class="flex-item select">
                      <timestamp-selection
                        label="Start"
                        @dateChanged="(newDate) => (startDate = newDate)"
                        @timeChanged="(newTime) => (startTime = newTime)"
                      />
                    </v-col>
                    <v-col class="flex-item select">
                      <timestamp-selection
                        label="End"
                        :min-date="startDate"
                        :min-time="startTime"
                        @dateChanged="(newDate) => (endDate = newDate)"
                        @timeChanged="(newTime) => (endTime = newTime)"
                      />
                    </v-col>
                  </v-row>
                </v-container>
                <v-container class="white container flex">
                  <v-row no gutters>
                    <v-col class="flex-item select">
                      <precision-selection
                        :available-precisions="availableStaticPrecisions"
                        :global="false"
                        :max-precision="maxPrecision"
                        @precisionChanged="
                          (newPrecision) => (staticPrecision = newPrecision)
                        "
                      />
                    </v-col>
                  </v-row>
                </v-container>
                <v-btn
                  id="set-static-time-range"
                  color="primary"
                  block
                  :disabled="invalidDates"
                  @click="setStaticTimeRange"
                >Set Static Time Range</v-btn>
              </v-sheet>
            </v-window-item>
          </v-window>
          <v-divider class="my-2" />
          <v-card flat>
            <v-card-actions>
              <v-spacer />
              <v-tooltip top>
                <template v-slot:activator="{ on }">
                  <v-btn
                    id="change-range-type"
                    v-on="on"
                    color="white"
                    depressed
                    @click="window = window == 1 ? 2 : 1"
                  >{{ window == 1 ? "STATIC" : "CONTINUOUS" }}</v-btn>
                </template>
                <span>
                  Select {{ window == 1 ? "Static" : "Continuous" }} Range
                  Type
                </span>
              </v-tooltip>
            </v-card-actions>
          </v-card>
        </v-tab-item>
      </v-tabs-items>
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
import TimestampSelection from "@/components/selection/TimestampSelection.vue";
import {
  useDatabaseEvents,
  useMetricEvents,
  useWindowEvents,
} from "@/meta/events";
import { PageName } from "@/types/views";
import { Metric } from "@/types/metrics";
import { useFormatting } from "@/meta/formatting";

interface Data
  extends UseGlobalInstances,
    UseDataChangeHandling,
    UseStaticRangeSelection {
  pageName: Ref<string>;
  tab: Ref<number>;
  window: Ref<number>;
}

export default defineComponent({
  components: {
    DatabaseSelection,
    MetricSelection,
    PrecisionSelection,
    RangeSelection,
    TimestampSelection,
  },
  setup(props: {}, context: SetupContext): Data {
    const page = computed(() => context.root.$route.name! as PageName);

    return {
      pageName: computed(
        () => page.value[0].toUpperCase() + page.value.substring(1)
      ),
      tab: ref(0),
      window: ref(1),
      ...useDataChangeHandling(context, page),
      ...useGlobalInstances(context, page),
      ...useStaticRangeSelection(context),
    };
  },
});

interface UseGlobalInstances {
  availableMetrics: Ref<readonly Metric[]>;
  availablePrecisions: { text: string; value: number }[];
  selectedDatabases: Ref<readonly string[]>;
  selectedMetrics: Ref<readonly Metric[]>;
}

function useGlobalInstances(
  context: SetupContext,
  page: Ref<PageName>
): UseGlobalInstances {
  const { formatMinutesToSeconds } = useFormatting();
  return {
    availableMetrics: computed(
      () => context.root.$selectionController.availableMetrics[page.value]
    ),
    availablePrecisions: [
      { text: "1 second", value: 1 },
      { text: "5 seconds", value: 5 },
      { text: "15 seconds", value: 15 },
      { text: "30 seconds", value: 30 },
      { text: "1 minute", value: formatMinutesToSeconds(1) },
      { text: "5 minutes", value: formatMinutesToSeconds(5) },
    ],
    selectedDatabases: context.root.$selectionController.selectedDatabases,
    selectedMetrics: context.root.$selectionController.selectedMetrics,
  };
}

interface UseDataChangeHandling {
  handleDatabaseChange: (databaseId: string, value: boolean) => void;
  handleMetricChange: (metric: Metric, value: boolean) => void;
}

function useDataChangeHandling(
  context: SetupContext,
  page: Ref<PageName>
): UseDataChangeHandling {
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

interface UseStaticRangeSelection {
  availableStaticPrecisions: { text: string; value: number }[];
  staticPrecision: Ref<number>;
  maxPrecision: Ref<number>;
  startDate: Ref<string>;
  startTime: Ref<string>;
  endDate: Ref<string>;
  endTime: Ref<string>;
  invalidDates: Ref<boolean>;
  setStaticTimeRange: () => void;
  resetTimeRange: () => void;
  staticRange: Ref<boolean>;
}

function useStaticRangeSelection(
  context: SetupContext
): UseStaticRangeSelection {
  const { formatMinutesToSeconds } = useFormatting();
  const { emitStaticRangeChangedEvent } = useWindowEvents();

  const startDate = ref("");
  const startTime = ref("");
  const endDate = ref("");
  const endTime = ref("");

  const staticPrecision = ref(0);
  const maxPrecision = computed(() =>
    ![
      startDate.value,
      startTime.value,
      endDate.value,
      endTime.value,
    ].some((value) => ["", null].includes(value))
      ? (getDate(endDate.value, endTime.value).getTime() -
          getDate(startDate.value, startTime.value).getTime()) /
        Math.pow(10, 3)
      : 60
  );
  const staticRange = computed(
    () => !!context.root.$selectionController.selectedStaticRange.value
  );

  function getDate(dateString: string, timeString: string): Date {
    return new Date(`${dateString}T${timeString}`);
  }

  const invalidDates = computed(
    () =>
      [
        startDate.value,
        startTime.value,
        endDate.value,
        endTime.value,
      ].some((value) => ["", null].includes(value)) ||
      getDate(endDate.value, endTime.value).getTime() -
        getDate(startDate.value, startTime.value).getTime() <=
        staticPrecision.value * Math.pow(10, 3)
  );

  function setStaticTimeRange(): void {
    emitStaticRangeChangedEvent(
      getDate(startDate.value, startTime.value),
      getDate(endDate.value, endTime.value),
      staticPrecision.value
    );
  }

  function resetTimeRange(): void {
    emitStaticRangeChangedEvent();
  }

  return {
    startDate,
    startTime,
    endDate,
    endTime,
    invalidDates,
    setStaticTimeRange,
    staticPrecision,
    availableStaticPrecisions: [
      { text: "1 second", value: 1 },
      { text: "5 seconds", value: 5 },
      { text: "15 seconds", value: 15 },
      { text: "30 seconds", value: 30 },
      { text: "1 minute", value: formatMinutesToSeconds(1) },
      { text: "5 minutes", value: formatMinutesToSeconds(5) },
      { text: "15 minutes", value: formatMinutesToSeconds(15) },
      { text: "30 minutes", value: formatMinutesToSeconds(30) },
      { text: "1 hour", value: formatMinutesToSeconds(60) },
    ],
    maxPrecision,
    staticRange,
    resetTimeRange,
  };
}
</script>
<style scoped>
.container {
  padding: 0px !important;
  margin: 0px !important;
}
.flex {
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
