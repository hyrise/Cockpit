<template>
  <v-card class="selection-list" data-id="selection-list">
    <v-system-bar :height="50" color="secondary">
      <v-card-title>
        <div class="header">{{ pageName }} Page Settings</div>
      </v-card-title>
      <v-spacer></v-spacer>
      <v-icon @click="$emit('close')">mdi-close</v-icon>
    </v-system-bar>

    <v-card-text class="title">
      <v-tabs
        v-if="open"
        v-model="tab"
        background-color="grey lighten-2"
        color="primary"
        height="45"
      >
        <v-tabs-slider color="primary"></v-tabs-slider>
        <v-tab class="body-2 font-weight-regular ml-2"
          >Databases and Metrics</v-tab
        >
        <v-tab class="body-2 font-weight-regular">Time Range</v-tab>
      </v-tabs>
      <v-divider />
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
          <v-subheader class="subtitle-2 mt-2 ml-1">
            Continuous Range
            <v-badge
              class="ml-2 mt-1"
              :color="!staticRange ? 'green' : 'red'"
              dot
            />
          </v-subheader>
          <v-sheet height="100" class="ml-4 mt-n3">
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
                <v-col>
                  <v-btn
                    data-id="reset-time-range"
                    class="button body-2 font-weight-regular"
                    color="primary"
                    :disabled="!staticRange"
                    @click="resetTimeRange"
                    >Apply</v-btn
                  >
                </v-col>
              </v-row>
            </v-container>
          </v-sheet>

          <v-subheader class="subtitle-2 mt-2 ml-1 mt-n3">
            Static Range
            <v-badge
              class="ml-2 mt-1"
              :color="staticRange ? 'green' : 'red'"
              dot
            />
          </v-subheader>
          <v-alert
            v-if="!!errorMessage"
            type="error"
            class="mt-n3 ml-3"
            max-width="510"
            dense
            text
            >{{ errorMessage }}</v-alert
          >
          <v-sheet height="200" width="700" class="ml-5 mt-n1">
            <v-container class="white container flex">
              <v-row no gutters>
                <v-col class="flex-item select remove-margin">
                  <timestamp-selection
                    label="Start"
                    @dateChanged="(newDate) => (startDate = newDate)"
                    @timeChanged="(newTime) => (startTime = newTime)"
                  />
                </v-col>
                <v-col class="flex-item select remove-margin">
                  <timestamp-selection
                    label="End"
                    :min-date="startDate"
                    :min-time="startTime"
                    @dateChanged="(newDate) => (endDate = newDate)"
                    @timeChanged="(newTime) => (endTime = newTime)"
                  />
                </v-col>
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
                <v-col>
                  <v-btn
                    data-id="set-static-time-range"
                    class="button body-2 font-weight-regular"
                    color="primary"
                    :disabled="invalidDates"
                    @click="setStaticTimeRange"
                    >Apply</v-btn
                  >
                </v-col>
              </v-row>
            </v-container>
          </v-sheet>
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
  watchEffect,
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
import { isInvalidDateTimeString, isInFuture } from "@/utils/methods";
interface Props {
  open: boolean;
}
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
  props: {
    open: {
      type: Boolean,
      default: false,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const page = computed(() => {
      const pageName = context.root.$route.name!;
      if (pageName === "home") return "overview";
      return pageName as PageName;
    });
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
  // update page
  watchEffect(() => emitPageChangedEvent(page.value));
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
  // variables
  availableStaticPrecisions: { text: string; value: number }[];
  endDate: Ref<string>;
  endTime: Ref<string>;
  startDate: Ref<string>;
  startTime: Ref<string>;
  staticPrecision: Ref<number>;
  // error handling
  errorMessage: Ref<string>;
  invalidDates: Ref<boolean>;
  maxPrecision: Ref<number>;
  // range handlers
  resetTimeRange: () => void;
  setStaticTimeRange: () => void;
  staticRange: Ref<boolean>;
}
function useStaticRangeSelection(
  context: SetupContext
): UseStaticRangeSelection {
  const { formatMinutesToSeconds, formatStringsToDate } = useFormatting();
  const { emitStaticRangeChangedEvent } = useWindowEvents();
  /* variables */
  const startDate = ref("");
  const startTime = ref("");
  const endDate = ref("");
  const endTime = ref("");
  const staticPrecision = ref(0);
  const invalidInput = computed(() =>
    [startDate.value, startTime.value, endDate.value, endTime.value].some(
      (value) => ["", null].includes(value) || isInvalidDateTimeString(value)
    )
  );
  /* set max selectable precision, depending on start and end date */
  const maxPrecision = computed(() =>
    !invalidInput.value
      ? (formatStringsToDate(endDate.value, endTime.value).getTime() -
          formatStringsToDate(startDate.value, startTime.value).getTime()) /
        Math.pow(10, 3)
      : 60
  );
  /* error handling of invalid dates and times */
  const errorMessage = ref("");
  const invalidDates = computed(() => {
    errorMessage.value = "";
    // case: input is invalid
    if (invalidInput.value)
      errorMessage.value = "The selected dates or times are invalid.";
    // case: precision is invalid
    if (
      formatStringsToDate(endDate.value, endTime.value).getTime() -
        formatStringsToDate(startDate.value, startTime.value).getTime() <=
      staticPrecision.value * Math.pow(10, 3)
    )
      errorMessage.value =
        "The selected range is too small for the selected precision.";
    // case: selected dates are in the future
    if (
      isInFuture(formatStringsToDate(startDate.value, startTime.value), 3) ||
      isInFuture(formatStringsToDate(endDate.value, endTime.value), 3)
    )
      errorMessage.value = "The selected dates and times are in the future.";
    return !!errorMessage.value;
  });
  const staticRange = computed(
    () => !!context.root.$selectionController.selectedStaticRange.value
  );
  /* range handlers */
  function setStaticTimeRange(): void {
    emitStaticRangeChangedEvent(
      formatStringsToDate(startDate.value, startTime.value),
      formatStringsToDate(endDate.value, endTime.value),
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
    errorMessage,
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
  top: 50px;
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
  font-size: medium;
}
.v-tab {
  text-transform: none !important;
}
.button {
  text-transform: none !important;
}
.title {
  margin: 0px;
  padding: 0px;
}
.remove-margin {
  margin: -10px;
}
.remove-margin-low {
  margin-top: -20px;
}
</style>
