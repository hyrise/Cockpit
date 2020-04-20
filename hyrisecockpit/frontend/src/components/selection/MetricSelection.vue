<template>
  <v-list class="list">
    <v-card flat>
      <v-card-title class="header subtitle-1">
        METRICS
      </v-card-title>
    </v-card>
    <v-list-item v-for="metric in availableMetrics" :key="metric">
      <v-list-item-title>
        <metric-chip
          :metric="metric"
          :selected="selectedMetrics[metric]"
          @toggleSelected="handleMetricSelection"
        />
      </v-list-item-title>
    </v-list-item>
  </v-list>
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

import MetricChip from "@/components/details/MetricChip.vue";
import { useDatabaseEvents } from "@/meta/events";
import { Metric } from "@/types/metrics";

interface Props {
  availableMetrics: Metric[];
  initialMetrics: string[];
}

interface Data {
  selectedMetrics: Ref<Record<Metric, boolean>>;
  handleMetricSelection: (metric: Metric, value: boolean) => void;
}

export default defineComponent({
  props: {
    initialMetrics: {
      type: Array,
      default: () => [],
    },
    availableMetrics: {
      type: Array,
      default: () => [],
    },
  },
  components: { MetricChip },
  setup(props: Props, context: SetupContext): Data {
    const selectedMetrics = ref<Record<Metric, boolean>>(initializeMetrics());

    watch(
      () => props.availableMetrics,
      () => {
        selectedMetrics.value = initializeMetrics();
      }
    );

    watch(
      () => props.initialMetrics,
      () => {
        const newSelected: Record<string, boolean> = {};
        Object.keys(selectedMetrics.value).forEach((database) => {
          newSelected[database] = props.initialMetrics.includes(database);
        });
        selectedMetrics.value = JSON.parse(JSON.stringify(newSelected));
      }
    );

    function initializeMetrics(): Record<Metric, boolean> {
      const newSelected: any = {};
      props.availableMetrics.forEach((metric) => {
        newSelected[metric] = true;
      });
      return newSelected;
    }

    function handleMetricSelection(metric: Metric, value: boolean): void {
      context.emit("selectionChanged", metric, value);
    }

    return {
      handleMetricSelection,
      selectedMetrics,
    };
  },
});
</script>
