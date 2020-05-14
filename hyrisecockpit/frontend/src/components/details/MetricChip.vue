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
    <v-tooltip right>
      <template v-slot:activator="{ on }">
        <b v-on="on">{{ truncateItemTitle(getMetricTitle(metric)) }}</b>
      </template>
      <span>{{ getMetricTitle(metric) }}</span>
    </v-tooltip>
  </v-chip>
</template>
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  computed,
  watch,
} from "@vue/composition-api";
import { Database } from "@/types/database";
import { Metric } from "@/types/metrics";
import { getMetricTitle } from "@/meta/metrics";
import { useSelectableItem, UseSelectableItem } from "@/meta/selection";

interface Data extends UseSelectableItem {
  getMetricTitle: (metric: Metric) => string;
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
      default: null,
    },
    selected: {
      type: Boolean,
      default: undefined,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      getMetricTitle,
      ...useSelectableItem(context),
    };
  },
});
</script>
<style scoped></style>
