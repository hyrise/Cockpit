<template>
  <v-chip id="metric-chip" class="white--text" color="secondary">
    <v-icon
      v-if="selected"
      id="add-select-metric-button"
      left
      @click="handleUnSelect(metric)"
      >mdi-eye</v-icon
    >
    <v-icon
      v-if="!selected"
      id="remove-select-metric-button"
      left
      @click="handleSelect(metric)"
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
import { useSelectableItem } from "@/meta/selection";

interface Data {
  getMetricTitle: (metric: Metric) => string;
  handleSelect: (metric: Metric) => void;
  handleUnSelect: (metric: Metric) => void;
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
    return {
      getMetricTitle,
      ...useSelectableItem(context)
    };
  }
});
</script>
<style scoped></style>
