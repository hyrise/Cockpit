<template>
  <v-chip id="metric-chip" class="white--text" color="secondary">
    <v-icon
      v-if="selected"
      id="add-select-metric-button"
      left
      @click="handleUnSelect()"
      >mdi-eye</v-icon
    >
    <v-icon
      v-if="!selected"
      id="remove-select-metric-button"
      left
      @click="handleSelect()"
      >mdi-eye-off</v-icon
    >
    <b>{{ getMetricTitle(metric) }}</b>
  </v-chip>
</template>
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  computed,
  watch
} from "@vue/composition-api";
import { Database } from "@/types/database";
import { Metric } from "@/types/metrics";
import { getMetricTitle } from "@/meta/metrics";

interface Data {
  getMetricTitle: (metric: Metric) => string;
  handleSelect: () => void;
  handleUnSelect: () => void;
}

interface Props {
  metric: Metric;
  selected: boolean;
}

export default defineComponent({
  name: "DatabaseChip",
  props: {
    metric: {
      type: String,
      default: null
    },
    selected: {
      type: Boolean,
      default: undefined
    }
  },
  setup(props: Props, context: SetupContext): Data {
    function handleUnSelect(): void {
      context.emit("toggleSelected", props.metric, false);
    }
    function handleSelect(): void {
      context.emit("toggleSelected", props.metric, true);
    }
    return {
      handleSelect,
      handleUnSelect,
      getMetricTitle
    };
  }
});
</script>
<style scoped></style>
